import time, re
from pyspark import SparkContext, SparkConf

def linesToWordsFunc(line):
    wordsList = line.split()
    wordsList = [re.sub(r'\W+', '', word) for word in wordsList]
    filtered = filter(lambda word: re.match(r'\w+', word), wordsList)
    return filtered

def wordsToPairsFunc(word):
    return (word, 1)

def reduceToCount(a, b):
    return (a + b)

def main():
    conf = SparkConf().setAppName("Words count").setMaster("local")
    sc = SparkContext(conf=conf)
    # rdd = sc.textFile("IMPRESSIONDallas.csv")
    rdd = sc.textFile("hdfs://localhost:9000/user/hadoop/canoe/IMPRESSIONDallas.csv")

    words = rdd.flatMap(linesToWordsFunc)
    pairs = words.map(wordsToPairsFunc)
    counts = pairs.reduceByKey(reduceToCount)

    # Get the first top 100 words
    output = counts.takeOrdered(100, lambda (k, v): -v)

    for(word, count) in output:
        print word + ': ' + str(count)

    sc.stop()

if __name__ == "__main__":
    main()

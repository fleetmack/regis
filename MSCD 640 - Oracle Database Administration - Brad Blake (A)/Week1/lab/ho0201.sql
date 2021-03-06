CREATE TABLE "CLASSMATE"."WANT_AD" ("AD_ID" NUMBER(10) NOT NULL, 
    "HEADLINE" VARCHAR2(20 byte) NOT NULL, "AD_TEXT" VARCHAR2(50 
    byte), "AD_OWNER" NUMBER(10) NOT NULL, 
    CONSTRAINT "T_AD_PK" PRIMARY KEY("AD_ID") 
    USING INDEX  
    TABLESPACE "USERS" 
    STORAGE ( INITIAL 64K NEXT 0K MINEXTENTS 1 MAXEXTENTS 
    2147483645 PCTINCREASE 0) PCTFREE 10 INITRANS 2 MAXTRANS 255,
    CONSTRAINT "WANT_AD_OWNER_FK" FOREIGN KEY("AD_OWNER") 
    REFERENCES "CLASSMATE"."CLIENT"("CLIENT_ID"))  
    TABLESPACE "USERS" PCTFREE 10 PCTUSED 0 INITRANS 1 MAXTRANS 
    255 
    STORAGE ( INITIAL 64K NEXT 0K MINEXTENTS 1 MAXEXTENTS 
    2147483645 PCTINCREASE 0) 
    LOGGING 
    MONITORING 
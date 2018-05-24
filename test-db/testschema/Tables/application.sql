DROP TABLE testschema.application;

CREATE TABLE IF NOT EXISTS testschema.application(
    application_id                  INTEGER NOT NULL,
    application_cd                  CHARACTER VARYING(206) NOT NULL
)
WITH (
OIDS=FALSE
);

CREATE TABLE _ressources (
    code_R VARCHAR(255),  
    lib_R VARCHAR(255),
    nb_h_CM_PN NUMERIC(3),
    nb_h_TD_PN NUMERIC(3),
    nb_h_TP_PN NUMERIC(3),
    PRIMARY KEY (code_R)
);

CREATE TABLE _parcours (
    code_P VARCHAR(255),  
    libelle_parcours VARCHAR(255),
    nbre_gpe_TD_P NUMERIC(3),
    nbre_gpe_TP_P NUMERIC(3),
    PRIMARY KEY (code_P)
);

CREATE TABLE _sae (
    code_SAE VARCHAR(255),  
    lib_sae VARCHAR(255),
    nb_h_TD_enc NUMERIC(3),
    nbre_gpe_TP_projet_autonomie NUMERIC(3),
    PRIMARY KEY (code_SAE)
);

CREATE TABLE _ue (
    code_UE VARCHAR(255),  
    PRIMARY KEY (code_UE)
);

CREATE TABLE _semestre (
    numero_sem VARCHAR(255),  
    PRIMARY KEY (numero_sem)
);

CREATE TABLE _niveau (
    numero_N VARCHAR(255),  
    PRIMARY KEY (numero_N)
);

CREATE TABLE _competences (
    lib_competence VARCHAR(255),  
    PRIMARY KEY (lib_competence)
);

CREATE TABLE _activites (
    lib_activite VARCHAR(255),  
    PRIMARY KEY (lib_activite)
);

CREATE TABLE _comprend_r (
    nb_h_TD_C NUMERIC(3),  
    nb_h_TP_C NUMERIC(3), 
    code_R VARCHAR(255),
    code_SAE VARCHAR(255),
    PRIMARY KEY (code_R, code_SAE),
    FOREIGN KEY (code_R) REFERENCES _ressources(code_R),
    FOREIGN KEY (code_SAE) REFERENCES _sae(code_SAE)
);

CREATE TABLE _correspond (
    lib_activite VARCHAR(255),
    code_P VARCHAR(255),
    numero_N NUMERIC(3),
    PRIMARY KEY (lib_activite, code_P, numero_N),
    FOREIGN KEY (lib_activite) REFERENCES _activites(lib_activite),
    FOREIGN KEY (code_P) REFERENCES _parcours(code_P)
    FOREIGN KEY (numero_N) REFERENCES _niveau(numero_N)
);

CREATE TABLE _est_enseignee (
    code_P VARCHAR(255),
    code_R VARCHAR(255),
    PRIMARY KEY (code_P, code_R),
    FOREIGN KEY (code_P) REFERENCES _parcours(code_P)
    FOREIGN KEY (code_R) REFERENCES _ressources(code_R)
);

CREATE TABLE _relève_de (
    lib_activite VARCHAR(255),
    lib_competence VARCHAR(255),
    PRIMARY KEY (lib_activite, lib_competence),
    FOREIGN KEY (lib_activite) REFERENCES _activites(lib_activite),
    FOREIGN KEY (lib_competence) REFERENCES _competences(lib_competence)
);

CREATE TABLE _est_réalisee_dans (
    lib_activite VARCHAR(255),
    code_UE VARCHAR(255),
    PRIMARY KEY (lib_activite, code_UE),
    FOREIGN KEY (lib_activite) REFERENCES _activites(lib_activite),
    FOREIGN KEY (code_UE) REFERENCES _ue(code_UE)
);


CREATE TABLE _dans (
    code_UE VARCHAR(255),
    numero_sem VARCHAR(255),
    PRIMARY KEY (code_UE, numero_sem ),
    FOREIGN KEY (code_UE) REFERENCES _ue(code_UE),
    FOREIGN KEY (numero_sem ) REFERENCES _semestre(numero_sem)
);

CREATE TABLE _fait_partie (
    numero_N VARCHAR(255),
    numero_sem VARCHAR(255),
    PRIMARY KEY (numero_N, numero_sem),
    FOREIGN KEY (numero_N) REFERENCES _niveau(numero_N),
    FOREIGN KEY (numero_sem) REFERENCES _semestre(numero_sem)
);

CREATE TABLE _quand (
    code_R VARCHAR(255),
    numero_sem VARCHAR(255),
    PRIMARY KEY (code_R, numero_sem),
    FOREIGN KEY (code_R) REFERENCES _ressources(code_R),
    FOREIGN KEY (numero_sem) REFERENCES _semestre(numero_sem)
);

CREATE TABLE ressources (
    code_R VARCHAR(255),  
    lib_R VARCHAR(255),
    nb_h_CM_PN NUMERIC(3),
    nb_h_TD_PN NUMERIC(3),
    nb_h_TP_PN NUMERIC(3),
    PRIMARY KEY (code_R)
);

CREATE TABLE parcours (
    code_P VARCHAR(255),  
    libelle_parcours VARCHAR(255),
    nbre_gpe_TD_P NUMERIC(3),
    nbre_gpe_TP_P NUMERIC(3),
    PRIMARY KEY (code_P)
);

CREATE TABLE sae (
    code_SAE VARCHAR(255),  
    lib_sae VARCHAR(255),
    nb_h_TD_enc NUMERIC(3),
    nbre_gpe_TP_projet_autonomie NUMERIC(3),
    PRIMARY KEY (code_SAE)
);

CREATE TABLE ue (
    code_UE VARCHAR(255),  
    PRIMARY KEY (code_UE)
);

CREATE TABLE niveau (
    numero_N VARCHAR(255),  
    PRIMARY KEY (numero_N)
);

CREATE TABLE competences (
    lib_competence VARCHAR(255),  
    PRIMARY KEY (lib_competence)
);

CREATE TABLE activites (
    lib_activite VARCHAR(255),  
    PRIMARY KEY (lib_activite)
);

CREATE TABLE comprend_r (
    nb_h_TD_C NUMERIC(3),  
    nb_h_TP_C NUMERIC(3), 
    code_R VARCHAR(255),
    code_SAE VARCHAR(255),
    PRIMARY KEY (code_R, code_SAE),
    FOREIGN KEY (code_R) REFERENCES Ressources(code_R),
    FOREIGN KEY (code_SAE) REFERENCES SAE(code_SAE)
);

CREATE TABLE correspond (
    lib_activite VARCHAR(255),
    code_P VARCHAR(255),
    numero_N NUMERIC(3),
    PRIMARY KEY (lib_activite, code_P, numero_N),
    FOREIGN KEY (lib_activite) REFERENCES activites(lib_activite),
    FOREIGN KEY (code_P) REFERENCES parcours(code_P)
    FOREIGN KEY (numero_N) REFERENCES niveau(numero_N)
);


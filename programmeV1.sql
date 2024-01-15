CREATE TABLE ressources (
    code_R VARCHAR(255),  
    lib_R VARCHAR(255),
    nb_h_CM_PN INT,
    nb_h_TD_PN INT,
    nb_h_TP_PN INT,
    PRIMARY KEY (code_R)
);

CREATE TABLE parcours (
    code_P VARCHAR(255),  
    libelle_parcours VARCHAR(255),
    nbre_gpe_TD_P INT,
    nbre_gpe_TP_P INT,
    PRIMARY KEY (code_P)
);

CREATE TABLE SAE (
    code_SAE VARCHAR(255),  
    lib_sae VARCHAR(255),
    nb_h_TD_enc INT,
    nbre_gpe_TP_projet_autonomie INT,
    PRIMARY KEY (code_SAE)
);

CREATE TABLE UE (
    code_UE VARCHAR(255),  
    PRIMARY KEY (code_UE)
);

CREATE TABLE semestre (
    munero_sem VARCHAR(255),  
    PRIMARY KEY (numero_sem)
);

CREATE TABLE niveau (
    munero_N VARCHAR(255),  
    PRIMARY KEY (numero_N)
);

CREATE TABLE competences (
    lib_competence VARCHAR(255),  
    PRIMARY KEY (lib_competence)
);

CREATE TABLE comprend_r (
    nb_h_TD_C INT,  
    nb_h_TP_C INT, 
    PRIMARY KEY (nb_h_TD_C)
);
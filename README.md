# Qodex
# 📚 Qodex - Système de Gestion de Quiz

**Qodex** est une plateforme web dédiée à l'organisation et la participation aux hackathons et aux examens en ligne. Ce projet concerne la conception et l'implémentation de la **base de données relationnelle (SQL)** pour gérer les utilisateurs, les quiz, les questions et les résultats.

---

## 🚀 Fonctionnalités

Cette base de données permet de :
* **Gérer les utilisateurs** : Distinction entre les rôles (Enseignant / Étudiant).
* **Créer des Quiz** : Les enseignants peuvent créer des quiz avec une durée et une catégorie spécifiques.
* **Banque de Questions** : Stockage des questions et des réponses correctes associées aux quiz.
* **Suivi des Résultats** : Enregistrement des scores et des dates de passage pour chaque étudiant.
* **Analyses** : Requêtes SQL pour filtrer, trier et analyser les performances (Top scores, statistiques par quiz, etc.).

---

## 🛠️ Structure de la Base de Données (Schéma)

Le projet contient **5 tables principales** liées entre elles :

### 1. `Utilisateurs`
Stocke les informations de connexion et le rôle.
* `id_utilisateur` (PK)
* `nom`, `email`, `motdepasse`
* `role` ('enseignant', 'etudiant')

### 2. `Categories`
Les thématiques des quiz (ex: Mathématiques, Informatique).
* `id_categorie` (PK)
* `nom_categorie`

### 3. `Quiz`
Les examens créés par les enseignants.
* `id_quiz` (PK)
* `titre_quiz`, `description`, `duree_minutes`
* `id_enseignant` (FK), `id_categorie` (FK)

### 4. `Questions`
Les questions liées à chaque quiz.
* `id_question` (PK)
* `texte_question`, `reponse_correcte`, `points`
* `id_quiz` (FK)

### 5. `Resultats`
Les performances des étudiants.
* `id_resultat` (PK)
* `score`, `date_passage`
* `id_etudiant` (FK), `id_quiz` (FK)

---

## 📊 Diagramme Entité-Relation (ERD)

La base de données respecte les relations suivantes :
* Un **Enseignant** crée plusieurs **Quiz**.
* Un **Quiz** appartient à une **Catégorie**.
* Un **Quiz** contient plusieurs **Questions**.
* Un **Étudiant** passe plusieurs **Quiz** et obtient des **Résultats**.

---

## 💻 Installation et Utilisation

Pour tester ce projet sur votre machine (via XAMPP, WAMP ou MySQL Workbench) :

1.  **Créer la base de données :**
    ```sql
    CREATE DATABASE Qodex;
    USE Qodex;
    ```

2.  **Exécuter le script de création (`schema.sql`) :**
    Copiez et exécutez le code SQL pour créer les tables avec les contraintes (PK, FK).

3.  **Insérer les données de test (`data.sql`) :**
    Exécutez les requêtes `INSERT INTO` pour ajouter des utilisateurs et des quiz fictifs.

4.  **Lancer les requêtes :**
    Le projet inclut **23 requêtes SQL** (+ Bonus) pour tester toutes les fonctionnalités (Filtrage, Jointures, Agrégations).

---


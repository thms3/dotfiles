function rename_article() {
    # Vérifier si deux arguments ont été fournis
    if [ $# -ne 2 ]; then
        echo "Veuillez fournir un titre d'article en premier argument et le chemin vers le fichier en second argument."
        return 1
    fi

    # Récupérer le titre d'article et le chemin du fichier de la ligne de commande
    titre=$1
    chemin_fichier=$2

    # Supprimer les apostrophes et guillemets
    titre=$(echo $titre | tr -d "\"'")
    # Remplacer les espaces par des underscores
    titre=$(echo $titre | tr ' ' '_')
    # Remplacer les "\" par "-"
    titre=$(echo $titre | tr "/" "-" ) 

    # Ajouter l'extension ".pdf" au titre
    titre="$titre.pdf"

    # Extraire le nom du fichier et le chemin du répertoire
    nom_fichier=$(basename "$chemin_fichier")
    repertoire=$(dirname "$chemin_fichier")

    # Renommer le fichier
    nouveau_nom="$repertoire/$titre"

    # Déplacer et renommer le fichier
    mv "$2" "$nouveau_nom"

    # Afficher le résultat
    echo "Le fichier a été renommé en : $nouveau_nom"
}


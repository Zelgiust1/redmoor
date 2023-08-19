<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>REDMOOR</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            background-image: url("https://storage.googleapis.com/redmoorapp/img/back3.png");
            background-size: contain;
            background-position: center top;
            background-repeat: no-repeat;
            background-attachment: fixed;
            color: #EEE;
        }

        button {
            background-color: transparent;
            border: none;
            color: white;
            padding: 0;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 0;
            margin: 2px 2px;
            cursor: pointer;
        }

        .fouille-button {
            background-image: url("https://storage.googleapis.com/redmoorapp/img/fouille.png");
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            width: 200px;
            height: 200px;
        }
        
        .attaque-button {
            background-color: black;
            border: none;
            border-radius: 50px; /* pour rendre le bouton ovale */
            color: white;
            padding: 15px 32px;
            text-align: center;
            text-decoration: none;
            font-size: 22px;
            margin: 2px 2px;
            cursor: pointer;
        }

     .loupe-text {
    display: block;
    font-size: 24px; /* Ajustez la taille du texte comme vous le souhaitez */
    font-weight: bold; /* Pour rendre le texte en gras */
    border: 10px solid black; /* Pour ajouter un encadré noir */
    border-radius: 50px; /* pour rendre le bouton ovale */
    padding: 10px; /* Espace à l'intérieur de l'encadré */
   background-color: rgb(65, 0, 0); /* Couleur de fond de l'encadré */
    color: white; /* Couleur du texte */
}

        .ia-monstres-button {
            background-color: black;
            border: none;
            border-radius: 50px; /* pour rendre le bouton ovale */
            color: white;
            padding: 15px 32px;
            text-align: center;
            text-decoration: none;
            font-size: 22px;
            margin: 2px 2px;
            cursor: pointer;
        }
        
        img {
            max-width: 100%;
            max-height: 100%;
        }

        h1 {
            font-size: 35px;
            margin-bottom: 0;
        }

        h2 {
            font-size: 20px;
            margin-top: 0;
        }

        #generateFouilleResultButton:hover {
            cursor: pointer;
        }

        #generateEventButton {
            background-color: black;
            border: none;
            border-radius: 50px; /* pour rendre le bouton ovale */
            color: white;
            padding: 15px 32px;
            text-align: center;
            text-decoration: none;
            font-size: 22px;
            margin: 2px 2px;
            cursor: pointer;
        }

        .potion-button {
            background-color: black;
            color: white;
            border: none;
            border-radius: 50px;
            padding: 10px;
            margin: 10px;
            font-size: 14px;
            cursor: pointer;
        }

        #buttonContainer {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            margin-top: 20px;
        }

        #buttonContainer button {
            margin-top: 10px;
        }

        #randomImageContainer {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 300px;
        }
    </style>
</head>
<body>

 <audio id="eventAudio">
        <source id="eventAudioSource" src="" type="audio/mpeg">
        Your browser does not support the audio element.
    </audio>

    <div id="randomImageContainer">
	<img id="randomImage" src="" alt="" />
<span id="loupeText" class="loupe-text">Touchez la loupe ...</span>


    <button id="playAudioButton">Lire l'Audio</button>
    </div>
    <button id="generateEventButton" style="display: none;">GENERER !</button>

    <div id="buttonContainer">

        <button class="fouille-button" id="generateFouilleResultButton"></button>
        <button class="attaque-button" id="attaqueButton" onclick="displayWeightedRandomAttackImage([
            { file: 'https://storage.googleapis.com/redmoorapp/attaques/attaque1.png', weight: 4 },
            { file: 'https://storage.googleapis.com/redmoorapp/attaques/attaque2.png', weight: 5 },
            { file: 'https://storage.googleapis.com/redmoorapp/attaques/attaque3.png', weight: 1 }
        ])">Attaque de monstre</button>
        <button class="ia-monstres-button" id="iaMonstresButton" onclick="displayRandomMonsterAIImage()">IA des monstres</button>
        <div id="generateButtonContainer"></div>
        <div>
            <button class="potion-button" id="potionButton1" onclick="displayWeightedRandomPotionImage(1, [
                { file: 'https://storage.googleapis.com/redmoorapp/potions/potion1.png', weight: 5 },
                { file: 'https://storage.googleapis.com/redmoorapp/potions/potion2.png', weight: 3 },
                { file: 'https://storage.googleapis.com/redmoorapp/potions/potion3.png', weight: 2 }
            ])">1-soin</button>
            <button class="potion-button" id="potionButton2" onclick="displayWeightedRandomPotionImage(2, [
                { file: 'https://storage.googleapis.com/redmoorapp/potions/potion4.png', weight: 5 },
                { file: 'https://storage.googleapis.com/redmoorapp/potions/potion5.png', weight: 3 },
                { file: 'https://storage.googleapis.com/redmoorapp/potions/potion6.png', weight: 2 }
            ])">2-vitesse</button>
            <button class="potion-button" id="potionButton3" onclick="displayWeightedRandomPotionImage(3, [
                { file: 'https://storage.googleapis.com/redmoorapp/potions/potion7.png', weight: 5 },
                { file: 'https://storage.googleapis.com/redmoorapp/potions/potion8.png', weight: 3 },
                { file: 'https://storage.googleapis.com/redmoorapp/potions/potion9.png', weight: 2 }
            ])">3-ombre</button>
            <button class="potion-button" id="potionButton4" onclick="displayWeightedRandomPotionImage(4, [
                { file: 'https://storage.googleapis.com/redmoorapp/potions/potion10.png', weight: 5 },
                { file: 'https://storage.googleapis.com/redmoorapp/potions/potion11.png', weight: 3 },
                { file: 'https://storage.googleapis.com/redmoorapp/potions/potion12.png', weight: 2 }
            ])">4-savoir</button>
            <button class="potion-button" id="potionButton5" onclick="displayWeightedRandomPotionImage(5, [
                { file: 'https://storage.googleapis.com/redmoorapp/potions/potion13.png', weight: 5 },
                { file: 'https://storage.googleapis.com/redmoorapp/potions/potion14.png', weight: 3 },
                { file: 'https://storage.googleapis.com/redmoorapp/potions/potion15.png', weight: 2 }
            ])">5-puissance</button>
            <button class="potion-button" id="potionButton6" onclick="displayWeightedRandomPotionImage(6, [
                { file: 'https://storage.googleapis.com/redmoorapp/potions/potion4.png', weight: 3 },
                { file: 'https://storage.googleapis.com/redmoorapp/potions/potion5.png', weight: 2 },
                { file: 'https://storage.googleapis.com/redmoorapp/potions/potion6.png', weight: 1 },
                { file: 'https://storage.googleapis.com/redmoorapp/potions/potion1.png', weight: 3 },
                { file: 'https://storage.googleapis.com/redmoorapp/potions/potion2.png', weight: 2 },
                { file: 'https://storage.googleapis.com/redmoorapp/potions/potion3.png', weight: 1 },
                { file: 'https://storage.googleapis.com/redmoorapp/potions/potion7.png', weight: 3 },
                { file: 'https://storage.googleapis.com/redmoorapp/potions/potion8.png', weight: 2 },
                { file: 'https://storage.googleapis.com/redmoorapp/potions/potion9.png', weight: 1 },
                { file: 'https://storage.googleapis.com/redmoorapp/potions/potion10.png', weight: 3 },
                { file: 'https://storage.googleapis.com/redmoorapp/potions/potion11.png', weight: 2 },
                { file: 'https://storage.googleapis.com/redmoorapp/potions/potion12.png', weight: 1 },
                { file: 'https://storage.googleapis.com/redmoorapp/potions/potion13.png', weight: 3 },
                { file: 'https://storage.googleapis.com/redmoorapp/potions/potion14.png', weight: 2 },
                { file: 'https://storage.googleapis.com/redmoorapp/potions/potion15.png', weight: 1 },
                { file: 'https://storage.googleapis.com/redmoorapp/potions/potion16.png', weight: 3 },
                { file: 'https://storage.googleapis.com/redmoorapp/potions/potion17.png', weight: 2 },
                { file: 'https://storage.googleapis.com/redmoorapp/potions/potion18.png', weight: 1 }
            ])">"?"</button>
        </div>
    </div>

    <script>
    const playAudioButton = document.getElementById("playAudioButton");
const eventAudioSourceElement = document.getElementById("eventAudioSource");
        const randomImageElement = document.getElementById("randomImage");
        const generateEventButton = document.getElementById("generateEventButton");
        const totalImages = 16;  // CHANGER 2 en le nombre d'event qu'il y a 

        const imageToAudioMap = {
            "1.png": "1.mp3",
            "2.png": "2.mp3",
"3.png": "3.mp3",
"4.png": "4.mp3",
"5.png": "5.mp3",
"6.png": "6.mp3",
"7.png": "7.mp3",
"8.png": "8.mp3",
"9.png": "9.mp3",
"10.png": "10.mp3",
"11.png": "11.mp3",
"12.png": "12.mp3",
"13.png": "13.mp3",
"14.png": "14.mp3",
"15.png": "15.mp3",
"16.png": "16.mp3",
"17.png": "17.mp3",
"18.png": "18.mp3",
"19.png": "19.mp3",
"20.png": "20.mp3",
"21.png": "21.mp3",
"22.png": "22.mp3",
"23.png": "23.mp3",
"24.png": "24.mp3",
"25.png": "25.mp3",
"26.png": "26.mp3",
"27.png": "27.mp3",
"28.png": "28.mp3",
"29.png": "29.mp3",
"30.png": "30.mp3",
            // Ajoutez les autres correspondances ici
        };

        function generateRandomEventImage() {
            const randomIndex = Math.floor(Math.random() * totalImages) + 1;
            const eventImageName = `${randomIndex}.png`;
            const eventAudioName = imageToAudioMap[eventImageName] || "";

            return {
                imageURL: `https://storage.googleapis.com/redmoorapp/img/${eventImageName}`,
                audioURL: `https://storage.googleapis.com/redmoorapp/audio/${eventAudioName}`
            };
        }

        generateEventButton.addEventListener("click", () => {
            const randomEvent = generateRandomEventImage();
    const eventImageElement = document.getElementById("eventImage");
            randomImageElement.src = randomEvent.imageURL;
            randomImageElement.alt = randomEvent.imageURL.replace(".png", "");
            generateEventButton.style.display = "none";
            
            if (randomEvent.audioURL) {
                const eventAudioElement = document.getElementById("eventAudio");
                const eventAudioSourceElement = document.getElementById("eventAudioSource");
                eventAudioSourceElement.src = randomEvent.audioURL;
                eventAudioElement.load();
                eventAudioElement.play();
            }
        });

        const weightedRandomFouilleResults = [
            { file: "https://storage.googleapis.com/redmoorapp/img/Piege3.png", weight: 15 },
            { file: "https://storage.googleapis.com/redmoorapp/img/Monstres1.png", weight: 11},
            { file: "https://storage.googleapis.com/redmoorapp/img/Monstres2.png", weight: 5 },
            { file: "https://storage.googleapis.com/redmoorapp/img/Monstres3.png", weight: 2 },
            { file: "https://storage.googleapis.com/redmoorapp/img/20or2.png", weight: 5 },
            { file: "https://storage.googleapis.com/redmoorapp/img/50or2.png", weight: 3 },
            { file: "https://storage.googleapis.com/redmoorapp/img/Source2.png", weight: 20 },
            { file: "https://storage.googleapis.com/redmoorapp/img/Source_superieure.png", weight: 2 },
            { file: "https://storage.googleapis.com/redmoorapp/img/Tresor_superieur.png", weight: 2},
            { file: "https://storage.googleapis.com/redmoorapp/img/Evenement2.png", weight: 35 }
        ];

        function generateRandomFouilleResult() {
            let totalWeight = 0;
            for (let i = 0; i < weightedRandomFouilleResults.length; i++) {
                totalWeight += weightedRandomFouilleResults[i].weight;
            }

            const randomWeight = Math.floor(Math.random() * totalWeight);
            let weightSum = 0;
            for (let i = 0; i < weightedRandomFouilleResults.length; i++) {
                weightSum += weightedRandomFouilleResults[i].weight;
                if (randomWeight < weightSum) {
                    return weightedRandomFouilleResults[i].file;
                }
            }
        }

    
        function displayFouilleResult() {
            const randomFouilleResult = generateRandomFouilleResult();
            randomImageElement.src = randomFouilleResult;
            randomImageElement.alt = randomFouilleResult.replace(".png", "");

            if (randomFouilleResult === "https://storage.googleapis.com/redmoorapp/img/Evenement2.png") {
                generateEventButton.style.display = "inline-block";
                generateEventButton.addEventListener("click", () => {
                    const randomEventImage = generateRandomEventImage();
    eventImageElement.src = randomEvent.imageURL;
    eventImageElement.alt = randomEvent.imageURL.replace(".png", "");
                    generateEventButton.style.display = "none";
                });
            } else {
                generateEventButton.style.display = "none";
            }
        }

        const generateFouilleResultButton = document.getElementById("generateFouilleResultButton");
        const generateButtonContainer = document.getElementById("generateButtonContainer");

        generateFouilleResultButton.addEventListener("click", () => {
            randomImageElement.style.opacity = 0;
 // hide current image
            setTimeout(() => {
                displayFouilleResult();
                randomImageElement.style.opacity = 1; // display new image
            }, 300); // delay is 300 milliseconds
    document.getElementById("loupeText").style.display = "none";
        });

        const imageCounter = {};

        function testWeightedRandomFouilleResults() {
            for (let i = 0; i < 24; i++) {
                const randomFouilleResult = generateRandomFouilleResult();
                if (imageCounter[randomFouilleResult]) {
                    imageCounter[randomFouilleResult]++;
                } else {
                    imageCounter[randomFouilleResult] = 1;

                }
            }
            console.log(imageCounter);
        }

        testWeightedRandomFouilleResults();

        function displayWeightedRandomPotionImage(potionNumber, potionURLs) {
            let totalWeight = 0;
            for (let i = 0; i < potionURLs.length; i++) {
                totalWeight += potionURLs[i].weight;
            }

            const randomWeight = Math.floor(Math.random() * totalWeight);
            let weightSum = 0;
            for (let i = 0; i < potionURLs.length; i++) {
                weightSum += potionURLs[i].weight;
                if (randomWeight < weightSum) {
                    randomImageElement.src = potionURLs[i].file;
                    randomImageElement.alt = "Potion " + potionNumber;
                    break;
                }
            }
        }

        function displayWeightedRandomAttackImage(attackURLs) {
            let totalWeight = 0;
            for (let i = 0; i < attackURLs.length; i++) {
                totalWeight += attackURLs[i].weight;
            }

            const randomWeight = Math.floor(Math.random() * totalWeight);
            let weightSum = 0;
            for (let i = 0; i < attackURLs.length; i++) {
                weightSum += attackURLs[i].weight;
                if (randomWeight < weightSum) {
                    randomImageElement.src = attackURLs[i].file;
                    randomImageElement.alt = "Attaque monstrueuse";
                    break;
                }
            }
        }
        
        function displayRandomMonsterAIImage() {
            const randomIndex = Math.floor(Math.random() * 56) + 1;
            const imageURL = `https://storage.googleapis.com/redmoorapp/IA%20des%20monstres/${randomIndex}.png`; // Remplacez "https://example.com/monsters/" par le chemin de l'image des monstres
            randomImageElement.src = imageURL;
            randomImageElement.alt = "IA des monstres";
        }
playAudioButton.addEventListener("click", () => {
    eventAudioElement.play(); // Jouez l'audio
  });
    </script>
</body>
</html>

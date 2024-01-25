# Projektets Namn

## Beskrivning

Här beskriver du applikationens funktionalitet.
Film-babblarna är en applikation där man kan katagorisera sina filmer. Som inloggad kan man lägga in nya filmer och fylla i information om filmen. Filmerna kan även betygsättas och läggas kommentarer till. Varje användare har en egen sida där man kan lägga in sina favoritfilmer. Man kan söka efter filmer, skådespelare och kategorier. När man klickar sig in på en film kan man se informationen om filmen och kommentarerna om den. 

### Exempel (ta bort)

Book-O-Matic är en applikation där användare kan skapa virtuella bokhyllor. De kan mata in vilka böcker de har, och information om dessa. Man kan betygssätta böcker och skriva kommentarer. Om en bok är inlagd av en annan användare kan andra användare lägga till den i "sin" bokhylla, och skriva egna kommentarer och recensioner och sätta egna betyg. Man kan söka efter titlar och se kommentarer, recensioner och betyg

## Användare och roller

Här skriver du ner vilka typer av användare (som i inloggade användare) det finns, och vad de har för rättigheter, det vill säga, vad de kan göra (tänk admin, standard användare, etc).

Gästanvändare - inte inloggad
Kan söka efter filmer och se informationen om filmen samt kommentarer, kan dock inte lägga egna kommentarer eller lägga in nya filmer. 

Standardanvändare - inloggad
Kan göra samma som gästanvändare men utöver detta även lägga in nya filmer, lägga kommentarer och betygsätta filmer. Man kan även markera filmer som "Favorit" så hamnar dom i en ny kategori som heter favoriter. 

Adminanvändare - 
kan göra allt som standardanvändare kan men även ta bort och ändra på filmer,kommentarer och användare. 

### Exempel (ta bort)

Gästanvändare - oinloggad
. Kan söka efter titlar och se genomsnittligt betyg. Kan inte se eller skriva kommentarer eller sätta egna betyg.

Standardanvändare - inloggad. Kan allt gästanvändare kan, men kan även lägga in nya böcker och skriva kommentarer etc. Kan ta bort sitt eget konto och information kopplat till det.

Adminanvändare - kan ta bort/editera böcker, kommentarer och användare.

## ER-Diagram

![Er-Diagram](./image1.JPG?raw=true "ER-diagram")

## Gränssnittsskisser

**Login**

![Er-Diagram](./ui_login.png?raw=true "ER-diagram")

**Visa bok**

![Er-Diagram](./ui_show_book.png?raw=true "ER-diagram")
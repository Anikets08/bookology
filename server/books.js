const booksTemp = [
  {
    book_id: 52861201,
    name: "From Blood and Ash",
    author: "Jennifer L. Armentrou",
    votes: 70896,
    cover:
      "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1588843906l/52861201._SY475_.jpg",
    url: "https://www.goodreads.com/book/show/52861201-from-blood-and-ash?from_choice=true",
  },
  {
    book_id: 52867387,
    name: "Beach Read",
    author: "Emily Henr",
    votes: 60124,
    cover:
      "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1589881197l/52867387._SY475_.jpg",
    url: "https://www.goodreads.com/book/show/52867387-beach-read?from_choice=true",
  },
  {
    book_id: 50093704,
    name: "In Five Years",
    author: "Rebecca Serl",
    votes: 37342,
    cover:
      "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1586399012l/50093704._SY475_.jpg",
    url: "https://www.goodreads.com/book/show/50093704-in-five-years?from_choice=true",
  },
  {
    book_id: 44582454,
    name: "Regretting You",
    author: "Colleen Hoove",
    votes: 35856,
    cover:
      "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1559332442l/44582454._SY475_.jpg",
    url: "https://www.goodreads.com/book/show/44582454-regretting-you?from_choice=true",
  },
  {
    book_id: 50225678,
    name: "Boyfriend Material",
    author: "Alexis  Hal",
    votes: 33502,
    cover:
      "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1575987260l/50225678.jpg",
    url: "https://www.goodreads.com/book/show/50225678-boyfriend-material?from_choice=true",
  },
  {
    book_id: 52090948,
    name: "Take a Hint, Dani Brown",
    author: "Talia Hibber",
    votes: 26958,
    cover:
      "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1592943641l/52090948._SY475_.jpg",
    url: "https://www.goodreads.com/book/show/52090948-take-a-hint-dani-brown?from_choice=true",
  },
  {
    book_id: 53103895,
    name: "One to Watch",
    author: "Kate Stayman-Londo",
    votes: 24301,
    cover:
      "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1584401917l/53103895.jpg",
    url: "https://www.goodreads.com/book/show/53103895-one-to-watch?from_choice=true",
  },
  {
    book_id: 52539131,
    name: "The Happy Ever After Playlist",
    author: "Abby Jimene",
    votes: 18244,
    cover:
      "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1583200162l/52539131._SX318_SY475_.jpg",
    url: "https://www.goodreads.com/book/show/52539131-the-happy-ever-after-playlist?from_choice=true",
  },
  {
    book_id: 48842183,
    name: "The Switch",
    author: "Beth O'Lear",
    votes: 17210,
    cover:
      "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1585639107l/48842183.jpg",
    url: "https://www.goodreads.com/book/show/48842183-the-switch?from_choice=true",
  },
  {
    book_id: 52585101,
    name: "You Had Me at Hola",
    author: "Alexis Dari",
    votes: 14666,
    cover:
      "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1586533869l/52585101.jpg",
    url: "https://www.goodreads.com/book/show/52585101-you-had-me-at-hola?from_choice=true",
  },
  {
    book_id: 46225061,
    name: "The Two Lives of Lydia Bird",
    author: "Josie Silve",
    votes: 7069,
    cover:
      "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1583446296l/46225061._SY475_.jpg",
    url: "https://www.goodreads.com/book/show/46225061-the-two-lives-of-lydia-bird?from_choice=true",
  },
  {
    book_id: 49099926,
    name: "Party of Two",
    author: "Jasmine Guillor",
    votes: 6211,
    cover:
      "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1580140214l/49099926._SY475_.jpg",
    url: "https://www.goodreads.com/book/show/49099926-party-of-two?from_choice=true",
  },
  {
    book_id: 49202118,
    name: "A Rogue of One's Own",
    author: "Evie Dunmor",
    votes: 6005,
    cover:
      "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1578931679l/49202118.jpg",
    url: "https://www.goodreads.com/book/show/49202118-a-rogue-of-one-s-own?from_choice=true",
  },
  {
    book_id: 50892287,
    name: "In a Holidaze",
    author: "Christina Laure",
    votes: 5713,
    cover:
      "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1601590329l/50892287._SY475_.jpg",
    url: "https://www.goodreads.com/book/show/50892287-in-a-holidaze?from_choice=true",
  },
  {
    book_id: 50496840,
    name: "Emerald Blaze",
    author: "Ilona Andrew",
    votes: 4913,
    cover:
      "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1597017672l/50496840.jpg",
    url: "https://www.goodreads.com/book/show/50496840-emerald-blaze?from_choice=true",
  },
  {
    book_id: 52915426,
    name: "Something to Talk About",
    author: "Meryl Wilsne",
    votes: 4631,
    cover:
      "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1589963301l/52915426._SY475_.jpg",
    url: "https://www.goodreads.com/book/show/52915426-something-to-talk-about?from_choice=true",
  },
  {
    book_id: 52226559,
    name: "Sweet Temptation",
    author: "Cora Reill",
    votes: 3643,
    cover:
      "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1583736804l/52226559._SY475_.jpg",
    url: "https://www.goodreads.com/book/show/52226559-sweet-temptation?from_choice=true",
  },
  {
    book_id: 54467737,
    name: "Hands Down",
    author: "Mariana Zapat",
    votes: 2892,
    cover:
      "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1594433634l/54467737._SY475_.jpg",
    url: "https://www.goodreads.com/book/show/54467737-hands-down?from_choice=true",
  },
  {
    book_id: 49758584,
    name: "You Deserve Each Other",
    author: "Sarah Hogl",
    votes: 2139,
    cover:
      "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1578144091l/49758584._SY475_.jpg",
    url: "https://www.goodreads.com/book/show/49758584-you-deserve-each-other?from_choice=true",
  },
  {
    book_id: 50496918,
    name: "Spoiler Alert",
    author: "Olivia Dad",
    votes: 1884,
    cover:
      "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1584239588l/50496918.jpg",
    url: "https://www.goodreads.com/book/show/50496918-spoiler-alert?from_choice=true",
  },
  {
    book_id: "56597885",
    name: "Beautiful World, Where Are You",
    category: "Fiction",
    votes: 10000,
    author: "Sally Roone",
    cover:
      "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1618329605l/56597885.jpg",
    url: "https://www.goodreads.com/choiceawards/best-fiction-books-2021",
  },
  {
    book_id: "58744977",
    name: "The Last Thing He Told Me",
    category: "Mystery & Thriller",
    votes: 12130,
    author: "Laura Dave",
    cover:
      "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1628623381l/58744977._SY475_.jpg",
    url: "https://www.goodreads.com/choiceawards/best-mystery-thriller-books-2021",
  },
  {
    book_id: "58745185",
    name: "Malibu Rising",
    votes: 11176,
    author: "Taylor Jenkin",
    category: "Historical Fiction",
    cover:
      "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1628625865l/58745185._SY475_.jpg",
    url: "https://www.goodreads.com/choiceawards/best-historical-fiction-books-2021",
  },
  {
    book_id: "53138095",
    name: "A ​Court of Silver Flames (A Court of Thorns and Roses, #4)",
    category: "Fantasy",
    votes: 123134,
    author: "Sarah J. Maas",
    cover:
      "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1602570691l/53138095.jpg",
    url: "https://www.goodreads.com/choiceawards/best-fantasy-books-2021",
  },
  {
    book_id: "54985743",
    name: "People We Meet on Vacation",
    category: "Romance",
    votes: 101598,
    cover:
      "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1618913179l/54985743.jpg",
    url: "https://www.goodreads.com/choiceawards/best-romance-books-2021",
  },
  {
    book_id: "54493401",
    name: "Project Hail Mary",
    votes: 100000,
    category: "Science Fiction",
    cover:
      "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1597695864l/54493401.jpg",
    url: "https://www.goodreads.com/choiceawards/best-science-fiction-books-2021",
  },
  {
    book_id: "55829194",
    name: "The Final Girl Support Group",
    category: "Horror",
    votes: 1000123,
    author: "Grady Hendri",
    cover:
      "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1614275199l/55829194.jpg",
    url: "https://www.goodreads.com/choiceawards/best-horror-books-2021",
  },
  {
    book_id: "54305363",
    name: "Broken (In the Best Possible Way)",
    category: "Humor",
    votes: 7651241,
    author: "Jenny Lawso",
    cover:
      "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1597856341l/54305363.jpg",
    url: "https://www.goodreads.com/choiceawards/best-humor-books-2021",
  },
  {
    book_id: "55145261",
    name: "The Anthropocene Reviewed",
    author: "John Gree",
    category: "Nonfiction",
    votes: 1012312,
    cover:
      "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1616514130l/55145261.jpg",
    url: "https://www.goodreads.com/choiceawards/best-nonfiction-books-2021",
  },
  {
    book_id: "54814676",
    name: "Crying in H Mart",
    author: "Michelle Zauner",
    votes: 1287623,
    category: "Memoir & Autobiography",
    cover:
      "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1601937850l/54814676.jpg",
    url: "https://www.goodreads.com/choiceawards/best-memoir-autobiography-books-2021",
  },
  {
    book_id: "43868109",
    votes: 65124,
    name: "Empire of Pain: The Secret History of the Sackler Dynasty",
    category: "History & Biography",
    author: "Patrick Radden Keefe",
    cover:
      "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1611952534l/43868109.jpg",
    url: "https://www.goodreads.com/choiceawards/best-history-biography-books-2021",
  },
  {
    book_id: "57282218",
    name: "Lore Olympus: Volume One (Lore Olympus, #1)",
    category: "Graphic Novels & Comics",
    cover:
      "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1614887007l/57282218.jpg",
    url: "https://www.goodreads.com/choiceawards/best-graphic-novels-comics-2021",
  },
  {
    book_id: "56914101",
    name: "The Hill We Climb: An Inaugural Poem for the Country",
    category: "Poetry",
    author: "Amanda Gorma",
    cover:
      "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1612178266l/56914101.jpg",
    url: "https://www.goodreads.com/choiceawards/best-poetry-books-2021",
  },
  {
    book_id: "57190892",
    name: "The Spanish Love Deception (Spanish Love Deception, #1)",
    category: "Debut Novel",
    votes: 123123,
    author: "Elena Arma",
    cover:
      "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1614122544l/57190892._SY475_.jpg",
    url: "https://www.goodreads.com/choiceawards/best-debut-novel-2021",
  },
  {
    book_id: "57812106",
    name: "Firekeeper's Daughter",
    category: "Young Adult Fiction",
    author: "Angeline Bouley",
    votes: 123123,
    cover:
      "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1619021348l/57812106._SY475_.jpg",
    url: "https://www.goodreads.com/choiceawards/best-young-adult-fiction-books-2021",
  },
  {
    book_id: "54589790",
    name: "Rule of Wolves (King of Scars, #2)",
    category: "Young Adult Fantasy",
    author: "Leigh Bardug",
    votes: 123123,
    cover:
      "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1598133973l/54589790.jpg",
    url: "https://www.goodreads.com/choiceawards/best-young-adult-fantasy-books-2021",
  },
  {
    book_id: "57094644",
    votes: 123123,
    name: "Daughter of the Deep",
    category: "Middle Grade & Children's",
    author: "Rick Riorda",
    cover:
      "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1622742517l/57094644.jpg",
    url: "https://www.goodreads.com/choiceawards/best-childrens-books-2021",
  },

  {
    book_id: 62080187,
    name: "Never Lie",
    author: "Elizabeth Co",
    votes: 123123,
    cover:
      "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1661428846l/62080187._SY475_.jpg",
    url: "https://www.goodreads.com/book/show/62080187-never-lie",
  },
  {
    book_id: 80830635,
    name: "Don't Let Her Stay",
    author: "Elisabeth S",
    votes: 123123,
    cover:
      "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1674147285l/80830635._SY475_.jpg",
    url: "https://www.goodreads.com/book/show/80830635-don-t-let-her-stay",
  },
  {
    book_id: 123193218,
    name: "Ward D",
    votes: 123123,
    author: "Laurie Gardne",
    cover:
      "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1678127541l/123193218._SY475_.jpg",
    url: "https://www.goodreads.com/book/show/123193218-ward-d",
  },
  {
    book_id: 62703226,
    name: "The Only One Left",
    votes: 123123,
    author: "Dianne Duvall",
    cover:
      "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1668181003l/62703226.jpg",
    url: "https://www.goodreads.com/book/show/62703226-the-only-one-left",
  },
  {
    book_id: 57795665,
    name: "The Locked Door",
    author: "J.A. Hensley",
    votes: 123123,
    cover:
      "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1618859577l/57795665._SY475_.jpg",
    url: "https://www.goodreads.com/book/show/57795665-the-locked-door",
  },
  {
    book_id: 58724923,
    name: "Hidden Pictures",
    author: "Linda S. Prather",
    votes: 123123,
    cover:
      "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1635260162l/58724923.jpg",
    url: "https://www.goodreads.com/book/show/58724923-hidden-pictures",
  },
  {
    book_id: 61458888,
    name: "You Shouldn't Have Come Here",
    author: "Elizabeth E",
    votes: 123123,
    cover:
      "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1666310687l/61458888.jpg",
    url: "https://www.goodreads.com/book/show/61458888-you-shouldn-t-have-come-here",
  },
  {
    book_id: 54197718,
    name: "One By One",
    author: "Ruth Heald",
    cover:
      "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1592705582l/54197718._SY475_.jpg",
    url: "https://www.goodreads.com/book/show/54197718-one-by-one",
  },
  {
    book_id: 58909880,
    name: "The House Across the Lake",
    votes: 123123,
    cover:
      "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1639618949l/58909880.jpg",
    url: "https://www.goodreads.com/book/show/58909880-the-house-across-the-lake",
  },
  {
    book_id: 61897971,
    name: "The Quiet Tenant",
    votes: 123123,
    author: "Sarah A. Denzil",
    cover:
      "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1684817278l/61897971.jpg",
    url: "https://www.goodreads.com/book/show/61897971-the-quiet-tenant",
  },
];

const genres = [
  "Romance",
  "Mystery & Thriller",
  "Fantasy",
  "Science Fiction",
  "Horror",
  "History & Biography",
  "Middle Grade & Children's",
  "Fiction",
  "Debut Novel",
  "Young Adult Fiction",
];

const books = booksTemp.map((book) => {
  const randomIndex = Math.floor(Math.random() * genres.length);
  return { ...book, genre: genres[randomIndex] };
});

export default books;

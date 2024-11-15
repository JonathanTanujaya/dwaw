import 'package:main/models/recipe.dart';

var rList = [
  Recipe(
      name: 'Ayam Kung Pao',
      category: ['Ayam', 'Pedas'],
      description:
          'Ayam Kung Pao adalah potongan ayam goreng ala Cina dengan cabai kering. Versi Sichuan memiliki rasa pedas khas dengan merica Sichuan.',
      alat: [
        'Pisau',
        'Spatula',
        'Talenan',
        'Wajan',
        'Mangkuk besar',
        'Sendok kayu'
      ],
      bahan: [
        'Bawang bombay, potong kotak',
        'Bawang putih, cincang',
        'Cabai kering, potong kecil',
        'Daun bawang, iris besar',
        'Fillet paha ayam, potong dadu',
        'Gula pasir',
        'Kecap asin',
        'Kecap manis',
        'Lada',
        'Minyak wijen',
        'Minyak untuk menumis',
        'Saus tiram'
      ],
      langkahlangkah: [
        'Panaskan wajan dengan sedikit minyak, tumis bawang putih hingga harum.',
        'Masukkan ayam dan tumis hingga matang.',
        'Tambahkan bawang bombay dan cabai kering, aduk rata.',
        'Masukkan saus tiram, kecap manis, kecap asin, gula, dan minyak wijen. Aduk rata.',
        'Tambahkan daun bawang, masak sebentar, lalu sajikan.'
      ],
      imageAsset: 'images/kung_pao_chicken.jpg'),
  Recipe(
      name: 'Bebek Peking',
      category: ['Bebek', 'Panggang'],
      description:
          'Bebek Peking adalah hidangan mewah khas China dengan kulit bebek yang garing dan daging yang lembut, biasanya disajikan dengan pancake tipis dan saus hoisin.',
      alat: ['Kuas masak', 'Lemari es', 'Oven', 'Pisau', 'Talenan'],
      bahan: [
        'Air panas untuk membilas bebek',
        'Bebek, bersihkan',
        'Cuka',
        'Garam',
        'Lada',
        'Madu',
        'Saus hoisin'
      ],
      langkahlangkah: [
        'Bilas bebek dengan air panas hingga kulitnya kencang.',
        'Campur madu, cuka, saus hoisin, garam, dan lada, oleskan ke seluruh bagian bebek.',
        'Diamkan selama 12 jam di lemari es agar bumbu meresap.',
        'Panggang bebek di oven dengan suhu 200°C selama 1 jam hingga kulitnya garing.',
        'Potong bebek sesuai selera, sajikan dengan pancake tipis dan saus hoisin.'
      ],
      imageAsset: 'images/'),
  Recipe(
      name: 'Cha Siu (Babi Panggang)',
      category: ['Babi', 'Panggang'],
      description:
          'Cha Siu adalah daging babi panggang khas China dengan bumbu manis dan sedikit pedas.',
      alat: ['Kuas masak', 'Lemari es', 'Oven', 'Pisau', 'Talenan'],
      bahan: [
        'Bawang putih, cincang',
        'Daging babi bagian punggung, potong memanjang',
        'Kecap asin',
        'Kecap manis',
        'Lima rempah bubuk',
        'Madu',
        'Minyak wijen',
        'Saus hoisin'
      ],
      langkahlangkah: [
        'Campurkan saus hoisin, madu, kecap manis, kecap asin, lima rempah, bawang putih, dan minyak wijen.',
        'Oleskan campuran bumbu ke seluruh bagian daging babi.',
        'Diamkan selama 2 jam di dalam lemari es.',
        'Panggang daging babi di oven pada suhu 180°C selama 30-40 menit.',
        'Potong daging tipis-tipis dan sajikan.'
      ],
      imageAsset: 'images/'),
  Recipe(
      name: 'Dimsum Ayam',
      category: ['Ayam', 'Kukus'],
      description:
          'Dimsum Ayam adalah makanan kecil khas China yang dikukus dengan isian daging ayam dan udang, biasanya disajikan dengan saus sambal.',
      alat: [
        'Kukusan',
        'Mangkuk besar',
        'Pisau',
        'Talenan',
        'Sendok',
        'Piring saji'
      ],
      bahan: [
        'Daging ayam cincang',
        'Udang cincang',
        'Tepung sagu',
        'Bawang putih, cincang halus',
        'Daun bawang, iris tipis',
        'Kecap asin',
        'Minyak wijen',
        'Garam dan lada',
        'Kulit pangsit'
      ],
      langkahlangkah: [
        'Campurkan ayam, udang, tepung sagu, bawang putih, daun bawang, kecap asin, minyak wijen, garam, dan lada dalam mangkuk besar.',
        'Ambil satu lembar kulit pangsit, isi dengan adonan dan bentuk seperti bunga.',
        'Kukus dimsum selama 15-20 menit hingga matang.',
        'Sajikan dengan saus sambal atau saus hoisin.'
      ],
      imageAsset: 'images/'),
  Recipe(
      name: 'Egg Foo Young',
      category: ['Telur', 'Goreng'],
      description:
          'Egg Foo Young adalah omelet khas China yang berisi campuran telur dengan daging atau sayuran, disajikan dengan saus kental.',
      alat: ['Wajan', 'Spatula', 'Mangkuk', 'Sendok', 'Pisau', 'Talenan'],
      bahan: [
        'Telur',
        'Daging ayam atau udang cincang',
        'Wortel, parut',
        'Bawang bombay, iris halus',
        'Daun bawang, iris tipis',
        'Tepung maizena',
        'Air',
        'Kecap asin',
        'Lada'
      ],
      langkahlangkah: [
        'Kocok telur dalam mangkuk, tambahkan ayam atau udang, wortel, bawang bombay, dan daun bawang.',
        'Bumbui dengan kecap asin dan lada, aduk rata.',
        'Panaskan sedikit minyak dalam wajan, tuang adonan telur, masak hingga kedua sisi matang.',
        'Campur tepung maizena dengan air dan sedikit kecap asin, masak hingga kental sebagai saus.',
        'Sajikan Egg Foo Young dengan saus kental di atasnya.'
      ],
      imageAsset: 'images/'),
  Recipe(
      name: 'Fried Rice Yangzhou',
      category: ['Nasi', 'Goreng'],
      description:
          'Fried Rice Yangzhou adalah nasi goreng khas China yang kaya akan bahan seperti udang, ayam, dan sayuran.',
      alat: ['Wajan', 'Spatula', 'Pisau', 'Talenan', 'Mangkuk'],
      bahan: [
        'Nasi putih dingin',
        'Daging ayam cincang',
        'Udang kupas, cincang',
        'Telur, kocok lepas',
        'Wortel, potong kecil',
        'Kacang polong',
        'Kecap asin',
        'Minyak wijen',
        'Lada dan garam'
      ],
      langkahlangkah: [
        'Panaskan sedikit minyak dalam wajan, masak telur orak-arik, sisihkan.',
        'Tumis ayam dan udang hingga matang.',
        'Masukkan wortel dan kacang polong, masak hingga setengah matang.',
        'Tambahkan nasi putih, kecap asin, minyak wijen, lada, dan garam. Aduk rata.',
        'Campurkan telur orak-arik, aduk sebentar, sajikan hangat.'
      ],
      imageAsset: 'images/'),
  Recipe(
      name: 'Hainanese Chicken Rice',
      category: ['Ayam', 'Rebus'],
      description:
          'Hainanese Chicken Rice adalah nasi berbumbu khas China yang disajikan dengan ayam rebus dan saus jahe bawang putih.',
      alat: ['Panci besar', 'Pisau', 'Talenan', 'Wajan', 'Mangkuk'],
      bahan: [
        'Ayam utuh, bersihkan',
        'Jahe, iris',
        'Bawang putih, cincang',
        'Daun bawang',
        'Nasi putih',
        'Minyak ayam',
        'Kecap asin',
        'Garam'
      ],
      langkahlangkah: [
        'Rebus ayam dalam panci dengan jahe, bawang putih, dan daun bawang hingga matang.',
        'Gunakan kaldu ayam untuk memasak nasi dengan tambahan minyak ayam.',
        'Potong ayam rebus sesuai selera.',
        'Sajikan ayam dengan nasi berbumbu, kaldu, dan saus jahe bawang putih.'
      ],
      imageAsset: 'images/'),
  Recipe(
      name: 'Jiaozi (Pangsit China)',
      category: ['Daging', 'Kukus'],
      description:
          'Jiaozi adalah pangsit khas China yang diisi dengan campuran daging cincang dan sayuran, bisa digoreng, kukus, atau direbus.',
      alat: ['Kukusan', 'Pisau', 'Talenan', 'Sendok', 'Mangkuk besar'],
      bahan: [
        'Kulit pangsit',
        'Daging babi atau ayam cincang',
        'Kubis, cincang halus',
        'Daun bawang, iris halus',
        'Bawang putih, cincang',
        'Kecap asin',
        'Minyak wijen',
        'Garam dan lada'
      ],
      langkahlangkah: [
        'Campur daging cincang, kubis, daun bawang, bawang putih, kecap asin, minyak wijen, garam, dan lada.',
        'Ambil kulit pangsit, isi dengan adonan dan lipat sesuai bentuk pangsit.',
        'Kukus jiaozi hingga matang (sekitar 10-15 menit).',
        'Sajikan dengan saus kecap asin dan cuka hitam.'
      ],
      imageAsset: 'images/'),
  Recipe(
      name: 'Kung Pao Shrimp',
      category: ['Udang', 'Pedas'],
      description:
          'Kung Pao Shrimp adalah masakan pedas khas China berbahan dasar udang dengan saus kacang dan cabai kering.',
      alat: ['Wajan', 'Spatula', 'Pisau', 'Talenan', 'Mangkuk besar'],
      bahan: [
        'Udang ukuran sedang, kupas',
        'Cabai kering, potong kecil',
        'Kacang mete atau kacang tanah',
        'Bawang putih, cincang',
        'Daun bawang, iris',
        'Saus tiram',
        'Kecap asin',
        'Gula',
        'Minyak wijen'
      ],
      langkahlangkah: [
        'Tumis bawang putih dan cabai kering hingga harum.',
        'Masukkan udang, masak hingga setengah matang.',
        'Tambahkan saus tiram, kecap asin, gula, dan minyak wijen. Aduk rata.',
        'Masukkan kacang dan daun bawang, masak sebentar hingga matang.',
        'Sajikan dengan nasi putih hangat.'
      ],
      imageAsset: 'images/'),
  Recipe(
      name: 'Lo Mai Gai',
      category: ['Nasi', 'Kukus'],
      description:
          'Lo Mai Gai adalah nasi ketan khas China yang dikukus dengan topping ayam, jamur, dan saus gurih.',
      alat: ['Kukusan', 'Mangkuk kecil', 'Pisau', 'Talenan', 'Sendok'],
      bahan: [
        'Nasi ketan, rendam selama 4 jam',
        'Ayam fillet, potong kecil',
        'Jamur shiitake, iris tipis',
        'Bawang putih, cincang',
        'Saus tiram',
        'Kecap asin',
        'Minyak wijen',
        'Lada dan garam'
      ],
      langkahlangkah: [
        'Tumis ayam, jamur, bawang putih dengan saus tiram, kecap asin, minyak wijen, garam, dan lada.',
        'Susun nasi ketan dalam mangkuk kecil, tambahkan topping ayam di atasnya.',
        'Kukus selama 30-40 menit hingga matang.',
        'Balikkan mangkuk di atas piring saji, hidangkan hangat.'
      ],
      imageAsset: 'images/'),
  Recipe(
      name: 'Moo Shu Pork',
      category: ['Babi', 'Tumis'],
      description:
          'Moo Shu Pork adalah hidangan tumis daging babi dengan sayuran seperti kol, wortel, dan jamur, disajikan dengan pancake tipis.',
      alat: ['Wajan', 'Spatula', 'Pisau', 'Talenan', 'Mangkuk besar'],
      bahan: [
        'Daging babi, iris tipis',
        'Kol, iris tipis',
        'Wortel, parut',
        'Jamur, iris tipis',
        'Telur, kocok lepas',
        'Saus tiram',
        'Kecap asin',
        'Minyak wijen',
        'Lada'
      ],
      langkahlangkah: [
        'Panaskan sedikit minyak, orak-arik telur, sisihkan.',
        'Tumis daging babi hingga matang, tambahkan kol, wortel, dan jamur.',
        'Masukkan saus tiram, kecap asin, minyak wijen, dan lada. Aduk rata.',
        'Tambahkan telur orak-arik, aduk sebentar.',
        'Sajikan dengan pancake tipis atau nasi putih.'
      ],
      imageAsset: 'images/'),
  Recipe(
      name: 'Peking Duck Wrap',
      category: ['Bebek', 'Panggang'],
      description:
          'Peking Duck Wrap adalah versi praktis dari Bebek Peking, disajikan dalam gulungan pancake tipis dengan saus hoisin.',
      alat: ['Oven', 'Pisau', 'Talenan', 'Kuas masak', 'Piring saji'],
      bahan: [
        'Bebek panggang',
        'Pancake tipis',
        'Saus hoisin',
        'Timun, potong panjang tipis',
        'Daun bawang, iris tipis'
      ],
      langkahlangkah: [
        'Iris tipis daging bebek panggang.',
        'Siapkan pancake tipis, oleskan sedikit saus hoisin.',
        'Tambahkan irisan daging bebek, timun, dan daun bawang.',
        'Gulung pancake dan sajikan.'
      ],
      imageAsset: 'images/'),
  Recipe(
      name: 'Spring Roll',
      category: ['Sayuran', 'Goreng'],
      description:
          'Spring Roll adalah lumpia khas China berisi sayuran atau daging, digulung dalam kulit lumpia dan digoreng renyah.',
      alat: ['Wajan', 'Spatula', 'Pisau', 'Talenan', 'Sendok'],
      bahan: [
        'Kulit lumpia',
        'Kol, iris tipis',
        'Wortel, parut',
        'Tauge',
        'Daging ayam cincang (opsional)',
        'Saus tiram',
        'Minyak goreng',
        'Kecap asin'
      ],
      langkahlangkah: [
        'Tumis sayuran dan ayam cincang dengan saus tiram dan kecap asin.',
        'Isi kulit lumpia dengan tumisan, gulung rapat.',
        'Goreng dalam minyak panas hingga keemasan.',
        'Sajikan dengan saus cabai atau saus asam manis.'
      ],
      imageAsset: 'images/'),
  Recipe(
      name: 'Chow Mein',
      category: ['Mie', 'Tumis'],
      description:
          'Chow Mein adalah hidangan mie tumis khas China dengan campuran sayuran dan daging yang dimasak dengan saus gurih.',
      alat: ['Wajan', 'Spatula', 'Pisau', 'Talenan', 'Piring saji'],
      bahan: [
        'Mie telur, rebus hingga matang',
        'Ayam fillet, potong tipis',
        'Kol, iris tipis',
        'Wortel, parut',
        'Bawang bombay, iris',
        'Saus tiram',
        'Kecap asin',
        'Minyak wijen',
        'Lada dan garam'
      ],
      langkahlangkah: [
        'Tumis bawang bombay hingga harum.',
        'Masukkan ayam, masak hingga setengah matang.',
        'Tambahkan sayuran, tumis hingga layu.',
        'Masukkan mie yang sudah direbus, tambahkan saus tiram, kecap asin, minyak wijen, lada, dan garam.',
        'Aduk rata dan sajikan hangat.'
      ],
      imageAsset: 'images/'),
  Recipe(
      name: 'Egg Drop Soup',
      category: ['Sup', 'Telur'],
      description:
          'Egg Drop Soup adalah sup ringan dengan campuran telur kocok yang memberikan tekstur lembut dan rasa gurih.',
      alat: ['Panci', 'Sendok', 'Pisau', 'Mangkuk'],
      bahan: [
        'Kaldu ayam',
        'Telur, kocok lepas',
        'Jagung manis pipil',
        'Tepung maizena, larutkan dengan sedikit air',
        'Daun bawang, iris halus',
        'Kecap asin',
        'Garam dan lada'
      ],
      langkahlangkah: [
        'Rebus kaldu ayam hingga mendidih.',
        'Masukkan jagung manis dan biarkan matang.',
        'Tambahkan larutan tepung maizena untuk mengentalkan sup.',
        'Tuang telur kocok sambil diaduk perlahan hingga membentuk serabut.',
        'Tambahkan kecap asin, garam, dan lada. Sajikan dengan taburan daun bawang.'
      ],
      imageAsset: 'images/'),
  Recipe(
      name: 'Fried Rice Yangzhou',
      category: ['Nasi', 'Goreng'],
      description:
          'Fried Rice Yangzhou adalah nasi goreng khas China dengan campuran udang, kacang polong, dan potongan telur orak-arik.',
      alat: ['Wajan', 'Spatula', 'Pisau', 'Talenan', 'Mangkuk'],
      bahan: [
        'Nasi putih dingin',
        'Udang kecil, kupas',
        'Telur, orak-arik',
        'Kacang polong',
        'Wortel, potong kecil',
        'Bawang putih, cincang',
        'Saus tiram',
        'Kecap asin',
        'Lada dan garam'
      ],
      langkahlangkah: [
        'Tumis bawang putih hingga harum.',
        'Masukkan udang, masak hingga matang.',
        'Tambahkan kacang polong, wortel, dan telur orak-arik.',
        'Masukkan nasi putih, tambahkan saus tiram, kecap asin, lada, dan garam.',
        'Aduk rata hingga semua bahan tercampur sempurna. Sajikan hangat.'
      ],
      imageAsset: 'images/'),
  Recipe(
      name: 'Gong Bao Chicken',
      category: ['Ayam', 'Pedas'],
      description:
          'Gong Bao Chicken adalah ayam tumis khas Sichuan dengan saus kacang dan rasa pedas yang menggigit.',
      alat: ['Wajan', 'Spatula', 'Pisau', 'Talenan', 'Mangkuk besar'],
      bahan: [
        'Ayam fillet, potong dadu',
        'Cabai kering, potong kecil',
        'Kacang tanah goreng',
        'Bawang putih, cincang',
        'Daun bawang, iris',
        'Saus tiram',
        'Kecap asin',
        'Minyak wijen',
        'Lada dan gula'
      ],
      langkahlangkah: [
        'Tumis bawang putih dan cabai kering hingga harum.',
        'Masukkan ayam, masak hingga matang.',
        'Tambahkan saus tiram, kecap asin, minyak wijen, lada, dan gula. Aduk rata.',
        'Masukkan kacang tanah dan daun bawang, masak sebentar.',
        'Sajikan hangat dengan nasi putih.'
      ],
      imageAsset: 'images/'),
  Recipe(
      name: 'Hot and Sour Soup',
      category: ['Sup', 'Pedas'],
      description:
          'Hot and Sour Soup adalah sup dengan rasa pedas dan asam yang khas, cocok untuk menghangatkan tubuh.',
      alat: ['Panci', 'Sendok', 'Pisau', 'Mangkuk'],
      bahan: [
        'Kaldu ayam',
        'Jamur kuping, iris tipis',
        'Tahu sutra, potong kecil',
        'Telur, kocok lepas',
        'Cuka',
        'Lada putih',
        'Saus tiram',
        'Kecap asin',
        'Tepung maizena'
      ],
      langkahlangkah: [
        'Rebus kaldu ayam hingga mendidih.',
        'Masukkan jamur dan tahu, masak hingga matang.',
        'Tambahkan cuka, lada putih, saus tiram, dan kecap asin.',
        'Tuang telur kocok sambil diaduk perlahan.',
        'Tambahkan larutan tepung maizena untuk mengentalkan sup. Sajikan hangat.'
      ],
      imageAsset: 'images/'),
  Recipe(
      name: 'Kung Pao Vegetables',
      category: ['Sayuran', 'Pedas'],
      description:
          'Kung Pao Vegetables adalah tumisan sayuran dengan rasa pedas khas China yang menggugah selera.',
      alat: ['Wajan', 'Spatula', 'Pisau', 'Talenan', 'Mangkuk besar'],
      bahan: [
        'Brokoli, potong kecil',
        'Wortel, iris tipis',
        'Paprika merah, potong dadu',
        'Jamur, iris tipis',
        'Cabai kering, potong kecil',
        'Kacang tanah goreng',
        'Saus tiram',
        'Kecap asin',
        'Minyak wijen'
      ],
      langkahlangkah: [
        'Tumis cabai kering hingga harum.',
        'Masukkan sayuran, tumis hingga setengah matang.',
        'Tambahkan saus tiram, kecap asin, dan minyak wijen. Aduk rata.',
        'Masukkan kacang tanah, aduk hingga semua bahan matang sempurna.',
        'Sajikan dengan nasi putih.'
      ],
      imageAsset: 'images/'),
  Recipe(
      name: 'Ma Po Tofu',
      category: ['Tahu', 'Pedas'],
      description:
          'Ma Po Tofu adalah tahu sutra yang dimasak dalam saus pedas khas Sichuan dengan daging cincang.',
      alat: ['Wajan', 'Spatula', 'Pisau', 'Talenan', 'Mangkuk'],
      bahan: [
        'Tahu sutra, potong dadu',
        'Daging cincang (sapi atau ayam)',
        'Cabai Sichuan, haluskan',
        'Bawang putih, cincang',
        'Daun bawang, iris halus',
        'Saus tiram',
        'Kecap asin',
        'Minyak wijen',
        'Tepung maizena, larutkan'
      ],
      langkahlangkah: [
        'Tumis bawang putih dan cabai Sichuan hingga harum.',
        'Masukkan daging cincang, masak hingga matang.',
        'Tambahkan tahu, saus tiram, kecap asin, dan minyak wijen.',
        'Tuang larutan tepung maizena untuk mengentalkan saus. Aduk perlahan agar tahu tidak hancur.',
        'Sajikan dengan taburan daun bawang.'
      ],
      imageAsset: 'images/mapo_tofu'),
  Recipe(
      name: 'Spring Rolls',
      category: ['Cemilan', 'Goreng'],
      description:
          'Spring Rolls adalah lumpia khas China yang diisi dengan sayuran dan daging, kemudian digoreng hingga renyah.',
      alat: ['Wajan', 'Spatula', 'Pisau', 'Talenan', 'Mangkok'],
      bahan: [
        'Kulit lumpia',
        'Wortel, parut',
        'Kubis, iris tipis',
        'Ayam cincang',
        'Bawang putih, cincang',
        'Minyak goreng',
        'Saus tiram',
        'Kecap asin',
        'Garam dan lada'
      ],
      langkahlangkah: [
        'Tumis bawang putih hingga harum, tambahkan ayam cincang, masak hingga matang.',
        'Masukkan sayuran, saus tiram, kecap asin, garam, dan lada. Tumis hingga layu.',
        'Ambil kulit lumpia, isi dengan campuran, dan gulung.',
        'Goreng dalam minyak panas hingga kecokelatan. Sajikan dengan saus.'
      ],
      imageAsset: 'images/'),
  Recipe(
      name: 'Steamed Dumplings',
      category: ['Cemilan', 'Kukus'],
      description:
          'Steamed Dumplings adalah pangsit kukus khas China yang diisi dengan campuran daging dan sayuran.',
      alat: ['Kukusan', 'Pisau', 'Talenan', 'Mangkuk besar'],
      bahan: [
        'Kulit pangsit',
        'Daging cincang (ayam atau babi)',
        'Wortel, cincang halus',
        'Daun bawang, iris halus',
        'Jahe, parut',
        'Kecap asin',
        'Minyak wijen',
        'Garam dan lada'
      ],
      langkahlangkah: [
        'Campur daging, wortel, daun bawang, jahe, kecap asin, minyak wijen, garam, dan lada.',
        'Ambil kulit pangsit, isi dengan campuran, lalu bentuk sesuai keinginan.',
        'Kukus hingga matang. Sajikan dengan saus celupan.'
      ],
      imageAsset: 'images/'),
  Recipe(
      name: 'Peking Duck',
      category: ['Bebek', 'Panggang'],
      description:
          'Peking Duck adalah hidangan bebek panggang yang terkenal dengan kulit renyah dan daging lembutnya.',
      alat: ['Oven', 'Pisau', 'Talenan', 'Kuas masak'],
      bahan: [
        'Bebek utuh, bersihkan',
        'Madu',
        'Saus hoisin',
        'Cuka',
        'Garam',
        'Lada'
      ],
      langkahlangkah: [
        'Campurkan madu, saus hoisin, cuka, garam, dan lada untuk bumbu.',
        'Oleskan bumbu ke seluruh bagian bebek dan diamkan di lemari es semalaman.',
        'Panggang dalam oven hingga matang dan kulitnya garing.',
        'Potong dan sajikan dengan pancake tipis.'
      ],
      imageAsset: 'images/peking_duck'),
  Recipe(
      name: 'Sesame Chicken',
      category: ['Ayam', 'Goreng'],
      description:
          'Sesame Chicken adalah ayam goreng yang dilapisi saus manis dan taburan biji wijen.',
      alat: ['Wajan', 'Pisau', 'Talenan', 'Mangkuk'],
      bahan: [
        'Fillet ayam, potong dadu',
        'Tepung maizena',
        'Telur, kocok lepas',
        'Minyak goreng',
        'Saus manis (campuran madu dan kecap asin)',
        'Biji wijen panggang'
      ],
      langkahlangkah: [
        'Balur ayam dengan tepung maizena dan celupkan ke dalam telur.',
        'Goreng ayam hingga kecokelatan.',
        'Campur ayam goreng dengan saus manis, aduk rata.',
        'Taburi dengan biji wijen panggang dan sajikan.'
      ],
      imageAsset: 'images/'),
  Recipe(
      name: 'Dim Sum Siomai',
      category: ['Cemilan', 'Kukus'],
      description:
          'Dim Sum Siomai adalah pangsit kukus dengan isian daging dan udang.',
      alat: ['Kukusan', 'Pisau', 'Talenan', 'Mangkuk besar'],
      bahan: [
        'Kulit pangsit',
        'Daging cincang',
        'Udang cincang',
        'Wortel parut',
        'Daun bawang iris',
        'Saus tiram',
        'Minyak wijen',
        'Garam dan lada'
      ],
      langkahlangkah: [
        'Campur semua bahan isian hingga rata.',
        'Isi kulit pangsit dengan campuran daging dan udang, bentuk sesuai selera.',
        'Kukus hingga matang. Sajikan dengan saus sambal.'
      ],
      imageAsset: 'images/'),
  Recipe(
      name: 'Honey Walnut Shrimp',
      category: ['Udang', 'Goreng'],
      description:
          'Honey Walnut Shrimp adalah udang goreng dengan saus manis dan kacang kenari.',
      alat: ['Wajan', 'Pisau', 'Talenan', 'Mangkuk'],
      bahan: [
        'Udang, kupas dan bersihkan',
        'Tepung maizena',
        'Telur, kocok lepas',
        'Minyak goreng',
        'Madu',
        'Mayones',
        'Kacang kenari panggang'
      ],
      langkahlangkah: [
        'Balur udang dengan tepung maizena dan celupkan ke dalam telur.',
        'Goreng udang hingga matang dan tiriskan.',
        'Campur madu dan mayones, aduk dengan udang goreng.',
        'Taburi dengan kacang kenari panggang sebelum disajikan.'
      ],
      imageAsset: 'images/'),
  Recipe(
      name: 'Char Siu Bao',
      category: ['Cemilan', 'Kukus'],
      description:
          'Char Siu Bao adalah bakpao isi daging babi panggang dengan rasa manis gurih.',
      alat: ['Kukusan', 'Mangkuk', 'Rolling pin', 'Pisau'],
      bahan: [
        'Adonan bakpao',
        'Daging babi panggang (Char Siu), cincang',
        'Saus hoisin',
        'Kecap asin',
        'Gula'
      ],
      langkahlangkah: [
        'Campur daging babi dengan saus hoisin, kecap asin, dan gula.',
        'Ambil adonan bakpao, isi dengan campuran daging.',
        'Bentuk bulat, kukus hingga matang. Sajikan hangat.'
      ],
      imageAsset: 'images/'),
  Recipe(
  name: 'General Tso’s Chicken',
  category: ['Ayam', 'Goreng'],
  description:
      'General Tso’s Chicken adalah ayam goreng renyah dengan saus pedas manis.',
  alat: ['Wajan', 'Pisau', 'Talenan', 'Mangkuk'],
  bahan: [
    'Fillet ayam, potong dadu',
    'Tepung maizena',
    'Telur, kocok lepas',
    'Minyak goreng',
    'Saus pedas manis (campuran saus tomat, kecap asin, gula, dan cabai bubuk)',
    'Bawang hijau untuk taburan'
  ],
  langkahlangkah: [
    'Balur ayam dengan tepung maizena dan celupkan ke dalam telur.',
    'Goreng ayam hingga kecokelatan.',
    'Campur ayam goreng dengan saus pedas manis, aduk rata.',
    'Taburi dengan bawang hijau dan sajikan.'
  ],
  imageAsset: 'images/general_tso_chicken.jpg', // Nama file gambar
),

Recipe(
  name: 'Babi Asam Manis',
  category: ['Babi', 'Asam Manis'],
  description:
      'Babi Asam Manis adalah masakan khas dengan daging babi yang dimasak dalam saus asam manis lezat.',
  alat: ['Wajan', 'Pisau', 'Talenan', 'Mangkuk', 'Sendok Kayu'],
  bahan: [
    'Daging babi, potong dadu',
    'Tepung maizena',
    'Telur, kocok lepas',
    'Minyak goreng',
    'Saus asam manis (campuran saus tomat, cuka, gula, dan nanas)',
    'Paprika merah, potong kotak',
    'Bawang bombay, iris memanjang',
    'Nanas, potong kecil-kecil'
  ],
  langkahlangkah: [
    'Balur daging babi dengan tepung maizena dan celupkan ke dalam telur.',
    'Goreng babi hingga kecokelatan, tiriskan.',
    'Tumis bawang bombay, paprika, dan nanas hingga harum.',
    'Masukkan saus asam manis dan aduk hingga rata.',
    'Tambahkan daging babi goreng ke dalam saus, masak sebentar hingga meresap.',
    'Sajikan hangat.'
  ],
  imageAsset: 'images/sweet_sour_pork.jpg', // Nama file gambar
),

];

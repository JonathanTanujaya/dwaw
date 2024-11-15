import 'package:main/models/recipe.dart';

var rList = [
  Recipe(
    name: 'Ayam Kung Pao',
    category: ['Ayam', 'Pedas'],
    description: 'Ayam Kung Pao adalah potongan ayam goreng ala Cina dengan cabai kering. Versi Sichuan memiliki rasa pedas khas dengan merica Sichuan.',
    alat: [
      '1. Wajan',
      '2. Spatula',
      '3. Pisau',
      '4. Talenan'
    ],
    bahan: [
      '1. 300 gram fillet paha ayam, potong dadu',
      '2. 3 siung bawang putih, cincang',
      '3. 3 buah cabai kering, potong kecil',
      '4. 1 buah bawang bombay, potong kotak',
      '5. 2 sdm saus tiram',
      '6. 1 sdm kecap manis',
      '7. 1 sdm kecap asin',
      '8. 1 sdt gula pasir',
      '9. 1 sdt minyak wijen',
      '10. 1 batang daun bawang, iris besar',
      '11. Secukupnya lada dan minyak untuk menumis'
    ],
    langkahlangkah: [
      '1. Panaskan wajan dengan sedikit minyak, tumis bawang putih hingga harum.',
      '2. Masukkan ayam dan tumis hingga matang.',
      '3. Tambahkan bawang bombay dan cabai kering, aduk rata.',
      '4. Masukkan saus tiram, kecap manis, kecap asin, gula, dan minyak wijen. Aduk rata.',
      '5. Tambahkan daun bawang, masak sebentar, lalu sajikan.'
    ],
    imageAsset: 'images/'
  ),
  Recipe(
    name: 'Bebek Peking',
    category: ['Bebek', 'Panggang'],
    description: 'Bebek Peking adalah hidangan mewah khas China dengan kulit bebek yang garing dan daging yang lembut, biasanya disajikan dengan pancake tipis dan saus hoisin.',
    alat: [
      '1. Oven',
      '2. Pisau',
      '3. Talenan',
      '4. Kuas masak'
    ],
    bahan: [
      '1. 1 ekor bebek, bersihkan',
      '2. 2 sdm madu',
      '3. 1 sdm cuka',
      '4. 1 sdm saus hoisin',
      '5. 1 sdt garam',
      '6. 1 sdt lada',
      '7. Secukupnya air panas untuk membilas bebek'
    ],
    langkahlangkah: [
      '1. Bilas bebek dengan air panas hingga kulitnya kencang.',
      '2. Campur madu, cuka, saus hoisin, garam, dan lada, oleskan ke seluruh bagian bebek.',
      '3. Diamkan selama 12 jam di lemari es agar bumbu meresap.',
      '4. Panggang bebek di oven dengan suhu 200°C selama 1 jam hingga kulitnya garing.',
      '5. Potong bebek sesuai selera, sajikan dengan pancake tipis dan saus hoisin.'
    ],
    imageAsset: 'images/'
  ),
  Recipe(
    name: 'Cha Siu (Babi Panggang)',
    category: ['Babi', 'Panggang'],
    description: 'Cha Siu adalah daging babi panggang khas China dengan bumbu manis dan sedikit pedas.',
    alat: [
      '1. Oven',
      '2. Pisau',
      '3. Talenan',
      '4. Kuas masak'
    ],
    bahan: [
      '1. 500 gram daging babi bagian punggung, potong memanjang',
      '2. 2 sdm saus hoisin',
      '3. 1 sdm madu',
      '4. 1 sdm kecap manis',
      '5. 1 sdt kecap asin',
      '6. 1 sdt lima rempah bubuk',
      '7. 2 siung bawang putih, cincang',
      '8. 1 sdt minyak wijen'
    ],
    langkahlangkah: [
      '1. Campurkan saus hoisin, madu, kecap manis, kecap asin, lima rempah, bawang putih, dan minyak wijen.',
      '2. Oleskan campuran bumbu ke seluruh bagian daging babi.',
      '3. Diamkan selama 2 jam di dalam lemari es.',
      '4. Panggang daging babi di oven pada suhu 180°C selama 30-40 menit.',
      '5. Potong daging tipis-tipis dan sajikan.'
    ],
    imageAsset: 'images/'
  ),
  Recipe(
    name: 'Kwetiau Siram',
    category: ['Mie', 'Siram'],
    description: 'Kwetiau Siram adalah mie lebar yang disiram dengan saus kental dan berbagai bahan seperti daging, seafood, dan sayuran.',
    alat: [
      '1. Wajan besar',
      '2. Spatula',
      '3. Pisau',
      '4. Talenan'
    ],
    bahan: [
      '1. 200 gram kwetiau, rebus dan tiriskan',
      '2. 100 gram udang, kupas kulitnya',
      '3. 100 gram daging ayam, iris tipis',
      '4. 2 siung bawang putih, cincang',
      '5. 1 buah wortel, iris tipis',
      '6. 1 batang daun bawang, iris',
      '7. 2 sdm saus tiram',
      '8. 1 sdm kecap manis',
      '9. 1 sdt gula',
      '10. Secukupnya lada dan minyak untuk menumis'
    ],
    langkahlangkah: [
      '1. Tumis bawang putih dalam wajan hingga harum.',
      '2. Masukkan udang dan ayam, masak hingga matang.',
      '3. Tambahkan wortel dan daun bawang, tumis sebentar.',
      '4. Masukkan kwetiau, saus tiram, kecap manis, gula, dan lada. Aduk rata.',
      '5. Sajikan dalam piring dan nikmati.'
    ],
    imageAsset: 'images/'
  ),
  Recipe(
    name: 'Mapo Tofu',
    category: ['Tahu', 'Pedas'],
    description: 'Mapo Tofu adalah hidangan pedas khas Sichuan yang menggunakan tahu lembut dan daging sapi cincang dalam saus pedas.',
    alat: [
      '1. Wajan',
      '2. Spatula',
      '3. Pisau',
      '4. Talenan'
    ],
    bahan: [
      '1. 300 gram tahu sutra, potong kotak',
      '2. 200 gram daging sapi cincang',
      '3. 3 siung bawang putih, cincang',
      '4. 1 batang daun bawang, iris halus',
      '5. 2 sdm saus pedas Sichuan',
      '6. 1 sdm saus tiram',
      '7. 1 sdt gula',
      '8. 1 sdt minyak wijen',
      '9. 1 sdt merica Sichuan',
      '10. Secukupnya minyak untuk menumis'
    ],
    langkahlangkah: [
      '1. Tumis bawang putih dalam wajan dengan sedikit minyak hingga harum.',
      '2. Masukkan daging sapi cincang, masak hingga matang.',
      '3. Tambahkan saus pedas Sichuan dan saus tiram, aduk rata.',
      '4. Masukkan tahu sutra dan aduk perlahan.',
      '5. Masak dengan api kecil hingga bumbu meresap, lalu sajikan dengan taburan daun bawang.'
    ],
    imageAsset: 'images/'
  ),
  Recipe(
    name: 'Sapi Lada Hitam',
    category: ['Sapi', 'Pedas'],
    description: 'Sapi Lada Hitam adalah hidangan sapi yang dimasak dengan lada hitam dan saus pedas khas China.',
    alat: [
      '1. Wajan',
      '2. Spatula',
      '3. Pisau',
      '4. Talenan'
    ],
    bahan: [
      '1. 300 gram daging sapi, potong tipis',
      '2. 2 siung bawang putih, cincang',
      '3. 1 sdm saus tiram',
      '4. 1 sdm kecap asin',
      '5. 1 sdt lada hitam',
      '6. 1 sdt gula',
      '7. 1 sdt minyak wijen',
      '8. Secukupnya minyak untuk menumis',
      '9. 1 batang daun bawang, iris tipis'
    ],
    langkahlangkah: [
      '1. Panaskan minyak dalam wajan, tumis bawang putih hingga harum.',
      '2. Masukkan daging sapi, masak hingga berubah warna.',
      '3. Tambahkan saus tiram, kecap asin, lada hitam, dan gula. Aduk rata.',
      '4. Masukkan daun bawang dan masak sebentar.',
      '5
];

import '../domain/product_domain.dart';

final dummyName = [
  'Swift 3 Infinity 4',
  'Aspire Vero',
  'Nitro 5',
  'Helios 300',
  'Aspire 5 Slim',
  'Lenovo Thinkbook 16 Gen 4 (16″ AMD)',
  'Thinkbook 13s Gen 4 (13" AMD)',
  'Thinkbook 13s Gen 4 (13" Intel)'
];

final dummyImage = [
  'https://cdn.statically.io/img/www.acerid.com/f=auto%2Cq=80/wp-content/uploads/2022/05/juni-swift.png',
  'https://cdn.statically.io/img/www.acerid.com/f=auto%2Cq=80/wp-content/uploads/2022/05/juni-vero.png',
  'https://cdn.statically.io/img/www.acerid.com/f=auto%2Cq=80/wp-content/uploads/2022/06/juni-nitro.png',
  'https://cdn.statically.io/img/www.acerid.com/f=auto%2Cq=80/wp-content/uploads/2022/05/juni-helios.png',
  'https://cdn.statically.io/img/www.acerid.com/f=auto%2Cq=80/wp-content/uploads/2022/05/juni-helios.png',
  'https://www.lenovo.com/medias/lenovo-laptops-thinkbook-16-gen-4-16-amd-series.png?context=bWFzdGVyfHJvb3R8MTAzODg5fGltYWdlL3BuZ3xoOTkvaGU1LzE0ODA2MzY4ODQ1ODU0LnBuZ3xiZTcyZWMxZjc0Zjg1NTBiN2M0Yjk4NmM5MDViNDNkMDNlZjM0MmZhZGE3NjRjMTM2YjE5YWM5NTRhMDRiY2Rk&w=1920',
  'https://www.lenovo.com/medias/lenovo-laptops-thinkbook-13s-gen-4-13-amd-series.png?context=bWFzdGVyfHJvb3R8NDc4OTg1fGltYWdlL3BuZ3xoMDEvaGNmLzE0MTIzODI0NzA5NjYyLnBuZ3xkZmFlNmRkYjE2ZDA1OWJjZTQ3Mzk1NjQ3Nzg5NWJlNDY2OWYwNzFlOTAxMDJmY2FjMzMzYTE0MzllNjFkMTZh&w=1920',
  'https://www.lenovo.com/medias/lenovo-laptops-thinkbook-13s-gen-4-13-amd-series.png?context=bWFzdGVyfHJvb3R8NDc4OTg1fGltYWdlL3BuZ3xoMDEvaGNmLzE0MTIzODI0NzA5NjYyLnBuZ3xkZmFlNmRkYjE2ZDA1OWJjZTQ3Mzk1NjQ3Nzg5NWJlNDY2OWYwNzFlOTAxMDJmY2FjMzMzYTE0MzllNjFkMTZh&w=1920'
];

final dummyDescription = [
  '''
    <ul>
      <li>Intel&reg; Core&trade; i7-1165G7 Processor</li>
      <li>Intel&reg; Iris&reg; Xe Graphics 96 EU / Intel&reg; Iris&reg; Xe Graphics 80 EU</li>
      <li>Microsoft Office Home &amp; Student 2021</li>
  </ul>
  ''',
  '''
  <ul>
    <li>Intel Core i5-1135G7 Processor</li>
    <li>Intel&reg; Iris&reg; Xe Graphics</li>
    <li>Microsoft Office Home &amp; Student 2021</li>
  </ul>
  ''',
  """
  <ul>
    <li>Intel&reg; Core&trade; i5-11400H processor (12MB cache, up to 4.50Ghz)</li>
    <li>NVIDIA&reg; GeForce&reg; RTX 3050 with 4GB of GDDR6</li>
    <li>Microsoft Office Home &amp; Student 2021</li>
  </ul> 
  """,
  """
  <ul>
    <li>Intel&reg; Core&trade; i9-11900H processor (24MB cache, up to 4.80Ghz)</li>
    <li>NVIDIA&reg; GeForce&reg; RTX 3070 with 8 GB GDDR6</li>
    <li>Microsoft Office Home &amp; Student 2021</li>
  </ul>
  """,
  """
  <ul>
    <li>Intel&reg; Core&trade; i7-1165G7</li>
    <li>Intel&reg; Iris&reg; Xe Graphics (54)/ Nvidia Geforce MX350 (54G)</li>
    <li>Microsoft Office Home &amp; Student 2021</li>
    <li>Free wireless mouse* (for purchase of Intel Core i3 model at Blibli &amp; Acer eStore)</li>
  </ul>
  """,
  """
  <ul>
    <li>Top performer with AMD Ryzen&trade; 6000 Series CPU</li>
    <li>16&Prime; display with 16:10 aspect ratio for detail work</li>
    <li>Up to NVIDIA<sup>&reg;</sup> GeForce RTX&trade; 2050 graphics</li>
  </ul>
  """,
  """
  <ul>
    <li>Powered by AMD Ryzen&trade; 6000 Series Mobile Processor</li>
    <li>Light 13.3" SMB laptop with premium aluminum design&nbsp;</li>
    <li>AI-based technology for smarter meetings &amp; videoconferencing</li>
  </ul>
  """,
  """
  <ul>
    <li>Light 13.3" SMB laptop with premium aluminum design</li>
    <li>Up to all-day-plus battery life &amp; Rapid Charge</li>
    <li>Secure fingerprint reader integrated with power button</li>
  </ul>
  """
];

final listDummy = List.generate(
    8,
    (index) => ProductDomain(
        id: index + 1,
        name: dummyName[index],
        image: dummyImage[index],
        description: dummyDescription[index],
        tag: index % 3 == 0
            ? 'terlaris'
            : index % 4 == 0
                ? 'terbaik'
                : 'favorit',
        price: (index + 1) * 1200000,
        stock: index % 3 == 0
            ? 2
            : index % 4 == 0
                ? 5
                : 1,
        discount: index % 3 == 0
            ? 12
            : index % 4 == 0
                ? 7
                : 9,
        sold: (index + 1) * 7,
        rating: index % 3 == 0
            ? 4.7
            : index % 4 == 0
                ? 4.9
                : 4.3));

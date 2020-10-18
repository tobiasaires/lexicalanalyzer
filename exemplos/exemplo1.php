<?php
//comentario
/*
comentario
*/
$idade = 10.1;

$x = 2+2;
$x = 2-2;
$x = 2*2;
$x = 2/2;
$x = 2%2;
$x = 2**2;
$x +=2;
$x -=2;
$x *=2;
$x %=2;
$x /=2;
$x++;
$x--;
$x = 2 ? $idade : 3;

if($hora <= 12)
echo "manha";
else if($hora > 12 && $hora <= 18)
  echo "tarde";
else
  echo "noite";

while($idade) {
    echo $idade;
}


for($contador = 0; $contador < 10; $contador++)
{
  echo $contador;
}

$vetor = array(1, 2, 3, 4, 5);
foreach($vetor as $item)
{
echo $item;
}

$i = 0;
do {
    echo $i;
} while ($i > 0);

$matriz = [[1,2,3], [4,5,6]];

function($atributo)
{
    return $atributo;
}

?>
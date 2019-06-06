<?php
$links = [
    '5.2' => 'https://www.google.com/doodles/celebrating-50-years-of-kids-coding',
    '7.2' => 'https://github.com/checkstyle/checkstyle/blob/master/src/main/resources/sun_checks.xml',
    'A.1' => 'https://github.com/fracz/refactor-extractor/tree/master/results-java/ReactiveX--RxJava',
    'B.1' => 'https://github.com/fracz/refactor-extractor/tree/master/results-java/JetBrains--kotlin',
    'B.2' => 'https://github.com/JetBrains/kotlin/commit/003182f499651388aa3ca629752ef0207d52a412',
    'B.3' => 'https://github.com/fracz/refactor-extractor/tree/master/results-java/JetBrains--kotlin/003182f499651388aa3ca629752ef0207d52a412',
    'B.4' => 'https://github.com/fracz/refactor-extractor/tree/master/results-java/JetBrains--kotlin/003182f499651388aa3ca629752ef0207d52a412/diffs',
    'B.5' => 'https://github.com/fracz/refactor-extractor/blob/master/results-java/JetBrains--kotlin/003182f499651388aa3ca629752ef0207d52a412/diffs/CallTranslator.javaexpressionAsFunctionCall.txt',
    'C.1' => 'https://github.com/fracz/code-quality-tensorflow/blob/master/model2.py',
    'C.2' => 'https://github.com/fracz/code-quality-tensorflow/blob/master/model4.py',
    'E.3' => 'https://github.com/fracz/scqm/blob/master/scqm-model/scqm.py',
    'E.4' => 'https://github.com/fracz/scqm/tree/master/trained/code-fracz-645',
    'G.1' => 'https://gist.github.com/fracz/a3d3a5e6d12a5538f2858a79fd568fd1',
    'H.1' => 'https://www.youtube.com/watch?v=5WobKP58YIk',
    'H.2' => 'https://www.youtube.com/watch?v=nrCejJjxMe4',
];
$list = [];
foreach ($links as $linkLabel => $linkUrl) {
    file_put_contents(
        __DIR__ . "/$linkLabel.html",
        <<<C
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
        content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible"
        content="ie=edge">
    <meta http-equiv="Refresh" content="1; url=$linkUrl">
    <title>PhD Link $linkLabel</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
</head>
<body>
    <div class="container">
    <h1>Modelowanie jakości kodu źródłowego na podstawie danych gromadzonych w systemach kontroli wersji</h1>
    <h2>Wojciech Frącz</h2>
    <h3>Przekierowanie do linku $linkLabel z rozprawy doktorskiej</h3>
    <h4><span class="glyphicon glyphicon-globe"></span> <a href="$linkUrl">$linkUrl</a></h4>
    </div>
</body>
</html>
C
    );
    $list[] = '<tr><th scope="row">' . $linkLabel . '</th><td><a href="' . $linkUrl . '">' . $linkUrl . '</a></td></tr>';
}
$list = implode(PHP_EOL, $list);
$linksPage = <<<C
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
        content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible"
        content="ie=edge">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <title>PhD Linki</title>
</head>
<body>
    <div class="container">
    <h1>Modelowanie jakości kodu źródłowego na podstawie danych gromadzonych w systemach kontroli wersji</h1>
    <h2>Wojciech Frącz</h2>
    <h3>Skrócone linki z rozprawy doktorskiej</h3>
    <table class="table">
        <tbody>
        $list
        </tbody>
    </table>
    </div>
</body>
</html>
C;
file_put_contents(__DIR__ . '/index.html', $linksPage);

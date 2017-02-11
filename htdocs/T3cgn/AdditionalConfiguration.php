<?php

if ((PHP_SAPI === 'cli') && ($_SERVER['argc'] >= 3)) {
    $APPLICATION_ENV = $_SERVER['argv'][2];
    unset($_SERVER['argv'][2]);
} else {
    $APPLICATION_ENV = getenv("TYPO3_CONTEXT");
}
$APPLICATION_ENV = str_replace('/', '.', $APPLICATION_ENV);

if (file_exists(realpath(dirname(__FILE__)) .
        '/AdditionalConfiguration.Local.' . $APPLICATION_ENV . '.php') === true
) {
    include realpath(dirname(__FILE__)) .
        '/AdditionalConfiguration.Local.' . $APPLICATION_ENV . '.php';
}

if (file_exists(realpath(dirname(__FILE__)) .
        '/AdditionalConfiguration.Server.' . $APPLICATION_ENV . '.php') === true
) {
    include realpath(dirname(__FILE__)) .
        '/AdditionalConfiguration.Server.' . $APPLICATION_ENV . '.php';
}



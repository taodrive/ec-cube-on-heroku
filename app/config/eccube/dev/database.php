<?php

$dbUrl = getenv('DATABASE_URL');
$url = parse_url($dbUrl);

return [
  'database' => [
    'driver' => 'pdo_pgsql',
    'host' => $url['host'],
    'dbname' => substr($url['path'],1),
    'port' => $url['port'],
    'user' => $url['user'],
    'password' => $url['pass'],
    'charset' => 'utf8',
    'defaultTableOptions' => [
      'collate' => 'utf8_general_ci'
    ]
  ]
];

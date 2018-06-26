<?php

$url = parse_url(getenv('REDIS_URL'));
$host = $url['host'];
$port = $url['port'];
$password = $url['pass'];

return array (
  'session_handler' => array (
    'enabled' => true,
    'save_handler' => 'redis',
    'save_path' => 'tcp://'.$host.':'.$port.'?auth='.$password
  )
);

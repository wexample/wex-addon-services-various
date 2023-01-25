<?php

$CONFIG = [
    'filesystem_check_changes' => 1,
    // Avoid a lot of file locking errors.
    'filelocking.enabled' => false,
    // Defined on app install.
    'overwriteprotocol' => 'NEXTCLOUD_PROTOCOL',
    'trashbin_retention_obligation' => 'auto, 1',
];

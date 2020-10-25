<?php

/**
 *  配置文件
 *      是执行命令  php artisan vendor:publish --provider="LeePrince\MinprogramMember\MemberServiceProvider" 生成的配置文件
 */
return [
    'table' => [
        'member' => 'admin_member',
        'account' => 'admin_member_account',
        'transaction_record' => 'admin_member_transaction_record',
        'order' => 'admin_order',
    ]
];

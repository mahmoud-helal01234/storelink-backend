<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    public function up()
    {
        if (DB::getDriverName() === 'sqlite') {
            DB::unprepared("CREATE TRIGGER protect_admin_users_from_deletion
                BEFORE DELETE ON users FOR EACH ROW WHEN OLD.role = 'admin'
                BEGIN SELECT RAISE(ABORT, 'Admin accounts cannot be deleted.'); END");
            return;
        }

        if (DB::getDriverName() !== 'mysql') {
            throw new RuntimeException('Admin deletion protection requires MySQL or SQLite.');
        }

        DB::unprepared("CREATE TRIGGER protect_admin_users_from_deletion
            BEFORE DELETE ON users FOR EACH ROW
            BEGIN
                IF OLD.role = 'admin' THEN
                    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Admin accounts cannot be deleted.';
                END IF;
            END");
    }

    public function down()
    {
        DB::unprepared('DROP TRIGGER IF EXISTS protect_admin_users_from_deletion');
    }
};

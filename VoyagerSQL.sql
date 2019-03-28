DROP TABLE IF EXISTS "data_rows";
DROP SEQUENCE IF EXISTS data_rows_id_seq;
CREATE SEQUENCE data_rows_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."data_rows" (
    "id" integer DEFAULT nextval('data_rows_id_seq') NOT NULL,
    "data_type_id" integer NOT NULL,
    "field" character varying(255) NOT NULL,
    "type" character varying(255) NOT NULL,
    "display_name" character varying(255) NOT NULL,
    "required" boolean DEFAULT false NOT NULL,
    "browse" boolean DEFAULT true NOT NULL,
    "read" boolean DEFAULT true NOT NULL,
    "edit" boolean DEFAULT true NOT NULL,
    "add" boolean DEFAULT true NOT NULL,
    "delete" boolean DEFAULT true NOT NULL,
    "details" text,
    "order" integer DEFAULT '1' NOT NULL,
    CONSTRAINT "data_rows_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "data_rows_data_type_id_foreign" FOREIGN KEY (data_type_id) REFERENCES data_types(id) ON UPDATE CASCADE ON DELETE CASCADE NOT DEFERRABLE
) WITH (oids = false);

INSERT INTO "data_rows" ("id", "data_type_id", "field", "type", "display_name", "required", "browse", "read", "edit", "add", "delete", "details", "order") VALUES
(1,	1,	'id',	'number',	'ID',	'1',	'0',	'0',	'0',	'0',	'0',	NULL,	1),
(2,	1,	'name',	'text',	'Name',	'1',	'1',	'1',	'1',	'1',	'1',	NULL,	2),
(3,	1,	'email',	'text',	'Email',	'1',	'1',	'1',	'1',	'1',	'1',	NULL,	3),
(4,	1,	'password',	'password',	'Password',	'1',	'0',	'0',	'1',	'1',	'0',	NULL,	4),
(5,	1,	'remember_token',	'text',	'Remember Token',	'0',	'0',	'0',	'0',	'0',	'0',	NULL,	5),
(6,	1,	'created_at',	'timestamp',	'Created At',	'0',	'1',	'1',	'0',	'0',	'0',	NULL,	6),
(7,	1,	'updated_at',	'timestamp',	'Updated At',	'0',	'0',	'0',	'0',	'0',	'0',	NULL,	7),
(8,	1,	'avatar',	'image',	'Avatar',	'0',	'1',	'1',	'1',	'1',	'1',	NULL,	8),
(9,	1,	'user_belongsto_role_relationship',	'relationship',	'Role',	'0',	'1',	'1',	'1',	'1',	'0',	'{"model":"TCG\\Voyager\\Models\\Role","table":"roles","type":"belongsTo","column":"role_id","key":"id","label":"display_name","pivot_table":"roles","pivot":0}',	10),
(10,	1,	'user_belongstomany_role_relationship',	'relationship',	'Roles',	'0',	'1',	'1',	'1',	'1',	'0',	'{"model":"TCG\\Voyager\\Models\\Role","table":"roles","type":"belongsToMany","column":"id","key":"id","label":"display_name","pivot_table":"user_roles","pivot":"1","taggable":"0"}',	11),
(11,	1,	'settings',	'hidden',	'Settings',	'0',	'0',	'0',	'0',	'0',	'0',	NULL,	12),
(12,	2,	'id',	'number',	'ID',	'1',	'0',	'0',	'0',	'0',	'0',	NULL,	1),
(13,	2,	'name',	'text',	'Name',	'1',	'1',	'1',	'1',	'1',	'1',	NULL,	2),
(14,	2,	'created_at',	'timestamp',	'Created At',	'0',	'0',	'0',	'0',	'0',	'0',	NULL,	3),
(15,	2,	'updated_at',	'timestamp',	'Updated At',	'0',	'0',	'0',	'0',	'0',	'0',	NULL,	4),
(16,	3,	'id',	'number',	'ID',	'1',	'0',	'0',	'0',	'0',	'0',	NULL,	1),
(17,	3,	'name',	'text',	'Name',	'1',	'1',	'1',	'1',	'1',	'1',	NULL,	2),
(18,	3,	'created_at',	'timestamp',	'Created At',	'0',	'0',	'0',	'0',	'0',	'0',	NULL,	3),
(19,	3,	'updated_at',	'timestamp',	'Updated At',	'0',	'0',	'0',	'0',	'0',	'0',	NULL,	4),
(20,	3,	'display_name',	'text',	'Display Name',	'1',	'1',	'1',	'1',	'1',	'1',	NULL,	5),
(21,	1,	'role_id',	'text',	'Role',	'1',	'1',	'1',	'1',	'1',	'1',	NULL,	9);

DROP TABLE IF EXISTS "data_types";
DROP SEQUENCE IF EXISTS data_types_id_seq;
CREATE SEQUENCE data_types_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."data_types" (
    "id" integer DEFAULT nextval('data_types_id_seq') NOT NULL,
    "name" character varying(255) NOT NULL,
    "slug" character varying(255) NOT NULL,
    "display_name_singular" character varying(255) NOT NULL,
    "display_name_plural" character varying(255) NOT NULL,
    "icon" character varying(255),
    "model_name" character varying(255),
    "description" character varying(255),
    "generate_permissions" boolean DEFAULT false NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    "server_side" smallint DEFAULT '0' NOT NULL,
    "controller" character varying(255),
    "policy_name" character varying(255),
    "details" text,
    CONSTRAINT "data_types_name_unique" UNIQUE ("name"),
    CONSTRAINT "data_types_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "data_types_slug_unique" UNIQUE ("slug")
) WITH (oids = false);

INSERT INTO "data_types" ("id", "name", "slug", "display_name_singular", "display_name_plural", "icon", "model_name", "description", "generate_permissions", "created_at", "updated_at", "server_side", "controller", "policy_name", "details") VALUES
(1,	'users',	'users',	'User',	'Users',	'voyager-person',	'TCG\Voyager\Models\User',	'',	'1',	'2019-03-28 16:48:08',	'2019-03-28 16:48:08',	'0',	'TCG\Voyager\Http\Controllers\VoyagerUserController',	'TCG\Voyager\Policies\UserPolicy',	NULL),
(2,	'menus',	'menus',	'Menu',	'Menus',	'voyager-list',	'TCG\Voyager\Models\Menu',	'',	'1',	'2019-03-28 16:48:08',	'2019-03-28 16:48:08',	'0',	'',	NULL,	NULL),
(3,	'roles',	'roles',	'Role',	'Roles',	'voyager-lock',	'TCG\Voyager\Models\Role',	'',	'1',	'2019-03-28 16:48:08',	'2019-03-28 16:48:08',	'0',	'',	NULL,	NULL);

DROP TABLE IF EXISTS "menu_items";
DROP SEQUENCE IF EXISTS menu_items_id_seq;
CREATE SEQUENCE menu_items_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."menu_items" (
    "id" integer DEFAULT nextval('menu_items_id_seq') NOT NULL,
    "menu_id" integer,
    "title" character varying(255) NOT NULL,
    "url" character varying(255) NOT NULL,
    "target" character varying(255) DEFAULT '_self' NOT NULL,
    "icon_class" character varying(255),
    "color" character varying(255),
    "parent_id" integer,
    "order" integer NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    "route" character varying(255),
    "parameters" text,
    CONSTRAINT "menu_items_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "menu_items_menu_id_foreign" FOREIGN KEY (menu_id) REFERENCES menus(id) ON DELETE CASCADE NOT DEFERRABLE
) WITH (oids = false);

INSERT INTO "menu_items" ("id", "menu_id", "title", "url", "target", "icon_class", "color", "parent_id", "order", "created_at", "updated_at", "route", "parameters") VALUES
(1,	1,	'Dashboard',	'',	'_self',	'voyager-boat',	NULL,	NULL,	1,	'2019-03-28 16:48:08',	'2019-03-28 16:48:08',	'voyager.dashboard',	NULL),
(2,	1,	'Media',	'',	'_self',	'voyager-images',	NULL,	NULL,	5,	'2019-03-28 16:48:08',	'2019-03-28 16:48:08',	'voyager.media.index',	NULL),
(3,	1,	'Users',	'',	'_self',	'voyager-person',	NULL,	NULL,	3,	'2019-03-28 16:48:08',	'2019-03-28 16:48:08',	'voyager.users.index',	NULL),
(4,	1,	'Roles',	'',	'_self',	'voyager-lock',	NULL,	NULL,	2,	'2019-03-28 16:48:08',	'2019-03-28 16:48:08',	'voyager.roles.index',	NULL),
(5,	1,	'Tools',	'',	'_self',	'voyager-tools',	NULL,	NULL,	9,	'2019-03-28 16:48:08',	'2019-03-28 16:48:08',	NULL,	NULL),
(6,	1,	'Menu Builder',	'',	'_self',	'voyager-list',	NULL,	5,	10,	'2019-03-28 16:48:08',	'2019-03-28 16:48:08',	'voyager.menus.index',	NULL),
(7,	1,	'Database',	'',	'_self',	'voyager-data',	NULL,	5,	11,	'2019-03-28 16:48:08',	'2019-03-28 16:48:08',	'voyager.database.index',	NULL),
(8,	1,	'Compass',	'',	'_self',	'voyager-compass',	NULL,	5,	12,	'2019-03-28 16:48:08',	'2019-03-28 16:48:08',	'voyager.compass.index',	NULL),
(9,	1,	'BREAD',	'',	'_self',	'voyager-bread',	NULL,	5,	13,	'2019-03-28 16:48:08',	'2019-03-28 16:48:08',	'voyager.bread.index',	NULL),
(10,	1,	'Settings',	'',	'_self',	'voyager-settings',	NULL,	NULL,	14,	'2019-03-28 16:48:08',	'2019-03-28 16:48:08',	'voyager.settings.index',	NULL),
(11,	1,	'Hooks',	'',	'_self',	'voyager-hook',	NULL,	5,	13,	'2019-03-28 16:48:09',	'2019-03-28 16:48:09',	'voyager.hooks',	NULL);

DROP TABLE IF EXISTS "menus";
DROP SEQUENCE IF EXISTS menus_id_seq;
CREATE SEQUENCE menus_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."menus" (
    "id" integer DEFAULT nextval('menus_id_seq') NOT NULL,
    "name" character varying(255) NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "menus_name_unique" UNIQUE ("name"),
    CONSTRAINT "menus_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "menus" ("id", "name", "created_at", "updated_at") VALUES
(1,	'admin',	'2019-03-28 16:48:08',	'2019-03-28 16:48:08');

DROP TABLE IF EXISTS "migrations";
DROP SEQUENCE IF EXISTS migrations_id_seq;
CREATE SEQUENCE migrations_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."migrations" (
    "id" integer DEFAULT nextval('migrations_id_seq') NOT NULL,
    "migration" character varying(255) NOT NULL,
    "batch" integer NOT NULL,
    CONSTRAINT "migrations_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "migrations" ("id", "migration", "batch") VALUES
(1,	'2014_10_12_000000_create_users_table',	1),
(2,	'2014_10_12_100000_create_password_resets_table',	1),
(3,	'2016_01_01_000000_add_voyager_user_fields',	1),
(4,	'2016_01_01_000000_create_data_types_table',	1),
(5,	'2016_05_19_173453_create_menu_table',	1),
(6,	'2016_10_21_190000_create_roles_table',	1),
(7,	'2016_10_21_190000_create_settings_table',	1),
(8,	'2016_11_30_135954_create_permission_table',	1),
(9,	'2016_11_30_141208_create_permission_role_table',	1),
(10,	'2016_12_26_201236_data_types__add__server_side',	1),
(11,	'2017_01_13_000000_add_route_to_menu_items_table',	1),
(12,	'2017_01_14_005015_create_translations_table',	1),
(13,	'2017_01_15_000000_make_table_name_nullable_in_permissions_table',	1),
(14,	'2017_03_06_000000_add_controller_to_data_types_table',	1),
(15,	'2017_04_21_000000_add_order_to_data_rows_table',	1),
(16,	'2017_07_05_210000_add_policyname_to_data_types_table',	1),
(17,	'2017_08_05_000000_add_group_to_settings_table',	1),
(18,	'2017_11_26_013050_add_user_role_relationship',	1),
(19,	'2017_11_26_015000_create_user_roles_table',	1),
(20,	'2018_03_11_000000_add_user_settings',	1),
(21,	'2018_03_14_000000_add_details_to_data_types_table',	1),
(22,	'2018_03_16_000000_make_settings_value_nullable',	1);

DROP TABLE IF EXISTS "password_resets";
CREATE TABLE "public"."password_resets" (
    "email" character varying(255) NOT NULL,
    "token" character varying(255) NOT NULL,
    "created_at" timestamp(0)
) WITH (oids = false);

CREATE INDEX "password_resets_email_index" ON "public"."password_resets" USING btree ("email");


DROP TABLE IF EXISTS "permission_role";
CREATE TABLE "public"."permission_role" (
    "permission_id" bigint NOT NULL,
    "role_id" bigint NOT NULL,
    CONSTRAINT "permission_role_pkey" PRIMARY KEY ("permission_id", "role_id"),
    CONSTRAINT "permission_role_permission_id_foreign" FOREIGN KEY (permission_id) REFERENCES permissions(id) ON DELETE CASCADE NOT DEFERRABLE,
    CONSTRAINT "permission_role_role_id_foreign" FOREIGN KEY (role_id) REFERENCES roles(id) ON DELETE CASCADE NOT DEFERRABLE
) WITH (oids = false);

CREATE INDEX "permission_role_permission_id_index" ON "public"."permission_role" USING btree ("permission_id");

CREATE INDEX "permission_role_role_id_index" ON "public"."permission_role" USING btree ("role_id");

INSERT INTO "permission_role" ("permission_id", "role_id") VALUES
(1,	1),
(2,	1),
(3,	1),
(4,	1),
(5,	1),
(6,	1),
(7,	1),
(8,	1),
(9,	1),
(10,	1),
(11,	1),
(12,	1),
(13,	1),
(14,	1),
(15,	1),
(16,	1),
(17,	1),
(18,	1),
(19,	1),
(20,	1),
(21,	1),
(22,	1),
(23,	1),
(24,	1),
(25,	1),
(26,	1);

DROP TABLE IF EXISTS "permissions";
DROP SEQUENCE IF EXISTS permissions_id_seq;
CREATE SEQUENCE permissions_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."permissions" (
    "id" bigint DEFAULT nextval('permissions_id_seq') NOT NULL,
    "key" character varying(255) NOT NULL,
    "table_name" character varying(255),
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "permissions_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE INDEX "permissions_key_index" ON "public"."permissions" USING btree ("key");

INSERT INTO "permissions" ("id", "key", "table_name", "created_at", "updated_at") VALUES
(1,	'browse_admin',	NULL,	'2019-03-28 16:48:08',	'2019-03-28 16:48:08'),
(2,	'browse_bread',	NULL,	'2019-03-28 16:48:08',	'2019-03-28 16:48:08'),
(3,	'browse_database',	NULL,	'2019-03-28 16:48:08',	'2019-03-28 16:48:08'),
(4,	'browse_media',	NULL,	'2019-03-28 16:48:08',	'2019-03-28 16:48:08'),
(5,	'browse_compass',	NULL,	'2019-03-28 16:48:08',	'2019-03-28 16:48:08'),
(6,	'browse_menus',	'menus',	'2019-03-28 16:48:08',	'2019-03-28 16:48:08'),
(7,	'read_menus',	'menus',	'2019-03-28 16:48:08',	'2019-03-28 16:48:08'),
(8,	'edit_menus',	'menus',	'2019-03-28 16:48:08',	'2019-03-28 16:48:08'),
(9,	'add_menus',	'menus',	'2019-03-28 16:48:08',	'2019-03-28 16:48:08'),
(10,	'delete_menus',	'menus',	'2019-03-28 16:48:08',	'2019-03-28 16:48:08'),
(11,	'browse_roles',	'roles',	'2019-03-28 16:48:08',	'2019-03-28 16:48:08'),
(12,	'read_roles',	'roles',	'2019-03-28 16:48:08',	'2019-03-28 16:48:08'),
(13,	'edit_roles',	'roles',	'2019-03-28 16:48:09',	'2019-03-28 16:48:09'),
(14,	'add_roles',	'roles',	'2019-03-28 16:48:09',	'2019-03-28 16:48:09'),
(15,	'delete_roles',	'roles',	'2019-03-28 16:48:09',	'2019-03-28 16:48:09'),
(16,	'browse_users',	'users',	'2019-03-28 16:48:09',	'2019-03-28 16:48:09'),
(17,	'read_users',	'users',	'2019-03-28 16:48:09',	'2019-03-28 16:48:09'),
(18,	'edit_users',	'users',	'2019-03-28 16:48:09',	'2019-03-28 16:48:09'),
(19,	'add_users',	'users',	'2019-03-28 16:48:09',	'2019-03-28 16:48:09'),
(20,	'delete_users',	'users',	'2019-03-28 16:48:09',	'2019-03-28 16:48:09'),
(21,	'browse_settings',	'settings',	'2019-03-28 16:48:09',	'2019-03-28 16:48:09'),
(22,	'read_settings',	'settings',	'2019-03-28 16:48:09',	'2019-03-28 16:48:09'),
(23,	'edit_settings',	'settings',	'2019-03-28 16:48:09',	'2019-03-28 16:48:09'),
(24,	'add_settings',	'settings',	'2019-03-28 16:48:09',	'2019-03-28 16:48:09'),
(25,	'delete_settings',	'settings',	'2019-03-28 16:48:09',	'2019-03-28 16:48:09'),
(26,	'browse_hooks',	NULL,	'2019-03-28 16:48:09',	'2019-03-28 16:48:09');

DROP TABLE IF EXISTS "roles";
DROP SEQUENCE IF EXISTS roles_id_seq;
CREATE SEQUENCE roles_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."roles" (
    "id" bigint DEFAULT nextval('roles_id_seq') NOT NULL,
    "name" character varying(255) NOT NULL,
    "display_name" character varying(255) NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "roles_name_unique" UNIQUE ("name"),
    CONSTRAINT "roles_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "roles" ("id", "name", "display_name", "created_at", "updated_at") VALUES
(1,	'admin',	'Administrator',	'2019-03-28 16:48:08',	'2019-03-28 16:48:08'),
(2,	'user',	'Normal User',	'2019-03-28 16:48:08',	'2019-03-28 16:48:08');

DROP TABLE IF EXISTS "settings";
DROP SEQUENCE IF EXISTS settings_id_seq;
CREATE SEQUENCE settings_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."settings" (
    "id" integer DEFAULT nextval('settings_id_seq') NOT NULL,
    "key" character varying(255) NOT NULL,
    "display_name" character varying(255) NOT NULL,
    "value" text,
    "details" text,
    "type" character varying(255) NOT NULL,
    "order" integer DEFAULT '1' NOT NULL,
    "group" character varying(255),
    CONSTRAINT "settings_key_unique" UNIQUE ("key"),
    CONSTRAINT "settings_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "settings" ("id", "key", "display_name", "value", "details", "type", "order", "group") VALUES
(1,	'site.title',	'Site Title',	'Site Title',	'',	'text',	1,	'Site'),
(2,	'site.description',	'Site Description',	'Site Description',	'',	'text',	2,	'Site'),
(3,	'site.logo',	'Site Logo',	'',	'',	'image',	3,	'Site'),
(4,	'site.google_analytics_tracking_id',	'Google Analytics Tracking ID',	'',	'',	'text',	4,	'Site'),
(5,	'admin.bg_image',	'Admin Background Image',	'',	'',	'image',	5,	'Admin'),
(6,	'admin.title',	'Admin Title',	'Voyager',	'',	'text',	1,	'Admin'),
(7,	'admin.description',	'Admin Description',	'Welcome to Voyager. The Missing Admin for Laravel',	'',	'text',	2,	'Admin'),
(8,	'admin.loader',	'Admin Loader',	'',	'',	'image',	3,	'Admin'),
(9,	'admin.icon_image',	'Admin Icon Image',	'',	'',	'image',	4,	'Admin'),
(10,	'admin.google_analytics_client_id',	'Google Analytics Client ID (used for admin dashboard)',	'',	'',	'text',	1,	'Admin');

DROP TABLE IF EXISTS "translations";
DROP SEQUENCE IF EXISTS translations_id_seq;
CREATE SEQUENCE translations_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."translations" (
    "id" integer DEFAULT nextval('translations_id_seq') NOT NULL,
    "table_name" character varying(255) NOT NULL,
    "column_name" character varying(255) NOT NULL,
    "foreign_key" integer NOT NULL,
    "locale" character varying(255) NOT NULL,
    "value" text NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "translations_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "translations_table_name_column_name_foreign_key_locale_unique" UNIQUE ("table_name", "column_name", "foreign_key", "locale")
) WITH (oids = false);


DROP TABLE IF EXISTS "user_roles";
CREATE TABLE "public"."user_roles" (
    "user_id" bigint NOT NULL,
    "role_id" bigint NOT NULL,
    CONSTRAINT "user_roles_pkey" PRIMARY KEY ("user_id", "role_id"),
    CONSTRAINT "user_roles_role_id_foreign" FOREIGN KEY (role_id) REFERENCES roles(id) ON DELETE CASCADE NOT DEFERRABLE,
    CONSTRAINT "user_roles_user_id_foreign" FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE NOT DEFERRABLE
) WITH (oids = false);

CREATE INDEX "user_roles_role_id_index" ON "public"."user_roles" USING btree ("role_id");

CREATE INDEX "user_roles_user_id_index" ON "public"."user_roles" USING btree ("user_id");


DROP TABLE IF EXISTS "users";
DROP SEQUENCE IF EXISTS users_id_seq;
CREATE SEQUENCE users_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."users" (
    "id" bigint DEFAULT nextval('users_id_seq') NOT NULL,
    "name" character varying(255) NOT NULL,
    "email" character varying(255) NOT NULL,
    "email_verified_at" timestamp(0),
    "password" character varying(255) NOT NULL,
    "remember_token" character varying(100),
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    "avatar" character varying(255) DEFAULT 'users/default.png',
    "role_id" bigint,
    "settings" text,
    CONSTRAINT "users_email_unique" UNIQUE ("email"),
    CONSTRAINT "users_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "users_role_id_foreign" FOREIGN KEY (role_id) REFERENCES roles(id) NOT DEFERRABLE
) WITH (oids = false);

INSERT INTO "users" ("id", "name", "email", "email_verified_at", "password", "remember_token", "created_at", "updated_at", "avatar", "role_id", "settings") VALUES
(1,	'Admin Istrator',	'admin@email.com',	NULL,	'$2y$10$8xNI3nH/oEF7wdItsbrKveaOtgARvNnTTjfcVroWZiCvStmf1cShG',	NULL,	'2019-03-28 17:05:45',	'2019-03-28 17:05:45',	'users/default.png',	1,	NULL);

-- 2019-03-28 18:27:22.17568+00

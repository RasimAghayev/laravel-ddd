--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4 (Ubuntu 16.4-0ubuntu0.24.04.2)
-- Dumped by pg_dump version 16.4 (Ubuntu 16.4-0ubuntu0.24.04.2)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: additives; Type: TABLE; Schema: public; Owner: kim
--

CREATE TABLE public.additives (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    price real NOT NULL,
    weight real,
    measurement_id bigint,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.additives OWNER TO kim;

--
-- Name: additives_id_seq; Type: SEQUENCE; Schema: public; Owner: kim
--

CREATE SEQUENCE public.additives_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.additives_id_seq OWNER TO kim;

--
-- Name: additives_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kim
--

ALTER SEQUENCE public.additives_id_seq OWNED BY public.additives.id;


--
-- Name: areas; Type: TABLE; Schema: public; Owner: kim
--

CREATE TABLE public.areas (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    coordinates json NOT NULL,
    restaurant_id bigint NOT NULL,
    cost_of_delivery real NOT NULL,
    delivery_time integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.areas OWNER TO kim;

--
-- Name: areas_id_seq; Type: SEQUENCE; Schema: public; Owner: kim
--

CREATE SEQUENCE public.areas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.areas_id_seq OWNER TO kim;

--
-- Name: areas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kim
--

ALTER SEQUENCE public.areas_id_seq OWNED BY public.areas.id;


--
-- Name: audits; Type: TABLE; Schema: public; Owner: kim
--

CREATE TABLE public.audits (
    id bigint NOT NULL,
    user_type character varying(255),
    user_id bigint,
    event character varying(255) NOT NULL,
    auditable_type character varying(255) NOT NULL,
    auditable_id bigint NOT NULL,
    old_values text,
    new_values text,
    url text,
    ip_address inet,
    user_agent character varying(1023),
    tags character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.audits OWNER TO kim;

--
-- Name: audits_id_seq; Type: SEQUENCE; Schema: public; Owner: kim
--

CREATE SEQUENCE public.audits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.audits_id_seq OWNER TO kim;

--
-- Name: audits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kim
--

ALTER SEQUENCE public.audits_id_seq OWNED BY public.audits.id;


--
-- Name: bonus_category; Type: TABLE; Schema: public; Owner: kim
--

CREATE TABLE public.bonus_category (
    id bigint NOT NULL,
    category_id bigint NOT NULL,
    bonus_id bigint NOT NULL
);


ALTER TABLE public.bonus_category OWNER TO kim;

--
-- Name: bonus_category_id_seq; Type: SEQUENCE; Schema: public; Owner: kim
--

CREATE SEQUENCE public.bonus_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.bonus_category_id_seq OWNER TO kim;

--
-- Name: bonus_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kim
--

ALTER SEQUENCE public.bonus_category_id_seq OWNED BY public.bonus_category.id;


--
-- Name: bonus_menu; Type: TABLE; Schema: public; Owner: kim
--

CREATE TABLE public.bonus_menu (
    id bigint NOT NULL,
    menu_id bigint NOT NULL,
    bonus_id bigint NOT NULL
);


ALTER TABLE public.bonus_menu OWNER TO kim;

--
-- Name: bonus_menu_id_seq; Type: SEQUENCE; Schema: public; Owner: kim
--

CREATE SEQUENCE public.bonus_menu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.bonus_menu_id_seq OWNER TO kim;

--
-- Name: bonus_menu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kim
--

ALTER SEQUENCE public.bonus_menu_id_seq OWNED BY public.bonus_menu.id;


--
-- Name: bonus_restaurant; Type: TABLE; Schema: public; Owner: kim
--

CREATE TABLE public.bonus_restaurant (
    id bigint NOT NULL,
    restaurant_id bigint NOT NULL,
    bonus_id bigint NOT NULL
);


ALTER TABLE public.bonus_restaurant OWNER TO kim;

--
-- Name: bonus_restaurant_id_seq; Type: SEQUENCE; Schema: public; Owner: kim
--

CREATE SEQUENCE public.bonus_restaurant_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.bonus_restaurant_id_seq OWNER TO kim;

--
-- Name: bonus_restaurant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kim
--

ALTER SEQUENCE public.bonus_restaurant_id_seq OWNED BY public.bonus_restaurant.id;


--
-- Name: bonus_user_status; Type: TABLE; Schema: public; Owner: kim
--

CREATE TABLE public.bonus_user_status (
    id bigint NOT NULL,
    user_status_id bigint NOT NULL,
    bonus_id bigint NOT NULL
);


ALTER TABLE public.bonus_user_status OWNER TO kim;

--
-- Name: bonus_user_status_id_seq; Type: SEQUENCE; Schema: public; Owner: kim
--

CREATE SEQUENCE public.bonus_user_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.bonus_user_status_id_seq OWNER TO kim;

--
-- Name: bonus_user_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kim
--

ALTER SEQUENCE public.bonus_user_status_id_seq OWNED BY public.bonus_user_status.id;


--
-- Name: bonuses; Type: TABLE; Schema: public; Owner: kim
--

CREATE TABLE public.bonuses (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    is_percentage boolean DEFAULT false NOT NULL,
    value real NOT NULL,
    validity_day integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.bonuses OWNER TO kim;

--
-- Name: bonuses_id_seq; Type: SEQUENCE; Schema: public; Owner: kim
--

CREATE SEQUENCE public.bonuses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.bonuses_id_seq OWNER TO kim;

--
-- Name: bonuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kim
--

ALTER SEQUENCE public.bonuses_id_seq OWNED BY public.bonuses.id;


--
-- Name: cache; Type: TABLE; Schema: public; Owner: kim
--

CREATE TABLE public.cache (
    key character varying(255) NOT NULL,
    value text NOT NULL,
    expiration integer NOT NULL
);


ALTER TABLE public.cache OWNER TO kim;

--
-- Name: cache_locks; Type: TABLE; Schema: public; Owner: kim
--

CREATE TABLE public.cache_locks (
    key character varying(255) NOT NULL,
    owner character varying(255) NOT NULL,
    expiration integer NOT NULL
);


ALTER TABLE public.cache_locks OWNER TO kim;

--
-- Name: categories; Type: TABLE; Schema: public; Owner: kim
--

CREATE TABLE public.categories (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    "order" integer DEFAULT 1 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.categories OWNER TO kim;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: kim
--

CREATE SEQUENCE public.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categories_id_seq OWNER TO kim;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kim
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: category_additive; Type: TABLE; Schema: public; Owner: kim
--

CREATE TABLE public.category_additive (
    id bigint NOT NULL,
    additive_id bigint NOT NULL,
    category_id bigint NOT NULL
);


ALTER TABLE public.category_additive OWNER TO kim;

--
-- Name: category_additive_id_seq; Type: SEQUENCE; Schema: public; Owner: kim
--

CREATE SEQUENCE public.category_additive_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.category_additive_id_seq OWNER TO kim;

--
-- Name: category_additive_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kim
--

ALTER SEQUENCE public.category_additive_id_seq OWNED BY public.category_additive.id;


--
-- Name: category_device; Type: TABLE; Schema: public; Owner: kim
--

CREATE TABLE public.category_device (
    id bigint NOT NULL,
    category_id bigint NOT NULL,
    device_id bigint NOT NULL
);


ALTER TABLE public.category_device OWNER TO kim;

--
-- Name: category_device_id_seq; Type: SEQUENCE; Schema: public; Owner: kim
--

CREATE SEQUENCE public.category_device_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.category_device_id_seq OWNER TO kim;

--
-- Name: category_device_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kim
--

ALTER SEQUENCE public.category_device_id_seq OWNED BY public.category_device.id;


--
-- Name: devices; Type: TABLE; Schema: public; Owner: kim
--

CREATE TABLE public.devices (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    price real NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.devices OWNER TO kim;

--
-- Name: devices_id_seq; Type: SEQUENCE; Schema: public; Owner: kim
--

CREATE SEQUENCE public.devices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.devices_id_seq OWNER TO kim;

--
-- Name: devices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kim
--

ALTER SEQUENCE public.devices_id_seq OWNED BY public.devices.id;


--
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: kim
--

CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.failed_jobs OWNER TO kim;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: kim
--

CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.failed_jobs_id_seq OWNER TO kim;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kim
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- Name: ingredient_categories; Type: TABLE; Schema: public; Owner: kim
--

CREATE TABLE public.ingredient_categories (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.ingredient_categories OWNER TO kim;

--
-- Name: ingredient_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: kim
--

CREATE SEQUENCE public.ingredient_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ingredient_categories_id_seq OWNER TO kim;

--
-- Name: ingredient_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kim
--

ALTER SEQUENCE public.ingredient_categories_id_seq OWNED BY public.ingredient_categories.id;


--
-- Name: ingredients; Type: TABLE; Schema: public; Owner: kim
--

CREATE TABLE public.ingredients (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    category_id bigint,
    measurement_id bigint
);


ALTER TABLE public.ingredients OWNER TO kim;

--
-- Name: ingredients_id_seq; Type: SEQUENCE; Schema: public; Owner: kim
--

CREATE SEQUENCE public.ingredients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ingredients_id_seq OWNER TO kim;

--
-- Name: ingredients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kim
--

ALTER SEQUENCE public.ingredients_id_seq OWNED BY public.ingredients.id;


--
-- Name: job_batches; Type: TABLE; Schema: public; Owner: kim
--

CREATE TABLE public.job_batches (
    id character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    total_jobs integer NOT NULL,
    pending_jobs integer NOT NULL,
    failed_jobs integer NOT NULL,
    failed_job_ids text NOT NULL,
    options text,
    cancelled_at integer,
    created_at integer NOT NULL,
    finished_at integer
);


ALTER TABLE public.job_batches OWNER TO kim;

--
-- Name: jobs; Type: TABLE; Schema: public; Owner: kim
--

CREATE TABLE public.jobs (
    id bigint NOT NULL,
    queue character varying(255) NOT NULL,
    payload text NOT NULL,
    attempts smallint NOT NULL,
    reserved_at integer,
    available_at integer NOT NULL,
    created_at integer NOT NULL
);


ALTER TABLE public.jobs OWNER TO kim;

--
-- Name: jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: kim
--

CREATE SEQUENCE public.jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.jobs_id_seq OWNER TO kim;

--
-- Name: jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kim
--

ALTER SEQUENCE public.jobs_id_seq OWNED BY public.jobs.id;


--
-- Name: locations; Type: TABLE; Schema: public; Owner: kim
--

CREATE TABLE public.locations (
    id bigint NOT NULL,
    latitude numeric(13,10) NOT NULL,
    longitude numeric(13,10) NOT NULL,
    name text NOT NULL,
    country_name character varying(50),
    province_name character varying(50),
    area_name character varying(50),
    locality_name character varying(50),
    street_name character varying(60),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.locations OWNER TO kim;

--
-- Name: locations_id_seq; Type: SEQUENCE; Schema: public; Owner: kim
--

CREATE SEQUENCE public.locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.locations_id_seq OWNER TO kim;

--
-- Name: locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kim
--

ALTER SEQUENCE public.locations_id_seq OWNED BY public.locations.id;


--
-- Name: measurements; Type: TABLE; Schema: public; Owner: kim
--

CREATE TABLE public.measurements (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.measurements OWNER TO kim;

--
-- Name: measurements_id_seq; Type: SEQUENCE; Schema: public; Owner: kim
--

CREATE SEQUENCE public.measurements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.measurements_id_seq OWNER TO kim;

--
-- Name: measurements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kim
--

ALTER SEQUENCE public.measurements_id_seq OWNED BY public.measurements.id;


--
-- Name: media; Type: TABLE; Schema: public; Owner: kim
--

CREATE TABLE public.media (
    id bigint NOT NULL,
    model_type character varying(255) NOT NULL,
    model_id bigint NOT NULL,
    uuid uuid,
    collection_name character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    file_name character varying(255) NOT NULL,
    mime_type character varying(255),
    disk character varying(255) NOT NULL,
    conversions_disk character varying(255),
    size bigint NOT NULL,
    manipulations json NOT NULL,
    custom_properties json NOT NULL,
    generated_conversions json NOT NULL,
    responsive_images json NOT NULL,
    order_column integer,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.media OWNER TO kim;

--
-- Name: media_id_seq; Type: SEQUENCE; Schema: public; Owner: kim
--

CREATE SEQUENCE public.media_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.media_id_seq OWNER TO kim;

--
-- Name: media_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kim
--

ALTER SEQUENCE public.media_id_seq OWNED BY public.media.id;


--
-- Name: menu_additive; Type: TABLE; Schema: public; Owner: kim
--

CREATE TABLE public.menu_additive (
    id bigint NOT NULL,
    menu_id bigint NOT NULL,
    additive_id bigint NOT NULL
);


ALTER TABLE public.menu_additive OWNER TO kim;

--
-- Name: menu_additive_id_seq; Type: SEQUENCE; Schema: public; Owner: kim
--

CREATE SEQUENCE public.menu_additive_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.menu_additive_id_seq OWNER TO kim;

--
-- Name: menu_additive_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kim
--

ALTER SEQUENCE public.menu_additive_id_seq OWNED BY public.menu_additive.id;


--
-- Name: menu_category; Type: TABLE; Schema: public; Owner: kim
--

CREATE TABLE public.menu_category (
    id bigint NOT NULL,
    menu_id bigint NOT NULL,
    category_id bigint NOT NULL
);


ALTER TABLE public.menu_category OWNER TO kim;

--
-- Name: menu_category_id_seq; Type: SEQUENCE; Schema: public; Owner: kim
--

CREATE SEQUENCE public.menu_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.menu_category_id_seq OWNER TO kim;

--
-- Name: menu_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kim
--

ALTER SEQUENCE public.menu_category_id_seq OWNED BY public.menu_category.id;


--
-- Name: menu_device; Type: TABLE; Schema: public; Owner: kim
--

CREATE TABLE public.menu_device (
    id bigint NOT NULL,
    menu_id bigint NOT NULL,
    device_id bigint NOT NULL
);


ALTER TABLE public.menu_device OWNER TO kim;

--
-- Name: menu_device_id_seq; Type: SEQUENCE; Schema: public; Owner: kim
--

CREATE SEQUENCE public.menu_device_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.menu_device_id_seq OWNER TO kim;

--
-- Name: menu_device_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kim
--

ALTER SEQUENCE public.menu_device_id_seq OWNED BY public.menu_device.id;


--
-- Name: menu_ingredient; Type: TABLE; Schema: public; Owner: kim
--

CREATE TABLE public.menu_ingredient (
    id bigint NOT NULL,
    menu_id bigint NOT NULL,
    ingredient_id bigint NOT NULL,
    value real
);


ALTER TABLE public.menu_ingredient OWNER TO kim;

--
-- Name: menu_ingredient_id_seq; Type: SEQUENCE; Schema: public; Owner: kim
--

CREATE SEQUENCE public.menu_ingredient_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.menu_ingredient_id_seq OWNER TO kim;

--
-- Name: menu_ingredient_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kim
--

ALTER SEQUENCE public.menu_ingredient_id_seq OWNED BY public.menu_ingredient.id;


--
-- Name: menu_sizes; Type: TABLE; Schema: public; Owner: kim
--

CREATE TABLE public.menu_sizes (
    id bigint NOT NULL,
    price real NOT NULL,
    size real NOT NULL,
    weight real,
    count real,
    measurement_id bigint,
    menu_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.menu_sizes OWNER TO kim;

--
-- Name: menu_sizes_id_seq; Type: SEQUENCE; Schema: public; Owner: kim
--

CREATE SEQUENCE public.menu_sizes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.menu_sizes_id_seq OWNER TO kim;

--
-- Name: menu_sizes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kim
--

ALTER SEQUENCE public.menu_sizes_id_seq OWNED BY public.menu_sizes.id;


--
-- Name: menu_tags; Type: TABLE; Schema: public; Owner: kim
--

CREATE TABLE public.menu_tags (
    id bigint NOT NULL,
    menu_id bigint NOT NULL,
    tag_id bigint NOT NULL
);


ALTER TABLE public.menu_tags OWNER TO kim;

--
-- Name: menu_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: kim
--

CREATE SEQUENCE public.menu_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.menu_tags_id_seq OWNER TO kim;

--
-- Name: menu_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kim
--

ALTER SEQUENCE public.menu_tags_id_seq OWNED BY public.menu_tags.id;


--
-- Name: menus; Type: TABLE; Schema: public; Owner: kim
--

CREATE TABLE public.menus (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    price real NOT NULL,
    weight real,
    count real,
    measurement_id bigint,
    "order" integer DEFAULT 1 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    nutritional_value_per real,
    calorie_content real,
    proteins real,
    fat real,
    carbohydrate real,
    description text
);


ALTER TABLE public.menus OWNER TO kim;

--
-- Name: menus_id_seq; Type: SEQUENCE; Schema: public; Owner: kim
--

CREATE SEQUENCE public.menus_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.menus_id_seq OWNER TO kim;

--
-- Name: menus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kim
--

ALTER SEQUENCE public.menus_id_seq OWNED BY public.menus.id;


--
-- Name: migrations; Type: TABLE; Schema: public; Owner: kim
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO kim;

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: kim
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.migrations_id_seq OWNER TO kim;

--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kim
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- Name: model_has_permissions; Type: TABLE; Schema: public; Owner: kim
--

CREATE TABLE public.model_has_permissions (
    permission_id bigint NOT NULL,
    model_type character varying(255) NOT NULL,
    model_id bigint NOT NULL
);


ALTER TABLE public.model_has_permissions OWNER TO kim;

--
-- Name: model_has_roles; Type: TABLE; Schema: public; Owner: kim
--

CREATE TABLE public.model_has_roles (
    role_id bigint NOT NULL,
    model_type character varying(255) NOT NULL,
    model_id bigint NOT NULL
);


ALTER TABLE public.model_has_roles OWNER TO kim;

--
-- Name: notifications; Type: TABLE; Schema: public; Owner: kim
--

CREATE TABLE public.notifications (
    id uuid NOT NULL,
    type character varying(255) NOT NULL,
    notifiable_type character varying(255) NOT NULL,
    notifiable_id bigint NOT NULL,
    data text NOT NULL,
    read_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.notifications OWNER TO kim;

--
-- Name: onboardings; Type: TABLE; Schema: public; Owner: kim
--

CREATE TABLE public.onboardings (
    id bigint NOT NULL,
    title character varying(255) NOT NULL,
    text text,
    "order" integer DEFAULT 1 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.onboardings OWNER TO kim;

--
-- Name: onboardings_id_seq; Type: SEQUENCE; Schema: public; Owner: kim
--

CREATE SEQUENCE public.onboardings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.onboardings_id_seq OWNER TO kim;

--
-- Name: onboardings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kim
--

ALTER SEQUENCE public.onboardings_id_seq OWNED BY public.onboardings.id;


--
-- Name: password_reset_tokens; Type: TABLE; Schema: public; Owner: kim
--

CREATE TABLE public.password_reset_tokens (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.password_reset_tokens OWNER TO kim;

--
-- Name: permissions; Type: TABLE; Schema: public; Owner: kim
--

CREATE TABLE public.permissions (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    guard_name character varying(255) NOT NULL,
    display_name character varying(255) NOT NULL,
    parent_id integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.permissions OWNER TO kim;

--
-- Name: permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: kim
--

CREATE SEQUENCE public.permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.permissions_id_seq OWNER TO kim;

--
-- Name: permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kim
--

ALTER SEQUENCE public.permissions_id_seq OWNED BY public.permissions.id;


--
-- Name: present_restaurant; Type: TABLE; Schema: public; Owner: kim
--

CREATE TABLE public.present_restaurant (
    id bigint NOT NULL,
    restaurant_id bigint NOT NULL,
    present_id bigint NOT NULL
);


ALTER TABLE public.present_restaurant OWNER TO kim;

--
-- Name: present_restaurant_id_seq; Type: SEQUENCE; Schema: public; Owner: kim
--

CREATE SEQUENCE public.present_restaurant_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.present_restaurant_id_seq OWNER TO kim;

--
-- Name: present_restaurant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kim
--

ALTER SEQUENCE public.present_restaurant_id_seq OWNED BY public.present_restaurant.id;


--
-- Name: presents; Type: TABLE; Schema: public; Owner: kim
--

CREATE TABLE public.presents (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    is_birthday_present boolean DEFAULT false NOT NULL,
    menu_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.presents OWNER TO kim;

--
-- Name: presents_id_seq; Type: SEQUENCE; Schema: public; Owner: kim
--

CREATE SEQUENCE public.presents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.presents_id_seq OWNER TO kim;

--
-- Name: presents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kim
--

ALTER SEQUENCE public.presents_id_seq OWNED BY public.presents.id;


--
-- Name: promo_code_category; Type: TABLE; Schema: public; Owner: kim
--

CREATE TABLE public.promo_code_category (
    id bigint NOT NULL,
    category_id bigint NOT NULL,
    promo_code_id bigint NOT NULL
);


ALTER TABLE public.promo_code_category OWNER TO kim;

--
-- Name: promo_code_category_id_seq; Type: SEQUENCE; Schema: public; Owner: kim
--

CREATE SEQUENCE public.promo_code_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.promo_code_category_id_seq OWNER TO kim;

--
-- Name: promo_code_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kim
--

ALTER SEQUENCE public.promo_code_category_id_seq OWNED BY public.promo_code_category.id;


--
-- Name: promo_code_menu; Type: TABLE; Schema: public; Owner: kim
--

CREATE TABLE public.promo_code_menu (
    id bigint NOT NULL,
    menu_id bigint NOT NULL,
    promo_code_id bigint NOT NULL
);


ALTER TABLE public.promo_code_menu OWNER TO kim;

--
-- Name: promo_code_menu_id_seq; Type: SEQUENCE; Schema: public; Owner: kim
--

CREATE SEQUENCE public.promo_code_menu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.promo_code_menu_id_seq OWNER TO kim;

--
-- Name: promo_code_menu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kim
--

ALTER SEQUENCE public.promo_code_menu_id_seq OWNED BY public.promo_code_menu.id;


--
-- Name: promo_code_restaurant; Type: TABLE; Schema: public; Owner: kim
--

CREATE TABLE public.promo_code_restaurant (
    id bigint NOT NULL,
    restaurant_id bigint NOT NULL,
    promo_code_id bigint NOT NULL
);


ALTER TABLE public.promo_code_restaurant OWNER TO kim;

--
-- Name: promo_code_restaurant_id_seq; Type: SEQUENCE; Schema: public; Owner: kim
--

CREATE SEQUENCE public.promo_code_restaurant_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.promo_code_restaurant_id_seq OWNER TO kim;

--
-- Name: promo_code_restaurant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kim
--

ALTER SEQUENCE public.promo_code_restaurant_id_seq OWNED BY public.promo_code_restaurant.id;


--
-- Name: promo_code_user; Type: TABLE; Schema: public; Owner: kim
--

CREATE TABLE public.promo_code_user (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    promo_code_id bigint NOT NULL
);


ALTER TABLE public.promo_code_user OWNER TO kim;

--
-- Name: promo_code_user_id_seq; Type: SEQUENCE; Schema: public; Owner: kim
--

CREATE SEQUENCE public.promo_code_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.promo_code_user_id_seq OWNER TO kim;

--
-- Name: promo_code_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kim
--

ALTER SEQUENCE public.promo_code_user_id_seq OWNED BY public.promo_code_user.id;


--
-- Name: promo_code_user_status; Type: TABLE; Schema: public; Owner: kim
--

CREATE TABLE public.promo_code_user_status (
    id bigint NOT NULL,
    user_status_id bigint NOT NULL,
    promo_code_id bigint NOT NULL
);


ALTER TABLE public.promo_code_user_status OWNER TO kim;

--
-- Name: promo_code_user_status_id_seq; Type: SEQUENCE; Schema: public; Owner: kim
--

CREATE SEQUENCE public.promo_code_user_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.promo_code_user_status_id_seq OWNER TO kim;

--
-- Name: promo_code_user_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kim
--

ALTER SEQUENCE public.promo_code_user_status_id_seq OWNED BY public.promo_code_user_status.id;


--
-- Name: promo_codes; Type: TABLE; Schema: public; Owner: kim
--

CREATE TABLE public.promo_codes (
    id bigint NOT NULL,
    code character varying(50) NOT NULL,
    name character varying(50) NOT NULL,
    value real NOT NULL,
    is_percentage boolean DEFAULT false NOT NULL,
    start_date timestamp(0) without time zone,
    end_date timestamp(0) without time zone,
    starting_amount_activated real,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.promo_codes OWNER TO kim;

--
-- Name: promo_codes_id_seq; Type: SEQUENCE; Schema: public; Owner: kim
--

CREATE SEQUENCE public.promo_codes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.promo_codes_id_seq OWNER TO kim;

--
-- Name: promo_codes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kim
--

ALTER SEQUENCE public.promo_codes_id_seq OWNED BY public.promo_codes.id;


--
-- Name: promotion_category; Type: TABLE; Schema: public; Owner: kim
--

CREATE TABLE public.promotion_category (
    id bigint NOT NULL,
    category_id bigint NOT NULL,
    promotion_id bigint NOT NULL
);


ALTER TABLE public.promotion_category OWNER TO kim;

--
-- Name: promotion_category_id_seq; Type: SEQUENCE; Schema: public; Owner: kim
--

CREATE SEQUENCE public.promotion_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.promotion_category_id_seq OWNER TO kim;

--
-- Name: promotion_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kim
--

ALTER SEQUENCE public.promotion_category_id_seq OWNED BY public.promotion_category.id;


--
-- Name: promotion_menu; Type: TABLE; Schema: public; Owner: kim
--

CREATE TABLE public.promotion_menu (
    id bigint NOT NULL,
    menu_id bigint NOT NULL,
    promotion_id bigint NOT NULL
);


ALTER TABLE public.promotion_menu OWNER TO kim;

--
-- Name: promotion_menu_id_seq; Type: SEQUENCE; Schema: public; Owner: kim
--

CREATE SEQUENCE public.promotion_menu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.promotion_menu_id_seq OWNER TO kim;

--
-- Name: promotion_menu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kim
--

ALTER SEQUENCE public.promotion_menu_id_seq OWNED BY public.promotion_menu.id;


--
-- Name: promotion_restaurant; Type: TABLE; Schema: public; Owner: kim
--

CREATE TABLE public.promotion_restaurant (
    id bigint NOT NULL,
    restaurant_id bigint NOT NULL,
    promotion_id bigint NOT NULL,
    is_percentage boolean DEFAULT false NOT NULL,
    value real NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.promotion_restaurant OWNER TO kim;

--
-- Name: promotion_restaurant_id_seq; Type: SEQUENCE; Schema: public; Owner: kim
--

CREATE SEQUENCE public.promotion_restaurant_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.promotion_restaurant_id_seq OWNER TO kim;

--
-- Name: promotion_restaurant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kim
--

ALTER SEQUENCE public.promotion_restaurant_id_seq OWNED BY public.promotion_restaurant.id;


--
-- Name: promotions; Type: TABLE; Schema: public; Owner: kim
--

CREATE TABLE public.promotions (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.promotions OWNER TO kim;

--
-- Name: promotions_id_seq; Type: SEQUENCE; Schema: public; Owner: kim
--

CREATE SEQUENCE public.promotions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.promotions_id_seq OWNER TO kim;

--
-- Name: promotions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kim
--

ALTER SEQUENCE public.promotions_id_seq OWNED BY public.promotions.id;


--
-- Name: recommendation_by_category; Type: TABLE; Schema: public; Owner: kim
--

CREATE TABLE public.recommendation_by_category (
    id bigint NOT NULL,
    menu_id bigint NOT NULL,
    category_id bigint NOT NULL
);


ALTER TABLE public.recommendation_by_category OWNER TO kim;

--
-- Name: recommendation_by_category_id_seq; Type: SEQUENCE; Schema: public; Owner: kim
--

CREATE SEQUENCE public.recommendation_by_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.recommendation_by_category_id_seq OWNER TO kim;

--
-- Name: recommendation_by_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kim
--

ALTER SEQUENCE public.recommendation_by_category_id_seq OWNED BY public.recommendation_by_category.id;


--
-- Name: regions; Type: TABLE; Schema: public; Owner: kim
--

CREATE TABLE public.regions (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    map_keys text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    kladr_id character varying(255)
);


ALTER TABLE public.regions OWNER TO kim;

--
-- Name: regions_id_seq; Type: SEQUENCE; Schema: public; Owner: kim
--

CREATE SEQUENCE public.regions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.regions_id_seq OWNER TO kim;

--
-- Name: regions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kim
--

ALTER SEQUENCE public.regions_id_seq OWNED BY public.regions.id;


--
-- Name: restaurant_menu_prices; Type: TABLE; Schema: public; Owner: kim
--

CREATE TABLE public.restaurant_menu_prices (
    id bigint NOT NULL,
    restaurant_id bigint NOT NULL,
    menu_id bigint NOT NULL,
    menu_size_id bigint,
    price real NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.restaurant_menu_prices OWNER TO kim;

--
-- Name: restaurant_menu_prices_id_seq; Type: SEQUENCE; Schema: public; Owner: kim
--

CREATE SEQUENCE public.restaurant_menu_prices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.restaurant_menu_prices_id_seq OWNER TO kim;

--
-- Name: restaurant_menu_prices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kim
--

ALTER SEQUENCE public.restaurant_menu_prices_id_seq OWNED BY public.restaurant_menu_prices.id;


--
-- Name: restaurant_user; Type: TABLE; Schema: public; Owner: kim
--

CREATE TABLE public.restaurant_user (
    id bigint NOT NULL,
    restaurant_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.restaurant_user OWNER TO kim;

--
-- Name: restaurant_user_id_seq; Type: SEQUENCE; Schema: public; Owner: kim
--

CREATE SEQUENCE public.restaurant_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.restaurant_user_id_seq OWNER TO kim;

--
-- Name: restaurant_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kim
--

ALTER SEQUENCE public.restaurant_user_id_seq OWNED BY public.restaurant_user.id;


--
-- Name: restaurants; Type: TABLE; Schema: public; Owner: kim
--

CREATE TABLE public.restaurants (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    address text,
    latitude numeric(15,12) NOT NULL,
    longitude numeric(15,12) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    region_id bigint,
    phone character varying(50),
    work_hours json
);


ALTER TABLE public.restaurants OWNER TO kim;

--
-- Name: restaurants_id_seq; Type: SEQUENCE; Schema: public; Owner: kim
--

CREATE SEQUENCE public.restaurants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.restaurants_id_seq OWNER TO kim;

--
-- Name: restaurants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kim
--

ALTER SEQUENCE public.restaurants_id_seq OWNED BY public.restaurants.id;


--
-- Name: role_has_permissions; Type: TABLE; Schema: public; Owner: kim
--

CREATE TABLE public.role_has_permissions (
    permission_id bigint NOT NULL,
    role_id bigint NOT NULL
);


ALTER TABLE public.role_has_permissions OWNER TO kim;

--
-- Name: roles; Type: TABLE; Schema: public; Owner: kim
--

CREATE TABLE public.roles (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    guard_name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.roles OWNER TO kim;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: kim
--

CREATE SEQUENCE public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.roles_id_seq OWNER TO kim;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kim
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: kim
--

CREATE TABLE public.sessions (
    id character varying(255) NOT NULL,
    user_id bigint,
    ip_address character varying(45),
    user_agent text,
    payload text NOT NULL,
    last_activity integer NOT NULL
);


ALTER TABLE public.sessions OWNER TO kim;

--
-- Name: stories; Type: TABLE; Schema: public; Owner: kim
--

CREATE TABLE public.stories (
    id bigint NOT NULL,
    button_text character varying(255),
    storyable_type character varying(20),
    storyable_type_id integer,
    story_category_id bigint NOT NULL,
    tag character varying(50),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.stories OWNER TO kim;

--
-- Name: stories_id_seq; Type: SEQUENCE; Schema: public; Owner: kim
--

CREATE SEQUENCE public.stories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.stories_id_seq OWNER TO kim;

--
-- Name: stories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kim
--

ALTER SEQUENCE public.stories_id_seq OWNED BY public.stories.id;


--
-- Name: story_categories; Type: TABLE; Schema: public; Owner: kim
--

CREATE TABLE public.story_categories (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    tag character varying(50),
    "order" integer DEFAULT 1 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.story_categories OWNER TO kim;

--
-- Name: story_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: kim
--

CREATE SEQUENCE public.story_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.story_categories_id_seq OWNER TO kim;

--
-- Name: story_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kim
--

ALTER SEQUENCE public.story_categories_id_seq OWNED BY public.story_categories.id;


--
-- Name: tags; Type: TABLE; Schema: public; Owner: kim
--

CREATE TABLE public.tags (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    color character varying(20),
    "position" character varying(50) DEFAULT 'top_start'::character varying,
    icon character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.tags OWNER TO kim;

--
-- Name: tags_id_seq; Type: SEQUENCE; Schema: public; Owner: kim
--

CREATE SEQUENCE public.tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tags_id_seq OWNER TO kim;

--
-- Name: tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kim
--

ALTER SEQUENCE public.tags_id_seq OWNED BY public.tags.id;


--
-- Name: two_factor_auth_telegrams; Type: TABLE; Schema: public; Owner: kim
--

CREATE TABLE public.two_factor_auth_telegrams (
    id uuid NOT NULL,
    username character varying(255) NOT NULL,
    first_name character varying(255) NOT NULL,
    code character varying(255) NOT NULL,
    chat_id character varying(255) NOT NULL,
    update_id character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    uuid character varying(255) NOT NULL
);


ALTER TABLE public.two_factor_auth_telegrams OWNER TO kim;

--
-- Name: two_factor_auths; Type: TABLE; Schema: public; Owner: kim
--

CREATE TABLE public.two_factor_auths (
    id uuid NOT NULL,
    phone_number character varying(25) NOT NULL,
    code character varying(10) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.two_factor_auths OWNER TO kim;

--
-- Name: user_points; Type: TABLE; Schema: public; Owner: kim
--

CREATE TABLE public.user_points (
    id bigint NOT NULL,
    user_id bigint,
    latitude numeric(13,10) NOT NULL,
    longitude numeric(13,10) NOT NULL,
    name character varying(255) NOT NULL,
    entrance character varying(50),
    floor integer,
    apartment integer,
    door_code character varying(10),
    comment text,
    type character varying(255) DEFAULT 'main'::character varying NOT NULL,
    area_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT user_points_type_check CHECK (((type)::text = ANY ((ARRAY['main'::character varying, 'home'::character varying, 'work'::character varying, 'other'::character varying])::text[])))
);


ALTER TABLE public.user_points OWNER TO kim;

--
-- Name: user_points_id_seq; Type: SEQUENCE; Schema: public; Owner: kim
--

CREATE SEQUENCE public.user_points_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_points_id_seq OWNER TO kim;

--
-- Name: user_points_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kim
--

ALTER SEQUENCE public.user_points_id_seq OWNED BY public.user_points.id;


--
-- Name: user_statuses; Type: TABLE; Schema: public; Owner: kim
--

CREATE TABLE public.user_statuses (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    "order" integer DEFAULT 1 NOT NULL,
    cashback_percentage integer DEFAULT 0 NOT NULL,
    validity_day integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.user_statuses OWNER TO kim;

--
-- Name: user_statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: kim
--

CREATE SEQUENCE public.user_statuses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_statuses_id_seq OWNER TO kim;

--
-- Name: user_statuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kim
--

ALTER SEQUENCE public.user_statuses_id_seq OWNED BY public.user_statuses.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: kim
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(255),
    phone_number character varying(255),
    email character varying(255),
    email_verified_at timestamp(0) without time zone,
    password character varying(255) NOT NULL,
    birth_day timestamp(0) without time zone,
    telegram_user_name character varying(255),
    chat_id character varying(255),
    push_notification boolean DEFAULT true NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.users OWNER TO kim;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: kim
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO kim;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kim
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: additives id; Type: DEFAULT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.additives ALTER COLUMN id SET DEFAULT nextval('public.additives_id_seq'::regclass);


--
-- Name: areas id; Type: DEFAULT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.areas ALTER COLUMN id SET DEFAULT nextval('public.areas_id_seq'::regclass);


--
-- Name: audits id; Type: DEFAULT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.audits ALTER COLUMN id SET DEFAULT nextval('public.audits_id_seq'::regclass);


--
-- Name: bonus_category id; Type: DEFAULT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.bonus_category ALTER COLUMN id SET DEFAULT nextval('public.bonus_category_id_seq'::regclass);


--
-- Name: bonus_menu id; Type: DEFAULT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.bonus_menu ALTER COLUMN id SET DEFAULT nextval('public.bonus_menu_id_seq'::regclass);


--
-- Name: bonus_restaurant id; Type: DEFAULT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.bonus_restaurant ALTER COLUMN id SET DEFAULT nextval('public.bonus_restaurant_id_seq'::regclass);


--
-- Name: bonus_user_status id; Type: DEFAULT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.bonus_user_status ALTER COLUMN id SET DEFAULT nextval('public.bonus_user_status_id_seq'::regclass);


--
-- Name: bonuses id; Type: DEFAULT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.bonuses ALTER COLUMN id SET DEFAULT nextval('public.bonuses_id_seq'::regclass);


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: category_additive id; Type: DEFAULT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.category_additive ALTER COLUMN id SET DEFAULT nextval('public.category_additive_id_seq'::regclass);


--
-- Name: category_device id; Type: DEFAULT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.category_device ALTER COLUMN id SET DEFAULT nextval('public.category_device_id_seq'::regclass);


--
-- Name: devices id; Type: DEFAULT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.devices ALTER COLUMN id SET DEFAULT nextval('public.devices_id_seq'::regclass);


--
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- Name: ingredient_categories id; Type: DEFAULT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.ingredient_categories ALTER COLUMN id SET DEFAULT nextval('public.ingredient_categories_id_seq'::regclass);


--
-- Name: ingredients id; Type: DEFAULT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.ingredients ALTER COLUMN id SET DEFAULT nextval('public.ingredients_id_seq'::regclass);


--
-- Name: jobs id; Type: DEFAULT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);


--
-- Name: locations id; Type: DEFAULT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.locations ALTER COLUMN id SET DEFAULT nextval('public.locations_id_seq'::regclass);


--
-- Name: measurements id; Type: DEFAULT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.measurements ALTER COLUMN id SET DEFAULT nextval('public.measurements_id_seq'::regclass);


--
-- Name: media id; Type: DEFAULT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.media ALTER COLUMN id SET DEFAULT nextval('public.media_id_seq'::regclass);


--
-- Name: menu_additive id; Type: DEFAULT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.menu_additive ALTER COLUMN id SET DEFAULT nextval('public.menu_additive_id_seq'::regclass);


--
-- Name: menu_category id; Type: DEFAULT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.menu_category ALTER COLUMN id SET DEFAULT nextval('public.menu_category_id_seq'::regclass);


--
-- Name: menu_device id; Type: DEFAULT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.menu_device ALTER COLUMN id SET DEFAULT nextval('public.menu_device_id_seq'::regclass);


--
-- Name: menu_ingredient id; Type: DEFAULT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.menu_ingredient ALTER COLUMN id SET DEFAULT nextval('public.menu_ingredient_id_seq'::regclass);


--
-- Name: menu_sizes id; Type: DEFAULT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.menu_sizes ALTER COLUMN id SET DEFAULT nextval('public.menu_sizes_id_seq'::regclass);


--
-- Name: menu_tags id; Type: DEFAULT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.menu_tags ALTER COLUMN id SET DEFAULT nextval('public.menu_tags_id_seq'::regclass);


--
-- Name: menus id; Type: DEFAULT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.menus ALTER COLUMN id SET DEFAULT nextval('public.menus_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: onboardings id; Type: DEFAULT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.onboardings ALTER COLUMN id SET DEFAULT nextval('public.onboardings_id_seq'::regclass);


--
-- Name: permissions id; Type: DEFAULT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.permissions ALTER COLUMN id SET DEFAULT nextval('public.permissions_id_seq'::regclass);


--
-- Name: present_restaurant id; Type: DEFAULT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.present_restaurant ALTER COLUMN id SET DEFAULT nextval('public.present_restaurant_id_seq'::regclass);


--
-- Name: presents id; Type: DEFAULT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.presents ALTER COLUMN id SET DEFAULT nextval('public.presents_id_seq'::regclass);


--
-- Name: promo_code_category id; Type: DEFAULT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.promo_code_category ALTER COLUMN id SET DEFAULT nextval('public.promo_code_category_id_seq'::regclass);


--
-- Name: promo_code_menu id; Type: DEFAULT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.promo_code_menu ALTER COLUMN id SET DEFAULT nextval('public.promo_code_menu_id_seq'::regclass);


--
-- Name: promo_code_restaurant id; Type: DEFAULT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.promo_code_restaurant ALTER COLUMN id SET DEFAULT nextval('public.promo_code_restaurant_id_seq'::regclass);


--
-- Name: promo_code_user id; Type: DEFAULT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.promo_code_user ALTER COLUMN id SET DEFAULT nextval('public.promo_code_user_id_seq'::regclass);


--
-- Name: promo_code_user_status id; Type: DEFAULT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.promo_code_user_status ALTER COLUMN id SET DEFAULT nextval('public.promo_code_user_status_id_seq'::regclass);


--
-- Name: promo_codes id; Type: DEFAULT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.promo_codes ALTER COLUMN id SET DEFAULT nextval('public.promo_codes_id_seq'::regclass);


--
-- Name: promotion_category id; Type: DEFAULT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.promotion_category ALTER COLUMN id SET DEFAULT nextval('public.promotion_category_id_seq'::regclass);


--
-- Name: promotion_menu id; Type: DEFAULT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.promotion_menu ALTER COLUMN id SET DEFAULT nextval('public.promotion_menu_id_seq'::regclass);


--
-- Name: promotion_restaurant id; Type: DEFAULT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.promotion_restaurant ALTER COLUMN id SET DEFAULT nextval('public.promotion_restaurant_id_seq'::regclass);


--
-- Name: promotions id; Type: DEFAULT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.promotions ALTER COLUMN id SET DEFAULT nextval('public.promotions_id_seq'::regclass);


--
-- Name: recommendation_by_category id; Type: DEFAULT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.recommendation_by_category ALTER COLUMN id SET DEFAULT nextval('public.recommendation_by_category_id_seq'::regclass);


--
-- Name: regions id; Type: DEFAULT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.regions ALTER COLUMN id SET DEFAULT nextval('public.regions_id_seq'::regclass);


--
-- Name: restaurant_menu_prices id; Type: DEFAULT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.restaurant_menu_prices ALTER COLUMN id SET DEFAULT nextval('public.restaurant_menu_prices_id_seq'::regclass);


--
-- Name: restaurant_user id; Type: DEFAULT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.restaurant_user ALTER COLUMN id SET DEFAULT nextval('public.restaurant_user_id_seq'::regclass);


--
-- Name: restaurants id; Type: DEFAULT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.restaurants ALTER COLUMN id SET DEFAULT nextval('public.restaurants_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: stories id; Type: DEFAULT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.stories ALTER COLUMN id SET DEFAULT nextval('public.stories_id_seq'::regclass);


--
-- Name: story_categories id; Type: DEFAULT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.story_categories ALTER COLUMN id SET DEFAULT nextval('public.story_categories_id_seq'::regclass);


--
-- Name: tags id; Type: DEFAULT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.tags ALTER COLUMN id SET DEFAULT nextval('public.tags_id_seq'::regclass);


--
-- Name: user_points id; Type: DEFAULT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.user_points ALTER COLUMN id SET DEFAULT nextval('public.user_points_id_seq'::regclass);


--
-- Name: user_statuses id; Type: DEFAULT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.user_statuses ALTER COLUMN id SET DEFAULT nextval('public.user_statuses_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: additives; Type: TABLE DATA; Schema: public; Owner: kim
--

COPY public.additives (id, name, price, weight, measurement_id, created_at, updated_at) FROM stdin;
2	Моцарелла	59	47	2	2024-09-27 13:07:43	2024-09-27 13:07:43
1	Васаби	59	42	2	2024-07-11 14:42:11	2024-09-27 13:20:07
3	Чеддер	56	49	2	2024-09-27 13:22:52	2024-09-27 13:22:52
4	Сливочный Дуэт	42	38	2	2024-09-27 13:27:50	2024-09-27 13:27:50
\.


--
-- Data for Name: areas; Type: TABLE DATA; Schema: public; Owner: kim
--

COPY public.areas (id, name, coordinates, restaurant_id, cost_of_delivery, delivery_time, created_at, updated_at) FROM stdin;
1	Суши Ким/Павловская	"[[{\\"lat\\":45.03030908921764,\\"lng\\":39.063949584960945},{\\"lat\\":45.01957137757963,\\"lng\\":39.06832695007324},{\\"lat\\":45.02375750470578,\\"lng\\":39.07176017761231},{\\"lat\\":45.02545613565628,\\"lng\\":39.074935913085945},{\\"lat\\":45.03134028884368,\\"lng\\":39.07433509826661}]]"	6	200	60	2024-07-24 11:51:20	2024-07-24 11:51:20
2	Суши Ким/Краснодар	"[[{\\"lat\\":45.02078477926243,\\"lng\\":39.01142120361329},{\\"lat\\":45.019328694157245,\\"lng\\":39.02790069580079},{\\"lat\\":45.00337000193703,\\"lng\\":39.02137756347657},{\\"lat\\":45.0109554861868,\\"lng\\":39.01288032531739}]]"	6	150	60	2024-10-03 13:46:50	2024-10-03 13:46:50
\.


--
-- Data for Name: audits; Type: TABLE DATA; Schema: public; Owner: kim
--

COPY public.audits (id, user_type, user_id, event, auditable_type, auditable_id, old_values, new_values, url, ip_address, user_agent, tags, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: bonus_category; Type: TABLE DATA; Schema: public; Owner: kim
--

COPY public.bonus_category (id, category_id, bonus_id) FROM stdin;
1	12	1
2	5	1
3	4	1
5	3	3
\.


--
-- Data for Name: bonus_menu; Type: TABLE DATA; Schema: public; Owner: kim
--

COPY public.bonus_menu (id, menu_id, bonus_id) FROM stdin;
1	15	1
2	12	1
4	18	3
\.


--
-- Data for Name: bonus_restaurant; Type: TABLE DATA; Schema: public; Owner: kim
--

COPY public.bonus_restaurant (id, restaurant_id, bonus_id) FROM stdin;
1	5	1
5	8	3
6	7	3
7	6	3
8	5	3
9	4	3
10	3	3
11	2	3
12	1	3
\.


--
-- Data for Name: bonus_user_status; Type: TABLE DATA; Schema: public; Owner: kim
--

COPY public.bonus_user_status (id, user_status_id, bonus_id) FROM stdin;
1	1	1
2	1	3
3	2	3
4	3	3
\.


--
-- Data for Name: bonuses; Type: TABLE DATA; Schema: public; Owner: kim
--

COPY public.bonuses (id, name, is_percentage, value, validity_day, created_at, updated_at) FROM stdin;
1	Бонус за регистрацию	t	10	30	2024-08-29 16:45:29	2024-08-29 16:45:29
3	test	f	45	30	2024-09-30 13:21:46	2024-09-30 13:29:11
\.


--
-- Data for Name: cache; Type: TABLE DATA; Schema: public; Owner: kim
--

COPY public.cache (key, value, expiration) FROM stdin;
jjons8622@gmail.com|217.174.230.203:timer	i:1720535254;	1720535254
jjons8622@gmail.com|217.174.230.203	i:1;	1720535254
829f52f1657005a54c05f983195d0a47fdaa8f41:timer	i:1720637965;	1720637965
spatie.permission.cache	a:3:{s:5:"alias";a:6:{s:1:"a";s:2:"id";s:1:"b";s:4:"name";s:1:"c";s:10:"guard_name";s:1:"d";s:12:"display_name";s:1:"e";s:9:"parent_id";s:1:"r";s:5:"roles";}s:11:"permissions";a:81:{i:0;a:6:{s:1:"a";i:1;s:1:"b";s:15:"user_management";s:1:"c";s:3:"web";s:1:"d";s:49:"Управление пользователями";s:1:"e";i:0;s:1:"r";a:1:{i:0;i:1;}}i:1;a:6:{s:1:"a";i:2;s:1:"b";s:9:"show_user";s:1:"c";s:3:"web";s:1:"d";s:16:"Просмотр";s:1:"e";i:1;s:1:"r";a:1:{i:0;i:1;}}i:2;a:6:{s:1:"a";i:3;s:1:"b";s:11:"create_user";s:1:"c";s:3:"web";s:1:"d";s:18:"Добавлять";s:1:"e";i:1;s:1:"r";a:1:{i:0;i:1;}}i:3;a:6:{s:1:"a";i:4;s:1:"b";s:9:"edit_user";s:1:"c";s:3:"web";s:1:"d";s:26:"Редактировать";s:1:"e";i:1;s:1:"r";a:1:{i:0;i:1;}}i:4;a:6:{s:1:"a";i:5;s:1:"b";s:11:"delete_user";s:1:"c";s:3:"web";s:1:"d";s:14:"Удалить";s:1:"e";i:1;s:1:"r";a:1:{i:0;i:1;}}i:5;a:6:{s:1:"a";i:6;s:1:"b";s:15:"role_management";s:1:"c";s:3:"web";s:1:"d";s:33:"Управление ролями";s:1:"e";i:0;s:1:"r";a:1:{i:0;i:1;}}i:6;a:6:{s:1:"a";i:7;s:1:"b";s:9:"show_role";s:1:"c";s:3:"web";s:1:"d";s:16:"Просмотр";s:1:"e";i:6;s:1:"r";a:1:{i:0;i:1;}}i:7;a:6:{s:1:"a";i:8;s:1:"b";s:11:"create_role";s:1:"c";s:3:"web";s:1:"d";s:18:"Добавлять";s:1:"e";i:6;s:1:"r";a:1:{i:0;i:1;}}i:8;a:6:{s:1:"a";i:9;s:1:"b";s:9:"edit_role";s:1:"c";s:3:"web";s:1:"d";s:26:"Редактировать";s:1:"e";i:6;s:1:"r";a:1:{i:0;i:1;}}i:9;a:6:{s:1:"a";i:10;s:1:"b";s:11:"delete_role";s:1:"c";s:3:"web";s:1:"d";s:14:"Удалить";s:1:"e";i:6;s:1:"r";a:1:{i:0;i:1;}}i:10;a:6:{s:1:"a";i:11;s:1:"b";s:21:"restaurant_management";s:1:"c";s:3:"web";s:1:"d";s:41:"Управление рестораном";s:1:"e";i:0;s:1:"r";a:1:{i:0;i:1;}}i:11;a:6:{s:1:"a";i:12;s:1:"b";s:15:"show_restaurant";s:1:"c";s:3:"web";s:1:"d";s:16:"Просмотр";s:1:"e";i:11;s:1:"r";a:1:{i:0;i:1;}}i:12;a:6:{s:1:"a";i:13;s:1:"b";s:17:"create_restaurant";s:1:"c";s:3:"web";s:1:"d";s:18:"Добавлять";s:1:"e";i:11;s:1:"r";a:1:{i:0;i:1;}}i:13;a:6:{s:1:"a";i:14;s:1:"b";s:15:"edit_restaurant";s:1:"c";s:3:"web";s:1:"d";s:26:"Редактировать";s:1:"e";i:11;s:1:"r";a:1:{i:0;i:1;}}i:14;a:6:{s:1:"a";i:15;s:1:"b";s:17:"delete_restaurant";s:1:"c";s:3:"web";s:1:"d";s:14:"Удалить";s:1:"e";i:11;s:1:"r";a:1:{i:0;i:1;}}i:15;a:6:{s:1:"a";i:16;s:1:"b";s:23:"notification_management";s:1:"c";s:3:"web";s:1:"d";s:47:"Управление уведомлениями";s:1:"e";i:0;s:1:"r";a:1:{i:0;i:1;}}i:16;a:6:{s:1:"a";i:17;s:1:"b";s:17:"show_notification";s:1:"c";s:3:"web";s:1:"d";s:16:"Просмотр";s:1:"e";i:16;s:1:"r";a:1:{i:0;i:1;}}i:17;a:6:{s:1:"a";i:18;s:1:"b";s:19:"create_notification";s:1:"c";s:3:"web";s:1:"d";s:18:"Добавлять";s:1:"e";i:16;s:1:"r";a:1:{i:0;i:1;}}i:18;a:6:{s:1:"a";i:19;s:1:"b";s:17:"edit_notification";s:1:"c";s:3:"web";s:1:"d";s:26:"Редактировать";s:1:"e";i:16;s:1:"r";a:1:{i:0;i:1;}}i:19;a:6:{s:1:"a";i:20;s:1:"b";s:19:"delete_notification";s:1:"c";s:3:"web";s:1:"d";s:14:"Удалить";s:1:"e";i:16;s:1:"r";a:1:{i:0;i:1;}}i:20;a:6:{s:1:"a";i:21;s:1:"b";s:16:"order_management";s:1:"c";s:3:"web";s:1:"d";s:37:"Управление заказами";s:1:"e";i:0;s:1:"r";a:1:{i:0;i:1;}}i:21;a:6:{s:1:"a";i:22;s:1:"b";s:10:"show_order";s:1:"c";s:3:"web";s:1:"d";s:16:"Просмотр";s:1:"e";i:21;s:1:"r";a:1:{i:0;i:1;}}i:22;a:6:{s:1:"a";i:23;s:1:"b";s:10:"edit_order";s:1:"c";s:3:"web";s:1:"d";s:26:"Редактировать";s:1:"e";i:21;s:1:"r";a:1:{i:0;i:1;}}i:23;a:6:{s:1:"a";i:24;s:1:"b";s:12:"delete_order";s:1:"c";s:3:"web";s:1:"d";s:14:"Удалить";s:1:"e";i:21;s:1:"r";a:1:{i:0;i:1;}}i:24;a:6:{s:1:"a";i:25;s:1:"b";s:19:"discount_management";s:1:"c";s:3:"web";s:1:"d";s:37:"Управление скидками";s:1:"e";i:0;s:1:"r";a:1:{i:0;i:1;}}i:25;a:6:{s:1:"a";i:26;s:1:"b";s:13:"show_discount";s:1:"c";s:3:"web";s:1:"d";s:16:"Просмотр";s:1:"e";i:25;s:1:"r";a:1:{i:0;i:1;}}i:26;a:6:{s:1:"a";i:27;s:1:"b";s:15:"create_discount";s:1:"c";s:3:"web";s:1:"d";s:18:"Добавлять";s:1:"e";i:25;s:1:"r";a:1:{i:0;i:1;}}i:27;a:6:{s:1:"a";i:28;s:1:"b";s:13:"edit_discount";s:1:"c";s:3:"web";s:1:"d";s:26:"Редактировать";s:1:"e";i:25;s:1:"r";a:1:{i:0;i:1;}}i:28;a:6:{s:1:"a";i:29;s:1:"b";s:15:"delete_discount";s:1:"c";s:3:"web";s:1:"d";s:14:"Удалить";s:1:"e";i:25;s:1:"r";a:1:{i:0;i:1;}}i:29;a:6:{s:1:"a";i:30;s:1:"b";s:21:"onboarding_management";s:1:"c";s:3:"web";s:1:"d";s:39:"Управление онбординг";s:1:"e";i:0;s:1:"r";a:1:{i:0;i:1;}}i:30;a:6:{s:1:"a";i:31;s:1:"b";s:15:"show_onboarding";s:1:"c";s:3:"web";s:1:"d";s:16:"Просмотр";s:1:"e";i:30;s:1:"r";a:1:{i:0;i:1;}}i:31;a:6:{s:1:"a";i:32;s:1:"b";s:17:"create_onboarding";s:1:"c";s:3:"web";s:1:"d";s:18:"Добавлять";s:1:"e";i:30;s:1:"r";a:1:{i:0;i:1;}}i:32;a:6:{s:1:"a";i:33;s:1:"b";s:15:"edit_onboarding";s:1:"c";s:3:"web";s:1:"d";s:26:"Редактировать";s:1:"e";i:30;s:1:"r";a:1:{i:0;i:1;}}i:33;a:6:{s:1:"a";i:34;s:1:"b";s:17:"delete_onboarding";s:1:"c";s:3:"web";s:1:"d";s:14:"Удалить";s:1:"e";i:30;s:1:"r";a:1:{i:0;i:1;}}i:34;a:6:{s:1:"a";i:35;s:1:"b";s:24:"dish_category_management";s:1:"c";s:3:"web";s:1:"d";s:43:"Управление категориями";s:1:"e";i:0;s:1:"r";a:1:{i:0;i:1;}}i:35;a:6:{s:1:"a";i:36;s:1:"b";s:18:"show_dish_category";s:1:"c";s:3:"web";s:1:"d";s:16:"Просмотр";s:1:"e";i:35;s:1:"r";a:1:{i:0;i:1;}}i:36;a:6:{s:1:"a";i:37;s:1:"b";s:20:"create_dish_category";s:1:"c";s:3:"web";s:1:"d";s:18:"Добавлять";s:1:"e";i:35;s:1:"r";a:1:{i:0;i:1;}}i:37;a:6:{s:1:"a";i:38;s:1:"b";s:18:"edit_dish_category";s:1:"c";s:3:"web";s:1:"d";s:26:"Редактировать";s:1:"e";i:35;s:1:"r";a:1:{i:0;i:1;}}i:38;a:6:{s:1:"a";i:39;s:1:"b";s:20:"delete_dish_category";s:1:"c";s:3:"web";s:1:"d";s:14:"Удалить";s:1:"e";i:35;s:1:"r";a:1:{i:0;i:1;}}i:39;a:6:{s:1:"a";i:40;s:1:"b";s:21:"ingredient_management";s:1:"c";s:3:"web";s:1:"d";s:47:"Управление ингридиентами";s:1:"e";i:0;s:1:"r";a:1:{i:0;i:1;}}i:40;a:6:{s:1:"a";i:41;s:1:"b";s:15:"show_ingredient";s:1:"c";s:3:"web";s:1:"d";s:16:"Просмотр";s:1:"e";i:40;s:1:"r";a:1:{i:0;i:1;}}i:41;a:6:{s:1:"a";i:42;s:1:"b";s:17:"create_ingredient";s:1:"c";s:3:"web";s:1:"d";s:18:"Добавлять";s:1:"e";i:40;s:1:"r";a:1:{i:0;i:1;}}i:42;a:6:{s:1:"a";i:43;s:1:"b";s:15:"edit_ingredient";s:1:"c";s:3:"web";s:1:"d";s:26:"Редактировать";s:1:"e";i:40;s:1:"r";a:1:{i:0;i:1;}}i:43;a:6:{s:1:"a";i:44;s:1:"b";s:17:"delete_ingredient";s:1:"c";s:3:"web";s:1:"d";s:14:"Удалить";s:1:"e";i:40;s:1:"r";a:1:{i:0;i:1;}}i:44;a:6:{s:1:"a";i:45;s:1:"b";s:15:"menu_management";s:1:"c";s:3:"web";s:1:"d";s:29:"Управление меню";s:1:"e";i:0;s:1:"r";a:1:{i:0;i:1;}}i:45;a:6:{s:1:"a";i:46;s:1:"b";s:9:"show_menu";s:1:"c";s:3:"web";s:1:"d";s:16:"Просмотр";s:1:"e";i:45;s:1:"r";a:1:{i:0;i:1;}}i:46;a:6:{s:1:"a";i:47;s:1:"b";s:11:"create_menu";s:1:"c";s:3:"web";s:1:"d";s:18:"Добавлять";s:1:"e";i:45;s:1:"r";a:1:{i:0;i:1;}}i:47;a:6:{s:1:"a";i:48;s:1:"b";s:9:"edit_menu";s:1:"c";s:3:"web";s:1:"d";s:26:"Редактировать";s:1:"e";i:45;s:1:"r";a:1:{i:0;i:1;}}i:48;a:6:{s:1:"a";i:49;s:1:"b";s:11:"delete_menu";s:1:"c";s:3:"web";s:1:"d";s:14:"Удалить";s:1:"e";i:45;s:1:"r";a:1:{i:0;i:1;}}i:49;a:6:{s:1:"a";i:50;s:1:"b";s:26:"menu_restaurant_management";s:1:"c";s:3:"web";s:1:"d";s:53:"Управление меню в заведениях";s:1:"e";i:0;s:1:"r";a:1:{i:0;i:1;}}i:50;a:6:{s:1:"a";i:51;s:1:"b";s:26:"management_restaurant_menu";s:1:"c";s:3:"web";s:1:"d";s:20:"Управление";s:1:"e";i:50;s:1:"r";a:1:{i:0;i:1;}}i:51;a:6:{s:1:"a";i:52;s:1:"b";s:16:"story_management";s:1:"c";s:3:"web";s:1:"d";s:39:"Управление сторисами";s:1:"e";i:0;s:1:"r";a:1:{i:0;i:1;}}i:52;a:6:{s:1:"a";i:53;s:1:"b";s:10:"show_story";s:1:"c";s:3:"web";s:1:"d";s:16:"Просмотр";s:1:"e";i:52;s:1:"r";a:1:{i:0;i:1;}}i:53;a:6:{s:1:"a";i:54;s:1:"b";s:12:"create_story";s:1:"c";s:3:"web";s:1:"d";s:18:"Добавлять";s:1:"e";i:52;s:1:"r";a:1:{i:0;i:1;}}i:54;a:6:{s:1:"a";i:55;s:1:"b";s:10:"edit_story";s:1:"c";s:3:"web";s:1:"d";s:26:"Редактировать";s:1:"e";i:52;s:1:"r";a:1:{i:0;i:1;}}i:55;a:6:{s:1:"a";i:56;s:1:"b";s:12:"delete_story";s:1:"c";s:3:"web";s:1:"d";s:14:"Удалить";s:1:"e";i:52;s:1:"r";a:1:{i:0;i:1;}}i:56;a:6:{s:1:"a";i:57;s:1:"b";s:16:"bonus_management";s:1:"c";s:3:"web";s:1:"d";s:37:"Управление бонусами";s:1:"e";i:0;s:1:"r";a:1:{i:0;i:1;}}i:57;a:6:{s:1:"a";i:58;s:1:"b";s:10:"show_bonus";s:1:"c";s:3:"web";s:1:"d";s:16:"Просмотр";s:1:"e";i:57;s:1:"r";a:1:{i:0;i:1;}}i:58;a:6:{s:1:"a";i:59;s:1:"b";s:12:"create_bonus";s:1:"c";s:3:"web";s:1:"d";s:18:"Добавлять";s:1:"e";i:57;s:1:"r";a:1:{i:0;i:1;}}i:59;a:6:{s:1:"a";i:60;s:1:"b";s:10:"edit_bonus";s:1:"c";s:3:"web";s:1:"d";s:26:"Редактировать";s:1:"e";i:57;s:1:"r";a:1:{i:0;i:1;}}i:60;a:6:{s:1:"a";i:61;s:1:"b";s:12:"delete_bonus";s:1:"c";s:3:"web";s:1:"d";s:14:"Удалить";s:1:"e";i:57;s:1:"r";a:1:{i:0;i:1;}}i:61;a:6:{s:1:"a";i:62;s:1:"b";s:20:"promotion_management";s:1:"c";s:3:"web";s:1:"d";s:37:"Управление скидками";s:1:"e";i:0;s:1:"r";a:1:{i:0;i:1;}}i:62;a:6:{s:1:"a";i:63;s:1:"b";s:14:"show_promotion";s:1:"c";s:3:"web";s:1:"d";s:16:"Просмотр";s:1:"e";i:62;s:1:"r";a:1:{i:0;i:1;}}i:63;a:6:{s:1:"a";i:64;s:1:"b";s:16:"create_promotion";s:1:"c";s:3:"web";s:1:"d";s:18:"Добавлять";s:1:"e";i:62;s:1:"r";a:1:{i:0;i:1;}}i:64;a:6:{s:1:"a";i:65;s:1:"b";s:14:"edit_promotion";s:1:"c";s:3:"web";s:1:"d";s:26:"Редактировать";s:1:"e";i:62;s:1:"r";a:1:{i:0;i:1;}}i:65;a:6:{s:1:"a";i:66;s:1:"b";s:16:"delete_promotion";s:1:"c";s:3:"web";s:1:"d";s:14:"Удалить";s:1:"e";i:62;s:1:"r";a:1:{i:0;i:1;}}i:66;a:6:{s:1:"a";i:67;s:1:"b";s:18:"present_management";s:1:"c";s:3:"web";s:1:"d";s:39:"Управление подарками";s:1:"e";i:0;s:1:"r";a:1:{i:0;i:1;}}i:67;a:6:{s:1:"a";i:68;s:1:"b";s:12:"show_present";s:1:"c";s:3:"web";s:1:"d";s:16:"Просмотр";s:1:"e";i:67;s:1:"r";a:1:{i:0;i:1;}}i:68;a:6:{s:1:"a";i:69;s:1:"b";s:14:"create_present";s:1:"c";s:3:"web";s:1:"d";s:18:"Добавлять";s:1:"e";i:67;s:1:"r";a:1:{i:0;i:1;}}i:69;a:6:{s:1:"a";i:70;s:1:"b";s:12:"edit_present";s:1:"c";s:3:"web";s:1:"d";s:26:"Редактировать";s:1:"e";i:67;s:1:"r";a:1:{i:0;i:1;}}i:70;a:6:{s:1:"a";i:71;s:1:"b";s:14:"delete_present";s:1:"c";s:3:"web";s:1:"d";s:14:"Удалить";s:1:"e";i:67;s:1:"r";a:1:{i:0;i:1;}}i:71;a:6:{s:1:"a";i:72;s:1:"b";s:21:"promo_code_management";s:1:"c";s:3:"web";s:1:"d";s:43:"Управление промокодами";s:1:"e";i:0;s:1:"r";a:1:{i:0;i:1;}}i:72;a:6:{s:1:"a";i:73;s:1:"b";s:15:"show_promo_code";s:1:"c";s:3:"web";s:1:"d";s:16:"Просмотр";s:1:"e";i:72;s:1:"r";a:1:{i:0;i:1;}}i:73;a:6:{s:1:"a";i:74;s:1:"b";s:17:"create_promo_code";s:1:"c";s:3:"web";s:1:"d";s:18:"Добавлять";s:1:"e";i:72;s:1:"r";a:1:{i:0;i:1;}}i:74;a:6:{s:1:"a";i:75;s:1:"b";s:15:"edit_promo_code";s:1:"c";s:3:"web";s:1:"d";s:26:"Редактировать";s:1:"e";i:72;s:1:"r";a:1:{i:0;i:1;}}i:75;a:6:{s:1:"a";i:76;s:1:"b";s:17:"delete_promo_code";s:1:"c";s:3:"web";s:1:"d";s:14:"Удалить";s:1:"e";i:72;s:1:"r";a:1:{i:0;i:1;}}i:76;a:6:{s:1:"a";i:77;s:1:"b";s:22:"user_status_management";s:1:"c";s:3:"web";s:1:"d";s:66:"Управление статусами пользователей";s:1:"e";i:0;s:1:"r";a:1:{i:0;i:1;}}i:77;a:6:{s:1:"a";i:78;s:1:"b";s:16:"show_user_status";s:1:"c";s:3:"web";s:1:"d";s:16:"Просмотр";s:1:"e";i:77;s:1:"r";a:1:{i:0;i:1;}}i:78;a:6:{s:1:"a";i:79;s:1:"b";s:18:"create_user_status";s:1:"c";s:3:"web";s:1:"d";s:18:"Добавлять";s:1:"e";i:77;s:1:"r";a:1:{i:0;i:1;}}i:79;a:6:{s:1:"a";i:80;s:1:"b";s:16:"edit_user_status";s:1:"c";s:3:"web";s:1:"d";s:26:"Редактировать";s:1:"e";i:77;s:1:"r";a:1:{i:0;i:1;}}i:80;a:6:{s:1:"a";i:81;s:1:"b";s:18:"delete_user_status";s:1:"c";s:3:"web";s:1:"d";s:14:"Удалить";s:1:"e";i:77;s:1:"r";a:1:{i:0;i:1;}}}s:5:"roles";a:1:{i:0;a:3:{s:1:"a";i:1;s:1:"b";s:11:"super-admin";s:1:"c";s:3:"web";}}}	1728068626
829f52f1657005a54c05f983195d0a47fdaa8f41	i:2;	1720637965
1574bddb75c78a6fd2251d61e2993b5146201319:timer	i:1727613014;	1727613014
1574bddb75c78a6fd2251d61e2993b5146201319	i:1;	1727613014
42fea0bf46574beed3dc2731aaf357f190b6cd51:timer	i:1726132877;	1726132877
64836d293f6dc12d9aad35ac5edcdfb62e9da38f:timer	i:1721166249;	1721166249
42fea0bf46574beed3dc2731aaf357f190b6cd51	i:1;	1726132877
64836d293f6dc12d9aad35ac5edcdfb62e9da38f	i:3;	1721166249
adea7b4198f87d18e6293b8563b7bd1fe58521f2:timer	i:1721862853;	1721862853
adea7b4198f87d18e6293b8563b7bd1fe58521f2	i:1;	1721862853
f8d547929bd806159fb54e2953dfe4ae161bbb4d:timer	i:1722426111;	1722426111
f8d547929bd806159fb54e2953dfe4ae161bbb4d	i:1;	1722426111
admin@adminkim.ru|185.146.112.45:timer	i:1727988346;	1727988346
66cbb3529d5e6a33addbdb3bf78b3a0a58e94163:timer	i:1727976397;	1727976397
1c62caa07ab2c1a4fa890e58fb0626e838cc8874:timer	i:1727627327;	1727627327
admin@adminkim.ru|185.146.112.45	i:1;	1727988346
1c62caa07ab2c1a4fa890e58fb0626e838cc8874	i:5;	1727627327
66cbb3529d5e6a33addbdb3bf78b3a0a58e94163	i:33;	1727976397
e7a2dc1291656e51cd3219d2c259d0113eaf60de:timer	i:1721241681;	1721241681
admin@test.ru|185.146.112.45:timer	i:1727982290;	1727982290
e7a2dc1291656e51cd3219d2c259d0113eaf60de	i:2;	1721241681
120ef184aa70e3d1b2a716450b6bdae5b94fce82:timer	i:1722161488;	1722161488
120ef184aa70e3d1b2a716450b6bdae5b94fce82	i:1;	1722161488
admin@test.ru|185.146.112.45	i:1;	1727982290
f190e5e40550af866b960fb37e67b1eb5dbcb9b2:timer	i:1724667421;	1724667421
f190e5e40550af866b960fb37e67b1eb5dbcb9b2	i:1;	1724667421
95f55126cfd9a63dc6f8e652cf041e1754152501:timer	i:1728075116;	1728075116
95f55126cfd9a63dc6f8e652cf041e1754152501	i:1;	1728075116
36e920e631b75e256ad99b60542f9b7cc4867db1:timer	i:1726132882;	1726132882
c1cdb91be8241da791cbd3c891fc55ed122ff396:timer	i:1722429561;	1722429561
c1cdb91be8241da791cbd3c891fc55ed122ff396	i:1;	1722429561
36e920e631b75e256ad99b60542f9b7cc4867db1	i:1;	1726132882
d38de4fdcdb411c7bf2898e4b2f7800346f49f1c:timer	i:1726465461;	1726465461
d38de4fdcdb411c7bf2898e4b2f7800346f49f1c	i:1;	1726465461
0d38d0443b10788aced68c25dcf8dcbac638eb30:timer	i:1727443991;	1727443991
0d38d0443b10788aced68c25dcf8dcbac638eb30	i:1;	1727443991
6066f1f77e72c23d9817d3b9e53532a1d713f66b:timer	i:1727195636;	1727195636
6066f1f77e72c23d9817d3b9e53532a1d713f66b	i:2;	1727195636
6940868ad94b853a9f1636fe21fcdd580ee65267:timer	i:1727445807;	1727445807
6940868ad94b853a9f1636fe21fcdd580ee65267	i:1;	1727445807
2f89e7ce1135313d1e9ff6be05bd653c8064657b:timer	i:1722944461;	1722944461
2f89e7ce1135313d1e9ff6be05bd653c8064657b	i:1;	1722944461
f97dba5a20157fb6d08b9ed7777313f812ab5a70:timer	i:1726688460;	1726688460
412a783924feba63d3c604b9c228a6f9c6933b0f:timer	i:1724422087;	1724422087
a15b1a4b6e4608ba0f60a35d1aab8ebc42ddfc8e:timer	i:1728076620;	1728076620
412a783924feba63d3c604b9c228a6f9c6933b0f	i:2;	1724422087
f97dba5a20157fb6d08b9ed7777313f812ab5a70	i:4;	1726688460
14f90899c32164a275d35e7cc7bae16a37e8c20a:timer	i:1727626420;	1727626420
14f90899c32164a275d35e7cc7bae16a37e8c20a	i:2;	1727626420
5dd6996c6844b057b8a0852dcc9f4230c12cc96d:timer	i:1727954051;	1727954051
a15b1a4b6e4608ba0f60a35d1aab8ebc42ddfc8e	i:9;	1728076620
77de68daecd823babbb58edb1c8e14d7106e83bb:timer	i:1728074365;	1728074365
77de68daecd823babbb58edb1c8e14d7106e83bb	i:1;	1728074365
5dd6996c6844b057b8a0852dcc9f4230c12cc96d	i:27;	1727954051
\.


--
-- Data for Name: cache_locks; Type: TABLE DATA; Schema: public; Owner: kim
--

COPY public.cache_locks (key, owner, expiration) FROM stdin;
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: kim
--

COPY public.categories (id, name, "order", created_at, updated_at) FROM stdin;
1	Роллы	1	2024-07-09 11:04:18	2024-07-09 11:04:18
2	Сеты	1	2024-07-09 11:04:18	2024-07-09 11:04:18
5	Напитки	1	2024-07-09 11:04:18	2024-07-09 11:04:18
6	Темпурные роллы	3	2024-07-10 06:23:07	2024-07-10 06:23:07
7	Запеченные роллы	4	2024-07-10 06:24:54	2024-07-10 06:24:54
8	Холодные роллы	5	2024-07-10 06:25:30	2024-07-10 06:25:30
9	Роллы классические	6	2024-07-10 06:26:03	2024-07-10 06:26:03
4	Горячие закуски	1	2024-07-09 11:04:18	2024-07-10 06:26:14
10	Дополнения	7	2024-07-10 06:26:23	2024-07-10 06:26:23
11	Акции	8	2024-07-10 06:26:27	2024-07-10 06:26:27
3	Пицца	9	2024-07-09 11:04:18	2024-07-31 15:41:56
12	Сеты	0	2024-07-10 10:10:49	2024-07-31 15:42:58
\.


--
-- Data for Name: category_additive; Type: TABLE DATA; Schema: public; Owner: kim
--

COPY public.category_additive (id, additive_id, category_id) FROM stdin;
1	1	4
2	2	10
3	4	10
\.


--
-- Data for Name: category_device; Type: TABLE DATA; Schema: public; Owner: kim
--

COPY public.category_device (id, category_id, device_id) FROM stdin;
\.


--
-- Data for Name: devices; Type: TABLE DATA; Schema: public; Owner: kim
--

COPY public.devices (id, name, price, created_at, updated_at) FROM stdin;
1	Салфетки	5	2024-07-11 14:42:32	2024-07-11 14:42:32
\.


--
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: kim
--

COPY public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
\.


--
-- Data for Name: ingredient_categories; Type: TABLE DATA; Schema: public; Owner: kim
--

COPY public.ingredient_categories (id, name, created_at, updated_at) FROM stdin;
1	Море продукты	2024-07-12 12:51:41	2024-07-12 12:51:41
2	Крупы	2024-07-12 12:51:47	2024-07-12 12:51:47
\.


--
-- Data for Name: ingredients; Type: TABLE DATA; Schema: public; Owner: kim
--

COPY public.ingredients (id, name, created_at, updated_at, category_id, measurement_id) FROM stdin;
1	Рис для суши	2024-07-09 11:04:18	2024-07-09 11:04:18	\N	\N
2	Нори (листы водорослей)	2024-07-09 11:04:18	2024-07-09 11:04:18	\N	\N
3	Свежая рыба (например, тунец, лосось, желтохвост)	2024-07-09 11:04:18	2024-07-09 11:04:18	\N	\N
4	Приготовленные морепродукты (например, креветки, краб, угорь)	2024-07-09 11:04:18	2024-07-09 11:04:18	\N	\N
5	Овощи (например, авокадо, огурец, морковь, редис)	2024-07-09 11:04:18	2024-07-09 11:04:18	\N	\N
6	Маринованный имбирь	2024-07-09 11:04:18	2024-07-09 11:04:18	\N	\N
7	Васаби	2024-07-09 11:04:18	2024-07-09 11:04:18	\N	\N
8	Соевый соус	2024-07-09 11:04:18	2024-07-09 11:04:18	\N	\N
9	Кунжутные семена	2024-07-09 11:04:18	2024-07-09 11:04:18	\N	\N
10	Темпурное тесто	2024-07-09 11:04:18	2024-07-09 11:04:18	\N	\N
11	Панко (японские панировочные сухари)	2024-07-09 11:04:18	2024-07-09 11:04:18	\N	\N
12	Сливочный сыр	2024-07-09 11:04:18	2024-07-09 11:04:18	\N	\N
13	Японский майонез	2024-07-09 11:04:18	2024-07-09 11:04:18	\N	\N
14	Тобико (икра летучей рыбы)	2024-07-09 11:04:18	2024-07-09 11:04:18	\N	\N
15	Масаго (икра мойвы)	2024-07-09 11:04:18	2024-07-09 11:04:18	\N	\N
16	Эби (креветки)	2024-07-09 11:04:18	2024-07-09 11:04:18	\N	\N
17	Тамаго (японский омлет)	2024-07-09 11:04:18	2024-07-09 11:04:18	\N	\N
18	Зеленый лук	2024-07-09 11:04:18	2024-07-09 11:04:18	\N	\N
19	Грибы шиитаке	2024-07-09 11:04:18	2024-07-09 11:04:18	\N	\N
20	Сирача (острый соус)	2024-07-09 11:04:18	2024-07-09 11:04:18	\N	\N
21	Понзу (японский цитрусовый соус)	2024-07-09 11:04:18	2024-07-09 11:04:18	\N	\N
22	Мирин (сладкое рисовое вино)	2024-07-09 11:04:18	2024-07-09 11:04:18	\N	\N
23	Рисовый уксус	2024-07-09 11:04:18	2024-07-09 11:04:18	\N	\N
24	Сахар	2024-07-09 11:04:18	2024-07-09 11:04:18	\N	\N
25	Соль	2024-07-09 11:04:18	2024-07-09 11:04:18	\N	\N
26	Даси (японский бульон)	2024-07-09 11:04:18	2024-07-09 11:04:18	\N	\N
27	Стружка тунца (бонито)	2024-07-09 11:04:18	2024-07-09 11:04:18	\N	\N
28	Кьюпи майонез (японский майонез)	2024-07-09 11:04:18	2024-07-09 11:04:18	\N	\N
29	Маринованная дайкон	2024-07-09 11:04:18	2024-07-09 11:04:18	\N	\N
30	Эдамаме	2024-07-09 11:04:18	2024-07-09 11:04:18	\N	\N
31	Фурикаке (японская приправа для риса)	2024-07-09 11:04:18	2024-07-09 11:04:18	\N	\N
32	рис	2024-07-10 07:03:31	2024-07-10 07:03:31	\N	2
\.


--
-- Data for Name: job_batches; Type: TABLE DATA; Schema: public; Owner: kim
--

COPY public.job_batches (id, name, total_jobs, pending_jobs, failed_jobs, failed_job_ids, options, cancelled_at, created_at, finished_at) FROM stdin;
\.


--
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: kim
--

COPY public.jobs (id, queue, payload, attempts, reserved_at, available_at, created_at) FROM stdin;
1	default	{"uuid":"593f8990-6be7-4c6d-a51f-1d665f40776d","displayName":"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob","command":"O:58:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\\":5:{s:14:\\"\\u0000*\\u0000conversions\\";O:52:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\ConversionCollection\\":2:{s:8:\\"\\u0000*\\u0000items\\";a:2:{i:0;O:42:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\":11:{s:12:\\"\\u0000*\\u0000fileNamer\\";O:54:\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\":0:{}s:28:\\"\\u0000*\\u0000extractVideoFrameAtSecond\\";d:0;s:16:\\"\\u0000*\\u0000manipulations\\";O:45:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Manipulations\\":1:{s:16:\\"\\u0000*\\u0000manipulations\\";a:3:{s:8:\\"optimize\\";a:1:{i:0;O:36:\\"Spatie\\\\ImageOptimizer\\\\OptimizerChain\\":3:{s:13:\\"\\u0000*\\u0000optimizers\\";a:7:{i:0;O:42:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Jpegoptim\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m85\\";i:1;s:7:\\"--force\\";i:2;s:11:\\"--strip-all\\";i:3;s:17:\\"--all-progressive\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:9:\\"jpegoptim\\";}i:1;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Pngquant\\":5:{s:7:\\"options\\";a:1:{i:0;s:7:\\"--force\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"pngquant\\";}i:2;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Optipng\\":5:{s:7:\\"options\\";a:3:{i:0;s:3:\\"-i0\\";i:1;s:3:\\"-o2\\";i:2;s:6:\\"-quiet\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"optipng\\";}i:3;O:37:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Svgo\\":5:{s:7:\\"options\\";a:1:{i:0;s:20:\\"--disable=cleanupIDs\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:4:\\"svgo\\";}i:4;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Gifsicle\\":5:{s:7:\\"options\\";a:2:{i:0;s:2:\\"-b\\";i:1;s:3:\\"-O3\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"gifsicle\\";}i:5;O:38:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Cwebp\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m 6\\";i:1;s:8:\\"-pass 10\\";i:2;s:3:\\"-mt\\";i:3;s:5:\\"-q 90\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:5:\\"cwebp\\";}i:6;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Avifenc\\":6:{s:7:\\"options\\";a:8:{i:0;s:14:\\"-a cq-level=23\\";i:1;s:6:\\"-j all\\";i:2;s:7:\\"--min 0\\";i:3;s:8:\\"--max 63\\";i:4;s:12:\\"--minalpha 0\\";i:5;s:13:\\"--maxalpha 63\\";i:6;s:14:\\"-a end-usage=q\\";i:7;s:12:\\"-a tune=ssim\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"avifenc\\";s:16:\\"decodeBinaryName\\";s:7:\\"avifdec\\";}}s:9:\\"\\u0000*\\u0000logger\\";O:33:\\"Spatie\\\\ImageOptimizer\\\\DummyLogger\\":0:{}s:10:\\"\\u0000*\\u0000timeout\\";i:60;}}s:6:\\"format\\";a:1:{i:0;s:3:\\"jpg\\";}s:3:\\"fit\\";a:3:{i:0;E:27:\\"Spatie\\\\Image\\\\Enums\\\\Fit:Crop\\";i:1;i:600;i:2;i:600;}}}s:23:\\"\\u0000*\\u0000performOnCollections\\";a:0:{}s:17:\\"\\u0000*\\u0000performOnQueue\\";b:1;s:26:\\"\\u0000*\\u0000keepOriginalImageFormat\\";b:0;s:27:\\"\\u0000*\\u0000generateResponsiveImages\\";b:0;s:18:\\"\\u0000*\\u0000widthCalculator\\";N;s:24:\\"\\u0000*\\u0000loadingAttributeValue\\";N;s:16:\\"\\u0000*\\u0000pdfPageNumber\\";i:1;s:7:\\"\\u0000*\\u0000name\\";s:5:\\"thumb\\";}i:1;O:42:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\":11:{s:12:\\"\\u0000*\\u0000fileNamer\\";O:54:\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\":0:{}s:28:\\"\\u0000*\\u0000extractVideoFrameAtSecond\\";d:0;s:16:\\"\\u0000*\\u0000manipulations\\";O:45:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Manipulations\\":1:{s:16:\\"\\u0000*\\u0000manipulations\\";a:3:{s:8:\\"optimize\\";a:1:{i:0;O:36:\\"Spatie\\\\ImageOptimizer\\\\OptimizerChain\\":3:{s:13:\\"\\u0000*\\u0000optimizers\\";a:7:{i:0;O:42:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Jpegoptim\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m85\\";i:1;s:7:\\"--force\\";i:2;s:11:\\"--strip-all\\";i:3;s:17:\\"--all-progressive\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:9:\\"jpegoptim\\";}i:1;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Pngquant\\":5:{s:7:\\"options\\";a:1:{i:0;s:7:\\"--force\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"pngquant\\";}i:2;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Optipng\\":5:{s:7:\\"options\\";a:3:{i:0;s:3:\\"-i0\\";i:1;s:3:\\"-o2\\";i:2;s:6:\\"-quiet\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"optipng\\";}i:3;O:37:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Svgo\\":5:{s:7:\\"options\\";a:1:{i:0;s:20:\\"--disable=cleanupIDs\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:4:\\"svgo\\";}i:4;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Gifsicle\\":5:{s:7:\\"options\\";a:2:{i:0;s:2:\\"-b\\";i:1;s:3:\\"-O3\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"gifsicle\\";}i:5;O:38:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Cwebp\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m 6\\";i:1;s:8:\\"-pass 10\\";i:2;s:3:\\"-mt\\";i:3;s:5:\\"-q 90\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:5:\\"cwebp\\";}i:6;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Avifenc\\":6:{s:7:\\"options\\";a:8:{i:0;s:14:\\"-a cq-level=23\\";i:1;s:6:\\"-j all\\";i:2;s:7:\\"--min 0\\";i:3;s:8:\\"--max 63\\";i:4;s:12:\\"--minalpha 0\\";i:5;s:13:\\"--maxalpha 63\\";i:6;s:14:\\"-a end-usage=q\\";i:7;s:12:\\"-a tune=ssim\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"avifenc\\";s:16:\\"decodeBinaryName\\";s:7:\\"avifdec\\";}}s:9:\\"\\u0000*\\u0000logger\\";O:33:\\"Spatie\\\\ImageOptimizer\\\\DummyLogger\\":0:{}s:10:\\"\\u0000*\\u0000timeout\\";i:60;}}s:6:\\"format\\";a:1:{i:0;s:3:\\"jpg\\";}s:3:\\"fit\\";a:3:{i:0;r:83;i:1;i:400;i:2;i:400;}}}s:23:\\"\\u0000*\\u0000performOnCollections\\";a:0:{}s:17:\\"\\u0000*\\u0000performOnQueue\\";b:1;s:26:\\"\\u0000*\\u0000keepOriginalImageFormat\\";b:0;s:27:\\"\\u0000*\\u0000generateResponsiveImages\\";b:0;s:18:\\"\\u0000*\\u0000widthCalculator\\";N;s:24:\\"\\u0000*\\u0000loadingAttributeValue\\";N;s:16:\\"\\u0000*\\u0000pdfPageNumber\\";i:1;s:7:\\"\\u0000*\\u0000name\\";s:4:\\"icon\\";}}s:28:\\"\\u0000*\\u0000escapeWhenCastingToString\\";b:0;}s:8:\\"\\u0000*\\u0000media\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":5:{s:5:\\"class\\";s:49:\\"Spatie\\\\MediaLibrary\\\\MediaCollections\\\\Models\\\\Media\\";s:2:\\"id\\";i:1;s:9:\\"relations\\";a:0:{}s:10:\\"connection\\";s:5:\\"pgsql\\";s:15:\\"collectionClass\\";N;}s:14:\\"\\u0000*\\u0000onlyMissing\\";b:0;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:0:\\"\\";}"}}	0	\N	1720594570	1720594570
2	default	{"uuid":"1dea40b8-44d3-46b0-94a9-eff303338e05","displayName":"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob","command":"O:58:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\\":5:{s:14:\\"\\u0000*\\u0000conversions\\";O:52:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\ConversionCollection\\":2:{s:8:\\"\\u0000*\\u0000items\\";a:2:{i:0;O:42:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\":11:{s:12:\\"\\u0000*\\u0000fileNamer\\";O:54:\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\":0:{}s:28:\\"\\u0000*\\u0000extractVideoFrameAtSecond\\";d:0;s:16:\\"\\u0000*\\u0000manipulations\\";O:45:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Manipulations\\":1:{s:16:\\"\\u0000*\\u0000manipulations\\";a:3:{s:8:\\"optimize\\";a:1:{i:0;O:36:\\"Spatie\\\\ImageOptimizer\\\\OptimizerChain\\":3:{s:13:\\"\\u0000*\\u0000optimizers\\";a:7:{i:0;O:42:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Jpegoptim\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m85\\";i:1;s:7:\\"--force\\";i:2;s:11:\\"--strip-all\\";i:3;s:17:\\"--all-progressive\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:9:\\"jpegoptim\\";}i:1;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Pngquant\\":5:{s:7:\\"options\\";a:1:{i:0;s:7:\\"--force\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"pngquant\\";}i:2;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Optipng\\":5:{s:7:\\"options\\";a:3:{i:0;s:3:\\"-i0\\";i:1;s:3:\\"-o2\\";i:2;s:6:\\"-quiet\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"optipng\\";}i:3;O:37:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Svgo\\":5:{s:7:\\"options\\";a:1:{i:0;s:20:\\"--disable=cleanupIDs\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:4:\\"svgo\\";}i:4;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Gifsicle\\":5:{s:7:\\"options\\";a:2:{i:0;s:2:\\"-b\\";i:1;s:3:\\"-O3\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"gifsicle\\";}i:5;O:38:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Cwebp\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m 6\\";i:1;s:8:\\"-pass 10\\";i:2;s:3:\\"-mt\\";i:3;s:5:\\"-q 90\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:5:\\"cwebp\\";}i:6;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Avifenc\\":6:{s:7:\\"options\\";a:8:{i:0;s:14:\\"-a cq-level=23\\";i:1;s:6:\\"-j all\\";i:2;s:7:\\"--min 0\\";i:3;s:8:\\"--max 63\\";i:4;s:12:\\"--minalpha 0\\";i:5;s:13:\\"--maxalpha 63\\";i:6;s:14:\\"-a end-usage=q\\";i:7;s:12:\\"-a tune=ssim\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"avifenc\\";s:16:\\"decodeBinaryName\\";s:7:\\"avifdec\\";}}s:9:\\"\\u0000*\\u0000logger\\";O:33:\\"Spatie\\\\ImageOptimizer\\\\DummyLogger\\":0:{}s:10:\\"\\u0000*\\u0000timeout\\";i:60;}}s:6:\\"format\\";a:1:{i:0;s:3:\\"jpg\\";}s:3:\\"fit\\";a:3:{i:0;E:27:\\"Spatie\\\\Image\\\\Enums\\\\Fit:Crop\\";i:1;i:600;i:2;i:600;}}}s:23:\\"\\u0000*\\u0000performOnCollections\\";a:0:{}s:17:\\"\\u0000*\\u0000performOnQueue\\";b:1;s:26:\\"\\u0000*\\u0000keepOriginalImageFormat\\";b:0;s:27:\\"\\u0000*\\u0000generateResponsiveImages\\";b:0;s:18:\\"\\u0000*\\u0000widthCalculator\\";N;s:24:\\"\\u0000*\\u0000loadingAttributeValue\\";N;s:16:\\"\\u0000*\\u0000pdfPageNumber\\";i:1;s:7:\\"\\u0000*\\u0000name\\";s:5:\\"thumb\\";}i:1;O:42:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\":11:{s:12:\\"\\u0000*\\u0000fileNamer\\";O:54:\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\":0:{}s:28:\\"\\u0000*\\u0000extractVideoFrameAtSecond\\";d:0;s:16:\\"\\u0000*\\u0000manipulations\\";O:45:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Manipulations\\":1:{s:16:\\"\\u0000*\\u0000manipulations\\";a:3:{s:8:\\"optimize\\";a:1:{i:0;O:36:\\"Spatie\\\\ImageOptimizer\\\\OptimizerChain\\":3:{s:13:\\"\\u0000*\\u0000optimizers\\";a:7:{i:0;O:42:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Jpegoptim\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m85\\";i:1;s:7:\\"--force\\";i:2;s:11:\\"--strip-all\\";i:3;s:17:\\"--all-progressive\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:9:\\"jpegoptim\\";}i:1;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Pngquant\\":5:{s:7:\\"options\\";a:1:{i:0;s:7:\\"--force\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"pngquant\\";}i:2;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Optipng\\":5:{s:7:\\"options\\";a:3:{i:0;s:3:\\"-i0\\";i:1;s:3:\\"-o2\\";i:2;s:6:\\"-quiet\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"optipng\\";}i:3;O:37:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Svgo\\":5:{s:7:\\"options\\";a:1:{i:0;s:20:\\"--disable=cleanupIDs\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:4:\\"svgo\\";}i:4;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Gifsicle\\":5:{s:7:\\"options\\";a:2:{i:0;s:2:\\"-b\\";i:1;s:3:\\"-O3\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"gifsicle\\";}i:5;O:38:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Cwebp\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m 6\\";i:1;s:8:\\"-pass 10\\";i:2;s:3:\\"-mt\\";i:3;s:5:\\"-q 90\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:5:\\"cwebp\\";}i:6;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Avifenc\\":6:{s:7:\\"options\\";a:8:{i:0;s:14:\\"-a cq-level=23\\";i:1;s:6:\\"-j all\\";i:2;s:7:\\"--min 0\\";i:3;s:8:\\"--max 63\\";i:4;s:12:\\"--minalpha 0\\";i:5;s:13:\\"--maxalpha 63\\";i:6;s:14:\\"-a end-usage=q\\";i:7;s:12:\\"-a tune=ssim\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"avifenc\\";s:16:\\"decodeBinaryName\\";s:7:\\"avifdec\\";}}s:9:\\"\\u0000*\\u0000logger\\";O:33:\\"Spatie\\\\ImageOptimizer\\\\DummyLogger\\":0:{}s:10:\\"\\u0000*\\u0000timeout\\";i:60;}}s:6:\\"format\\";a:1:{i:0;s:3:\\"jpg\\";}s:3:\\"fit\\";a:3:{i:0;r:83;i:1;i:400;i:2;i:400;}}}s:23:\\"\\u0000*\\u0000performOnCollections\\";a:0:{}s:17:\\"\\u0000*\\u0000performOnQueue\\";b:1;s:26:\\"\\u0000*\\u0000keepOriginalImageFormat\\";b:0;s:27:\\"\\u0000*\\u0000generateResponsiveImages\\";b:0;s:18:\\"\\u0000*\\u0000widthCalculator\\";N;s:24:\\"\\u0000*\\u0000loadingAttributeValue\\";N;s:16:\\"\\u0000*\\u0000pdfPageNumber\\";i:1;s:7:\\"\\u0000*\\u0000name\\";s:4:\\"icon\\";}}s:28:\\"\\u0000*\\u0000escapeWhenCastingToString\\";b:0;}s:8:\\"\\u0000*\\u0000media\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":5:{s:5:\\"class\\";s:49:\\"Spatie\\\\MediaLibrary\\\\MediaCollections\\\\Models\\\\Media\\";s:2:\\"id\\";i:2;s:9:\\"relations\\";a:0:{}s:10:\\"connection\\";s:5:\\"pgsql\\";s:15:\\"collectionClass\\";N;}s:14:\\"\\u0000*\\u0000onlyMissing\\";b:0;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:0:\\"\\";}"}}	0	\N	1720594637	1720594637
3	default	{"uuid":"be117c55-90d8-479a-8ad4-7f024b88400c","displayName":"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob","command":"O:58:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\\":5:{s:14:\\"\\u0000*\\u0000conversions\\";O:52:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\ConversionCollection\\":2:{s:8:\\"\\u0000*\\u0000items\\";a:2:{i:0;O:42:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\":11:{s:12:\\"\\u0000*\\u0000fileNamer\\";O:54:\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\":0:{}s:28:\\"\\u0000*\\u0000extractVideoFrameAtSecond\\";d:0;s:16:\\"\\u0000*\\u0000manipulations\\";O:45:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Manipulations\\":1:{s:16:\\"\\u0000*\\u0000manipulations\\";a:3:{s:8:\\"optimize\\";a:1:{i:0;O:36:\\"Spatie\\\\ImageOptimizer\\\\OptimizerChain\\":3:{s:13:\\"\\u0000*\\u0000optimizers\\";a:7:{i:0;O:42:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Jpegoptim\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m85\\";i:1;s:7:\\"--force\\";i:2;s:11:\\"--strip-all\\";i:3;s:17:\\"--all-progressive\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:9:\\"jpegoptim\\";}i:1;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Pngquant\\":5:{s:7:\\"options\\";a:1:{i:0;s:7:\\"--force\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"pngquant\\";}i:2;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Optipng\\":5:{s:7:\\"options\\";a:3:{i:0;s:3:\\"-i0\\";i:1;s:3:\\"-o2\\";i:2;s:6:\\"-quiet\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"optipng\\";}i:3;O:37:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Svgo\\":5:{s:7:\\"options\\";a:1:{i:0;s:20:\\"--disable=cleanupIDs\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:4:\\"svgo\\";}i:4;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Gifsicle\\":5:{s:7:\\"options\\";a:2:{i:0;s:2:\\"-b\\";i:1;s:3:\\"-O3\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"gifsicle\\";}i:5;O:38:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Cwebp\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m 6\\";i:1;s:8:\\"-pass 10\\";i:2;s:3:\\"-mt\\";i:3;s:5:\\"-q 90\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:5:\\"cwebp\\";}i:6;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Avifenc\\":6:{s:7:\\"options\\";a:8:{i:0;s:14:\\"-a cq-level=23\\";i:1;s:6:\\"-j all\\";i:2;s:7:\\"--min 0\\";i:3;s:8:\\"--max 63\\";i:4;s:12:\\"--minalpha 0\\";i:5;s:13:\\"--maxalpha 63\\";i:6;s:14:\\"-a end-usage=q\\";i:7;s:12:\\"-a tune=ssim\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"avifenc\\";s:16:\\"decodeBinaryName\\";s:7:\\"avifdec\\";}}s:9:\\"\\u0000*\\u0000logger\\";O:33:\\"Spatie\\\\ImageOptimizer\\\\DummyLogger\\":0:{}s:10:\\"\\u0000*\\u0000timeout\\";i:60;}}s:6:\\"format\\";a:1:{i:0;s:3:\\"jpg\\";}s:3:\\"fit\\";a:3:{i:0;E:27:\\"Spatie\\\\Image\\\\Enums\\\\Fit:Crop\\";i:1;i:600;i:2;i:600;}}}s:23:\\"\\u0000*\\u0000performOnCollections\\";a:0:{}s:17:\\"\\u0000*\\u0000performOnQueue\\";b:1;s:26:\\"\\u0000*\\u0000keepOriginalImageFormat\\";b:0;s:27:\\"\\u0000*\\u0000generateResponsiveImages\\";b:0;s:18:\\"\\u0000*\\u0000widthCalculator\\";N;s:24:\\"\\u0000*\\u0000loadingAttributeValue\\";N;s:16:\\"\\u0000*\\u0000pdfPageNumber\\";i:1;s:7:\\"\\u0000*\\u0000name\\";s:5:\\"thumb\\";}i:1;O:42:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\":11:{s:12:\\"\\u0000*\\u0000fileNamer\\";O:54:\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\":0:{}s:28:\\"\\u0000*\\u0000extractVideoFrameAtSecond\\";d:0;s:16:\\"\\u0000*\\u0000manipulations\\";O:45:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Manipulations\\":1:{s:16:\\"\\u0000*\\u0000manipulations\\";a:3:{s:8:\\"optimize\\";a:1:{i:0;O:36:\\"Spatie\\\\ImageOptimizer\\\\OptimizerChain\\":3:{s:13:\\"\\u0000*\\u0000optimizers\\";a:7:{i:0;O:42:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Jpegoptim\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m85\\";i:1;s:7:\\"--force\\";i:2;s:11:\\"--strip-all\\";i:3;s:17:\\"--all-progressive\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:9:\\"jpegoptim\\";}i:1;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Pngquant\\":5:{s:7:\\"options\\";a:1:{i:0;s:7:\\"--force\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"pngquant\\";}i:2;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Optipng\\":5:{s:7:\\"options\\";a:3:{i:0;s:3:\\"-i0\\";i:1;s:3:\\"-o2\\";i:2;s:6:\\"-quiet\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"optipng\\";}i:3;O:37:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Svgo\\":5:{s:7:\\"options\\";a:1:{i:0;s:20:\\"--disable=cleanupIDs\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:4:\\"svgo\\";}i:4;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Gifsicle\\":5:{s:7:\\"options\\";a:2:{i:0;s:2:\\"-b\\";i:1;s:3:\\"-O3\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"gifsicle\\";}i:5;O:38:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Cwebp\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m 6\\";i:1;s:8:\\"-pass 10\\";i:2;s:3:\\"-mt\\";i:3;s:5:\\"-q 90\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:5:\\"cwebp\\";}i:6;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Avifenc\\":6:{s:7:\\"options\\";a:8:{i:0;s:14:\\"-a cq-level=23\\";i:1;s:6:\\"-j all\\";i:2;s:7:\\"--min 0\\";i:3;s:8:\\"--max 63\\";i:4;s:12:\\"--minalpha 0\\";i:5;s:13:\\"--maxalpha 63\\";i:6;s:14:\\"-a end-usage=q\\";i:7;s:12:\\"-a tune=ssim\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"avifenc\\";s:16:\\"decodeBinaryName\\";s:7:\\"avifdec\\";}}s:9:\\"\\u0000*\\u0000logger\\";O:33:\\"Spatie\\\\ImageOptimizer\\\\DummyLogger\\":0:{}s:10:\\"\\u0000*\\u0000timeout\\";i:60;}}s:6:\\"format\\";a:1:{i:0;s:3:\\"jpg\\";}s:3:\\"fit\\";a:3:{i:0;r:83;i:1;i:400;i:2;i:400;}}}s:23:\\"\\u0000*\\u0000performOnCollections\\";a:0:{}s:17:\\"\\u0000*\\u0000performOnQueue\\";b:1;s:26:\\"\\u0000*\\u0000keepOriginalImageFormat\\";b:0;s:27:\\"\\u0000*\\u0000generateResponsiveImages\\";b:0;s:18:\\"\\u0000*\\u0000widthCalculator\\";N;s:24:\\"\\u0000*\\u0000loadingAttributeValue\\";N;s:16:\\"\\u0000*\\u0000pdfPageNumber\\";i:1;s:7:\\"\\u0000*\\u0000name\\";s:4:\\"icon\\";}}s:28:\\"\\u0000*\\u0000escapeWhenCastingToString\\";b:0;}s:8:\\"\\u0000*\\u0000media\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":5:{s:5:\\"class\\";s:49:\\"Spatie\\\\MediaLibrary\\\\MediaCollections\\\\Models\\\\Media\\";s:2:\\"id\\";i:3;s:9:\\"relations\\";a:0:{}s:10:\\"connection\\";s:5:\\"pgsql\\";s:15:\\"collectionClass\\";N;}s:14:\\"\\u0000*\\u0000onlyMissing\\";b:0;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:0:\\"\\";}"}}	0	\N	1720594693	1720594693
4	default	{"uuid":"181e288d-2c49-4748-a411-0b00f71d6d4c","displayName":"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob","command":"O:58:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\\":5:{s:14:\\"\\u0000*\\u0000conversions\\";O:52:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\ConversionCollection\\":2:{s:8:\\"\\u0000*\\u0000items\\";a:2:{i:0;O:42:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\":11:{s:12:\\"\\u0000*\\u0000fileNamer\\";O:54:\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\":0:{}s:28:\\"\\u0000*\\u0000extractVideoFrameAtSecond\\";d:0;s:16:\\"\\u0000*\\u0000manipulations\\";O:45:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Manipulations\\":1:{s:16:\\"\\u0000*\\u0000manipulations\\";a:3:{s:8:\\"optimize\\";a:1:{i:0;O:36:\\"Spatie\\\\ImageOptimizer\\\\OptimizerChain\\":3:{s:13:\\"\\u0000*\\u0000optimizers\\";a:7:{i:0;O:42:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Jpegoptim\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m85\\";i:1;s:7:\\"--force\\";i:2;s:11:\\"--strip-all\\";i:3;s:17:\\"--all-progressive\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:9:\\"jpegoptim\\";}i:1;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Pngquant\\":5:{s:7:\\"options\\";a:1:{i:0;s:7:\\"--force\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"pngquant\\";}i:2;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Optipng\\":5:{s:7:\\"options\\";a:3:{i:0;s:3:\\"-i0\\";i:1;s:3:\\"-o2\\";i:2;s:6:\\"-quiet\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"optipng\\";}i:3;O:37:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Svgo\\":5:{s:7:\\"options\\";a:1:{i:0;s:20:\\"--disable=cleanupIDs\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:4:\\"svgo\\";}i:4;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Gifsicle\\":5:{s:7:\\"options\\";a:2:{i:0;s:2:\\"-b\\";i:1;s:3:\\"-O3\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"gifsicle\\";}i:5;O:38:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Cwebp\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m 6\\";i:1;s:8:\\"-pass 10\\";i:2;s:3:\\"-mt\\";i:3;s:5:\\"-q 90\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:5:\\"cwebp\\";}i:6;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Avifenc\\":6:{s:7:\\"options\\";a:8:{i:0;s:14:\\"-a cq-level=23\\";i:1;s:6:\\"-j all\\";i:2;s:7:\\"--min 0\\";i:3;s:8:\\"--max 63\\";i:4;s:12:\\"--minalpha 0\\";i:5;s:13:\\"--maxalpha 63\\";i:6;s:14:\\"-a end-usage=q\\";i:7;s:12:\\"-a tune=ssim\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"avifenc\\";s:16:\\"decodeBinaryName\\";s:7:\\"avifdec\\";}}s:9:\\"\\u0000*\\u0000logger\\";O:33:\\"Spatie\\\\ImageOptimizer\\\\DummyLogger\\":0:{}s:10:\\"\\u0000*\\u0000timeout\\";i:60;}}s:6:\\"format\\";a:1:{i:0;s:3:\\"jpg\\";}s:3:\\"fit\\";a:3:{i:0;E:27:\\"Spatie\\\\Image\\\\Enums\\\\Fit:Crop\\";i:1;i:600;i:2;i:600;}}}s:23:\\"\\u0000*\\u0000performOnCollections\\";a:0:{}s:17:\\"\\u0000*\\u0000performOnQueue\\";b:1;s:26:\\"\\u0000*\\u0000keepOriginalImageFormat\\";b:0;s:27:\\"\\u0000*\\u0000generateResponsiveImages\\";b:0;s:18:\\"\\u0000*\\u0000widthCalculator\\";N;s:24:\\"\\u0000*\\u0000loadingAttributeValue\\";N;s:16:\\"\\u0000*\\u0000pdfPageNumber\\";i:1;s:7:\\"\\u0000*\\u0000name\\";s:5:\\"thumb\\";}i:1;O:42:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\":11:{s:12:\\"\\u0000*\\u0000fileNamer\\";O:54:\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\":0:{}s:28:\\"\\u0000*\\u0000extractVideoFrameAtSecond\\";d:0;s:16:\\"\\u0000*\\u0000manipulations\\";O:45:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Manipulations\\":1:{s:16:\\"\\u0000*\\u0000manipulations\\";a:3:{s:8:\\"optimize\\";a:1:{i:0;O:36:\\"Spatie\\\\ImageOptimizer\\\\OptimizerChain\\":3:{s:13:\\"\\u0000*\\u0000optimizers\\";a:7:{i:0;O:42:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Jpegoptim\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m85\\";i:1;s:7:\\"--force\\";i:2;s:11:\\"--strip-all\\";i:3;s:17:\\"--all-progressive\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:9:\\"jpegoptim\\";}i:1;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Pngquant\\":5:{s:7:\\"options\\";a:1:{i:0;s:7:\\"--force\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"pngquant\\";}i:2;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Optipng\\":5:{s:7:\\"options\\";a:3:{i:0;s:3:\\"-i0\\";i:1;s:3:\\"-o2\\";i:2;s:6:\\"-quiet\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"optipng\\";}i:3;O:37:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Svgo\\":5:{s:7:\\"options\\";a:1:{i:0;s:20:\\"--disable=cleanupIDs\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:4:\\"svgo\\";}i:4;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Gifsicle\\":5:{s:7:\\"options\\";a:2:{i:0;s:2:\\"-b\\";i:1;s:3:\\"-O3\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"gifsicle\\";}i:5;O:38:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Cwebp\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m 6\\";i:1;s:8:\\"-pass 10\\";i:2;s:3:\\"-mt\\";i:3;s:5:\\"-q 90\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:5:\\"cwebp\\";}i:6;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Avifenc\\":6:{s:7:\\"options\\";a:8:{i:0;s:14:\\"-a cq-level=23\\";i:1;s:6:\\"-j all\\";i:2;s:7:\\"--min 0\\";i:3;s:8:\\"--max 63\\";i:4;s:12:\\"--minalpha 0\\";i:5;s:13:\\"--maxalpha 63\\";i:6;s:14:\\"-a end-usage=q\\";i:7;s:12:\\"-a tune=ssim\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"avifenc\\";s:16:\\"decodeBinaryName\\";s:7:\\"avifdec\\";}}s:9:\\"\\u0000*\\u0000logger\\";O:33:\\"Spatie\\\\ImageOptimizer\\\\DummyLogger\\":0:{}s:10:\\"\\u0000*\\u0000timeout\\";i:60;}}s:6:\\"format\\";a:1:{i:0;s:3:\\"jpg\\";}s:3:\\"fit\\";a:3:{i:0;r:83;i:1;i:400;i:2;i:400;}}}s:23:\\"\\u0000*\\u0000performOnCollections\\";a:0:{}s:17:\\"\\u0000*\\u0000performOnQueue\\";b:1;s:26:\\"\\u0000*\\u0000keepOriginalImageFormat\\";b:0;s:27:\\"\\u0000*\\u0000generateResponsiveImages\\";b:0;s:18:\\"\\u0000*\\u0000widthCalculator\\";N;s:24:\\"\\u0000*\\u0000loadingAttributeValue\\";N;s:16:\\"\\u0000*\\u0000pdfPageNumber\\";i:1;s:7:\\"\\u0000*\\u0000name\\";s:4:\\"icon\\";}}s:28:\\"\\u0000*\\u0000escapeWhenCastingToString\\";b:0;}s:8:\\"\\u0000*\\u0000media\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":5:{s:5:\\"class\\";s:49:\\"Spatie\\\\MediaLibrary\\\\MediaCollections\\\\Models\\\\Media\\";s:2:\\"id\\";i:4;s:9:\\"relations\\";a:0:{}s:10:\\"connection\\";s:5:\\"pgsql\\";s:15:\\"collectionClass\\";N;}s:14:\\"\\u0000*\\u0000onlyMissing\\";b:0;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:0:\\"\\";}"}}	0	\N	1720595107	1720595107
5	default	{"uuid":"06e8e1b7-f8c5-4f67-8be5-6a0ee5477e94","displayName":"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob","command":"O:58:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\\":5:{s:14:\\"\\u0000*\\u0000conversions\\";O:52:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\ConversionCollection\\":2:{s:8:\\"\\u0000*\\u0000items\\";a:2:{i:0;O:42:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\":11:{s:12:\\"\\u0000*\\u0000fileNamer\\";O:54:\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\":0:{}s:28:\\"\\u0000*\\u0000extractVideoFrameAtSecond\\";d:0;s:16:\\"\\u0000*\\u0000manipulations\\";O:45:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Manipulations\\":1:{s:16:\\"\\u0000*\\u0000manipulations\\";a:3:{s:8:\\"optimize\\";a:1:{i:0;O:36:\\"Spatie\\\\ImageOptimizer\\\\OptimizerChain\\":3:{s:13:\\"\\u0000*\\u0000optimizers\\";a:7:{i:0;O:42:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Jpegoptim\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m85\\";i:1;s:7:\\"--force\\";i:2;s:11:\\"--strip-all\\";i:3;s:17:\\"--all-progressive\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:9:\\"jpegoptim\\";}i:1;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Pngquant\\":5:{s:7:\\"options\\";a:1:{i:0;s:7:\\"--force\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"pngquant\\";}i:2;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Optipng\\":5:{s:7:\\"options\\";a:3:{i:0;s:3:\\"-i0\\";i:1;s:3:\\"-o2\\";i:2;s:6:\\"-quiet\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"optipng\\";}i:3;O:37:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Svgo\\":5:{s:7:\\"options\\";a:1:{i:0;s:20:\\"--disable=cleanupIDs\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:4:\\"svgo\\";}i:4;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Gifsicle\\":5:{s:7:\\"options\\";a:2:{i:0;s:2:\\"-b\\";i:1;s:3:\\"-O3\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"gifsicle\\";}i:5;O:38:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Cwebp\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m 6\\";i:1;s:8:\\"-pass 10\\";i:2;s:3:\\"-mt\\";i:3;s:5:\\"-q 90\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:5:\\"cwebp\\";}i:6;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Avifenc\\":6:{s:7:\\"options\\";a:8:{i:0;s:14:\\"-a cq-level=23\\";i:1;s:6:\\"-j all\\";i:2;s:7:\\"--min 0\\";i:3;s:8:\\"--max 63\\";i:4;s:12:\\"--minalpha 0\\";i:5;s:13:\\"--maxalpha 63\\";i:6;s:14:\\"-a end-usage=q\\";i:7;s:12:\\"-a tune=ssim\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"avifenc\\";s:16:\\"decodeBinaryName\\";s:7:\\"avifdec\\";}}s:9:\\"\\u0000*\\u0000logger\\";O:33:\\"Spatie\\\\ImageOptimizer\\\\DummyLogger\\":0:{}s:10:\\"\\u0000*\\u0000timeout\\";i:60;}}s:6:\\"format\\";a:1:{i:0;s:3:\\"jpg\\";}s:3:\\"fit\\";a:3:{i:0;E:27:\\"Spatie\\\\Image\\\\Enums\\\\Fit:Crop\\";i:1;i:600;i:2;i:600;}}}s:23:\\"\\u0000*\\u0000performOnCollections\\";a:0:{}s:17:\\"\\u0000*\\u0000performOnQueue\\";b:1;s:26:\\"\\u0000*\\u0000keepOriginalImageFormat\\";b:0;s:27:\\"\\u0000*\\u0000generateResponsiveImages\\";b:0;s:18:\\"\\u0000*\\u0000widthCalculator\\";N;s:24:\\"\\u0000*\\u0000loadingAttributeValue\\";N;s:16:\\"\\u0000*\\u0000pdfPageNumber\\";i:1;s:7:\\"\\u0000*\\u0000name\\";s:5:\\"thumb\\";}i:1;O:42:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\":11:{s:12:\\"\\u0000*\\u0000fileNamer\\";O:54:\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\":0:{}s:28:\\"\\u0000*\\u0000extractVideoFrameAtSecond\\";d:0;s:16:\\"\\u0000*\\u0000manipulations\\";O:45:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Manipulations\\":1:{s:16:\\"\\u0000*\\u0000manipulations\\";a:3:{s:8:\\"optimize\\";a:1:{i:0;O:36:\\"Spatie\\\\ImageOptimizer\\\\OptimizerChain\\":3:{s:13:\\"\\u0000*\\u0000optimizers\\";a:7:{i:0;O:42:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Jpegoptim\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m85\\";i:1;s:7:\\"--force\\";i:2;s:11:\\"--strip-all\\";i:3;s:17:\\"--all-progressive\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:9:\\"jpegoptim\\";}i:1;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Pngquant\\":5:{s:7:\\"options\\";a:1:{i:0;s:7:\\"--force\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"pngquant\\";}i:2;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Optipng\\":5:{s:7:\\"options\\";a:3:{i:0;s:3:\\"-i0\\";i:1;s:3:\\"-o2\\";i:2;s:6:\\"-quiet\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"optipng\\";}i:3;O:37:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Svgo\\":5:{s:7:\\"options\\";a:1:{i:0;s:20:\\"--disable=cleanupIDs\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:4:\\"svgo\\";}i:4;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Gifsicle\\":5:{s:7:\\"options\\";a:2:{i:0;s:2:\\"-b\\";i:1;s:3:\\"-O3\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"gifsicle\\";}i:5;O:38:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Cwebp\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m 6\\";i:1;s:8:\\"-pass 10\\";i:2;s:3:\\"-mt\\";i:3;s:5:\\"-q 90\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:5:\\"cwebp\\";}i:6;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Avifenc\\":6:{s:7:\\"options\\";a:8:{i:0;s:14:\\"-a cq-level=23\\";i:1;s:6:\\"-j all\\";i:2;s:7:\\"--min 0\\";i:3;s:8:\\"--max 63\\";i:4;s:12:\\"--minalpha 0\\";i:5;s:13:\\"--maxalpha 63\\";i:6;s:14:\\"-a end-usage=q\\";i:7;s:12:\\"-a tune=ssim\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"avifenc\\";s:16:\\"decodeBinaryName\\";s:7:\\"avifdec\\";}}s:9:\\"\\u0000*\\u0000logger\\";O:33:\\"Spatie\\\\ImageOptimizer\\\\DummyLogger\\":0:{}s:10:\\"\\u0000*\\u0000timeout\\";i:60;}}s:6:\\"format\\";a:1:{i:0;s:3:\\"jpg\\";}s:3:\\"fit\\";a:3:{i:0;r:83;i:1;i:400;i:2;i:400;}}}s:23:\\"\\u0000*\\u0000performOnCollections\\";a:0:{}s:17:\\"\\u0000*\\u0000performOnQueue\\";b:1;s:26:\\"\\u0000*\\u0000keepOriginalImageFormat\\";b:0;s:27:\\"\\u0000*\\u0000generateResponsiveImages\\";b:0;s:18:\\"\\u0000*\\u0000widthCalculator\\";N;s:24:\\"\\u0000*\\u0000loadingAttributeValue\\";N;s:16:\\"\\u0000*\\u0000pdfPageNumber\\";i:1;s:7:\\"\\u0000*\\u0000name\\";s:4:\\"icon\\";}}s:28:\\"\\u0000*\\u0000escapeWhenCastingToString\\";b:0;}s:8:\\"\\u0000*\\u0000media\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":5:{s:5:\\"class\\";s:49:\\"Spatie\\\\MediaLibrary\\\\MediaCollections\\\\Models\\\\Media\\";s:2:\\"id\\";i:5;s:9:\\"relations\\";a:0:{}s:10:\\"connection\\";s:5:\\"pgsql\\";s:15:\\"collectionClass\\";N;}s:14:\\"\\u0000*\\u0000onlyMissing\\";b:0;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:0:\\"\\";}"}}	0	\N	1720596983	1720596983
6	default	{"uuid":"09f02fd4-aaea-4ad7-b97b-4c73afcd7019","displayName":"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob","command":"O:58:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\\":5:{s:14:\\"\\u0000*\\u0000conversions\\";O:52:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\ConversionCollection\\":2:{s:8:\\"\\u0000*\\u0000items\\";a:2:{i:0;O:42:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\":11:{s:12:\\"\\u0000*\\u0000fileNamer\\";O:54:\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\":0:{}s:28:\\"\\u0000*\\u0000extractVideoFrameAtSecond\\";d:0;s:16:\\"\\u0000*\\u0000manipulations\\";O:45:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Manipulations\\":1:{s:16:\\"\\u0000*\\u0000manipulations\\";a:3:{s:8:\\"optimize\\";a:1:{i:0;O:36:\\"Spatie\\\\ImageOptimizer\\\\OptimizerChain\\":3:{s:13:\\"\\u0000*\\u0000optimizers\\";a:7:{i:0;O:42:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Jpegoptim\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m85\\";i:1;s:7:\\"--force\\";i:2;s:11:\\"--strip-all\\";i:3;s:17:\\"--all-progressive\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:9:\\"jpegoptim\\";}i:1;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Pngquant\\":5:{s:7:\\"options\\";a:1:{i:0;s:7:\\"--force\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"pngquant\\";}i:2;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Optipng\\":5:{s:7:\\"options\\";a:3:{i:0;s:3:\\"-i0\\";i:1;s:3:\\"-o2\\";i:2;s:6:\\"-quiet\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"optipng\\";}i:3;O:37:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Svgo\\":5:{s:7:\\"options\\";a:1:{i:0;s:20:\\"--disable=cleanupIDs\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:4:\\"svgo\\";}i:4;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Gifsicle\\":5:{s:7:\\"options\\";a:2:{i:0;s:2:\\"-b\\";i:1;s:3:\\"-O3\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"gifsicle\\";}i:5;O:38:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Cwebp\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m 6\\";i:1;s:8:\\"-pass 10\\";i:2;s:3:\\"-mt\\";i:3;s:5:\\"-q 90\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:5:\\"cwebp\\";}i:6;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Avifenc\\":6:{s:7:\\"options\\";a:8:{i:0;s:14:\\"-a cq-level=23\\";i:1;s:6:\\"-j all\\";i:2;s:7:\\"--min 0\\";i:3;s:8:\\"--max 63\\";i:4;s:12:\\"--minalpha 0\\";i:5;s:13:\\"--maxalpha 63\\";i:6;s:14:\\"-a end-usage=q\\";i:7;s:12:\\"-a tune=ssim\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"avifenc\\";s:16:\\"decodeBinaryName\\";s:7:\\"avifdec\\";}}s:9:\\"\\u0000*\\u0000logger\\";O:33:\\"Spatie\\\\ImageOptimizer\\\\DummyLogger\\":0:{}s:10:\\"\\u0000*\\u0000timeout\\";i:60;}}s:6:\\"format\\";a:1:{i:0;s:3:\\"jpg\\";}s:3:\\"fit\\";a:3:{i:0;E:27:\\"Spatie\\\\Image\\\\Enums\\\\Fit:Crop\\";i:1;i:600;i:2;i:600;}}}s:23:\\"\\u0000*\\u0000performOnCollections\\";a:0:{}s:17:\\"\\u0000*\\u0000performOnQueue\\";b:1;s:26:\\"\\u0000*\\u0000keepOriginalImageFormat\\";b:0;s:27:\\"\\u0000*\\u0000generateResponsiveImages\\";b:0;s:18:\\"\\u0000*\\u0000widthCalculator\\";N;s:24:\\"\\u0000*\\u0000loadingAttributeValue\\";N;s:16:\\"\\u0000*\\u0000pdfPageNumber\\";i:1;s:7:\\"\\u0000*\\u0000name\\";s:5:\\"thumb\\";}i:1;O:42:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\":11:{s:12:\\"\\u0000*\\u0000fileNamer\\";O:54:\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\":0:{}s:28:\\"\\u0000*\\u0000extractVideoFrameAtSecond\\";d:0;s:16:\\"\\u0000*\\u0000manipulations\\";O:45:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Manipulations\\":1:{s:16:\\"\\u0000*\\u0000manipulations\\";a:3:{s:8:\\"optimize\\";a:1:{i:0;O:36:\\"Spatie\\\\ImageOptimizer\\\\OptimizerChain\\":3:{s:13:\\"\\u0000*\\u0000optimizers\\";a:7:{i:0;O:42:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Jpegoptim\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m85\\";i:1;s:7:\\"--force\\";i:2;s:11:\\"--strip-all\\";i:3;s:17:\\"--all-progressive\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:9:\\"jpegoptim\\";}i:1;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Pngquant\\":5:{s:7:\\"options\\";a:1:{i:0;s:7:\\"--force\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"pngquant\\";}i:2;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Optipng\\":5:{s:7:\\"options\\";a:3:{i:0;s:3:\\"-i0\\";i:1;s:3:\\"-o2\\";i:2;s:6:\\"-quiet\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"optipng\\";}i:3;O:37:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Svgo\\":5:{s:7:\\"options\\";a:1:{i:0;s:20:\\"--disable=cleanupIDs\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:4:\\"svgo\\";}i:4;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Gifsicle\\":5:{s:7:\\"options\\";a:2:{i:0;s:2:\\"-b\\";i:1;s:3:\\"-O3\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"gifsicle\\";}i:5;O:38:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Cwebp\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m 6\\";i:1;s:8:\\"-pass 10\\";i:2;s:3:\\"-mt\\";i:3;s:5:\\"-q 90\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:5:\\"cwebp\\";}i:6;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Avifenc\\":6:{s:7:\\"options\\";a:8:{i:0;s:14:\\"-a cq-level=23\\";i:1;s:6:\\"-j all\\";i:2;s:7:\\"--min 0\\";i:3;s:8:\\"--max 63\\";i:4;s:12:\\"--minalpha 0\\";i:5;s:13:\\"--maxalpha 63\\";i:6;s:14:\\"-a end-usage=q\\";i:7;s:12:\\"-a tune=ssim\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"avifenc\\";s:16:\\"decodeBinaryName\\";s:7:\\"avifdec\\";}}s:9:\\"\\u0000*\\u0000logger\\";O:33:\\"Spatie\\\\ImageOptimizer\\\\DummyLogger\\":0:{}s:10:\\"\\u0000*\\u0000timeout\\";i:60;}}s:6:\\"format\\";a:1:{i:0;s:3:\\"jpg\\";}s:3:\\"fit\\";a:3:{i:0;r:83;i:1;i:400;i:2;i:400;}}}s:23:\\"\\u0000*\\u0000performOnCollections\\";a:0:{}s:17:\\"\\u0000*\\u0000performOnQueue\\";b:1;s:26:\\"\\u0000*\\u0000keepOriginalImageFormat\\";b:0;s:27:\\"\\u0000*\\u0000generateResponsiveImages\\";b:0;s:18:\\"\\u0000*\\u0000widthCalculator\\";N;s:24:\\"\\u0000*\\u0000loadingAttributeValue\\";N;s:16:\\"\\u0000*\\u0000pdfPageNumber\\";i:1;s:7:\\"\\u0000*\\u0000name\\";s:4:\\"icon\\";}}s:28:\\"\\u0000*\\u0000escapeWhenCastingToString\\";b:0;}s:8:\\"\\u0000*\\u0000media\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":5:{s:5:\\"class\\";s:49:\\"Spatie\\\\MediaLibrary\\\\MediaCollections\\\\Models\\\\Media\\";s:2:\\"id\\";i:6;s:9:\\"relations\\";a:0:{}s:10:\\"connection\\";s:5:\\"pgsql\\";s:15:\\"collectionClass\\";N;}s:14:\\"\\u0000*\\u0000onlyMissing\\";b:0;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:0:\\"\\";}"}}	0	\N	1720597043	1720597043
7	default	{"uuid":"8bc57e2a-a69c-4a71-9fd3-a6c177c53f1a","displayName":"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob","command":"O:58:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\\":5:{s:14:\\"\\u0000*\\u0000conversions\\";O:52:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\ConversionCollection\\":2:{s:8:\\"\\u0000*\\u0000items\\";a:2:{i:0;O:42:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\":11:{s:12:\\"\\u0000*\\u0000fileNamer\\";O:54:\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\":0:{}s:28:\\"\\u0000*\\u0000extractVideoFrameAtSecond\\";d:0;s:16:\\"\\u0000*\\u0000manipulations\\";O:45:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Manipulations\\":1:{s:16:\\"\\u0000*\\u0000manipulations\\";a:3:{s:8:\\"optimize\\";a:1:{i:0;O:36:\\"Spatie\\\\ImageOptimizer\\\\OptimizerChain\\":3:{s:13:\\"\\u0000*\\u0000optimizers\\";a:7:{i:0;O:42:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Jpegoptim\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m85\\";i:1;s:7:\\"--force\\";i:2;s:11:\\"--strip-all\\";i:3;s:17:\\"--all-progressive\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:9:\\"jpegoptim\\";}i:1;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Pngquant\\":5:{s:7:\\"options\\";a:1:{i:0;s:7:\\"--force\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"pngquant\\";}i:2;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Optipng\\":5:{s:7:\\"options\\";a:3:{i:0;s:3:\\"-i0\\";i:1;s:3:\\"-o2\\";i:2;s:6:\\"-quiet\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"optipng\\";}i:3;O:37:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Svgo\\":5:{s:7:\\"options\\";a:1:{i:0;s:20:\\"--disable=cleanupIDs\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:4:\\"svgo\\";}i:4;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Gifsicle\\":5:{s:7:\\"options\\";a:2:{i:0;s:2:\\"-b\\";i:1;s:3:\\"-O3\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"gifsicle\\";}i:5;O:38:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Cwebp\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m 6\\";i:1;s:8:\\"-pass 10\\";i:2;s:3:\\"-mt\\";i:3;s:5:\\"-q 90\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:5:\\"cwebp\\";}i:6;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Avifenc\\":6:{s:7:\\"options\\";a:8:{i:0;s:14:\\"-a cq-level=23\\";i:1;s:6:\\"-j all\\";i:2;s:7:\\"--min 0\\";i:3;s:8:\\"--max 63\\";i:4;s:12:\\"--minalpha 0\\";i:5;s:13:\\"--maxalpha 63\\";i:6;s:14:\\"-a end-usage=q\\";i:7;s:12:\\"-a tune=ssim\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"avifenc\\";s:16:\\"decodeBinaryName\\";s:7:\\"avifdec\\";}}s:9:\\"\\u0000*\\u0000logger\\";O:33:\\"Spatie\\\\ImageOptimizer\\\\DummyLogger\\":0:{}s:10:\\"\\u0000*\\u0000timeout\\";i:60;}}s:6:\\"format\\";a:1:{i:0;s:3:\\"jpg\\";}s:3:\\"fit\\";a:3:{i:0;E:27:\\"Spatie\\\\Image\\\\Enums\\\\Fit:Crop\\";i:1;i:600;i:2;i:600;}}}s:23:\\"\\u0000*\\u0000performOnCollections\\";a:0:{}s:17:\\"\\u0000*\\u0000performOnQueue\\";b:1;s:26:\\"\\u0000*\\u0000keepOriginalImageFormat\\";b:0;s:27:\\"\\u0000*\\u0000generateResponsiveImages\\";b:0;s:18:\\"\\u0000*\\u0000widthCalculator\\";N;s:24:\\"\\u0000*\\u0000loadingAttributeValue\\";N;s:16:\\"\\u0000*\\u0000pdfPageNumber\\";i:1;s:7:\\"\\u0000*\\u0000name\\";s:5:\\"thumb\\";}i:1;O:42:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\":11:{s:12:\\"\\u0000*\\u0000fileNamer\\";O:54:\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\":0:{}s:28:\\"\\u0000*\\u0000extractVideoFrameAtSecond\\";d:0;s:16:\\"\\u0000*\\u0000manipulations\\";O:45:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Manipulations\\":1:{s:16:\\"\\u0000*\\u0000manipulations\\";a:3:{s:8:\\"optimize\\";a:1:{i:0;O:36:\\"Spatie\\\\ImageOptimizer\\\\OptimizerChain\\":3:{s:13:\\"\\u0000*\\u0000optimizers\\";a:7:{i:0;O:42:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Jpegoptim\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m85\\";i:1;s:7:\\"--force\\";i:2;s:11:\\"--strip-all\\";i:3;s:17:\\"--all-progressive\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:9:\\"jpegoptim\\";}i:1;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Pngquant\\":5:{s:7:\\"options\\";a:1:{i:0;s:7:\\"--force\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"pngquant\\";}i:2;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Optipng\\":5:{s:7:\\"options\\";a:3:{i:0;s:3:\\"-i0\\";i:1;s:3:\\"-o2\\";i:2;s:6:\\"-quiet\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"optipng\\";}i:3;O:37:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Svgo\\":5:{s:7:\\"options\\";a:1:{i:0;s:20:\\"--disable=cleanupIDs\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:4:\\"svgo\\";}i:4;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Gifsicle\\":5:{s:7:\\"options\\";a:2:{i:0;s:2:\\"-b\\";i:1;s:3:\\"-O3\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"gifsicle\\";}i:5;O:38:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Cwebp\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m 6\\";i:1;s:8:\\"-pass 10\\";i:2;s:3:\\"-mt\\";i:3;s:5:\\"-q 90\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:5:\\"cwebp\\";}i:6;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Avifenc\\":6:{s:7:\\"options\\";a:8:{i:0;s:14:\\"-a cq-level=23\\";i:1;s:6:\\"-j all\\";i:2;s:7:\\"--min 0\\";i:3;s:8:\\"--max 63\\";i:4;s:12:\\"--minalpha 0\\";i:5;s:13:\\"--maxalpha 63\\";i:6;s:14:\\"-a end-usage=q\\";i:7;s:12:\\"-a tune=ssim\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"avifenc\\";s:16:\\"decodeBinaryName\\";s:7:\\"avifdec\\";}}s:9:\\"\\u0000*\\u0000logger\\";O:33:\\"Spatie\\\\ImageOptimizer\\\\DummyLogger\\":0:{}s:10:\\"\\u0000*\\u0000timeout\\";i:60;}}s:6:\\"format\\";a:1:{i:0;s:3:\\"jpg\\";}s:3:\\"fit\\";a:3:{i:0;r:83;i:1;i:400;i:2;i:400;}}}s:23:\\"\\u0000*\\u0000performOnCollections\\";a:0:{}s:17:\\"\\u0000*\\u0000performOnQueue\\";b:1;s:26:\\"\\u0000*\\u0000keepOriginalImageFormat\\";b:0;s:27:\\"\\u0000*\\u0000generateResponsiveImages\\";b:0;s:18:\\"\\u0000*\\u0000widthCalculator\\";N;s:24:\\"\\u0000*\\u0000loadingAttributeValue\\";N;s:16:\\"\\u0000*\\u0000pdfPageNumber\\";i:1;s:7:\\"\\u0000*\\u0000name\\";s:4:\\"icon\\";}}s:28:\\"\\u0000*\\u0000escapeWhenCastingToString\\";b:0;}s:8:\\"\\u0000*\\u0000media\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":5:{s:5:\\"class\\";s:49:\\"Spatie\\\\MediaLibrary\\\\MediaCollections\\\\Models\\\\Media\\";s:2:\\"id\\";i:7;s:9:\\"relations\\";a:0:{}s:10:\\"connection\\";s:5:\\"pgsql\\";s:15:\\"collectionClass\\";N;}s:14:\\"\\u0000*\\u0000onlyMissing\\";b:0;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:0:\\"\\";}"}}	0	\N	1720597727	1720597727
8	default	{"uuid":"7d0933f8-ce23-4eac-ae96-a6ab48074169","displayName":"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob","command":"O:58:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\\":5:{s:14:\\"\\u0000*\\u0000conversions\\";O:52:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\ConversionCollection\\":2:{s:8:\\"\\u0000*\\u0000items\\";a:2:{i:0;O:42:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\":11:{s:12:\\"\\u0000*\\u0000fileNamer\\";O:54:\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\":0:{}s:28:\\"\\u0000*\\u0000extractVideoFrameAtSecond\\";d:0;s:16:\\"\\u0000*\\u0000manipulations\\";O:45:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Manipulations\\":1:{s:16:\\"\\u0000*\\u0000manipulations\\";a:3:{s:8:\\"optimize\\";a:1:{i:0;O:36:\\"Spatie\\\\ImageOptimizer\\\\OptimizerChain\\":3:{s:13:\\"\\u0000*\\u0000optimizers\\";a:7:{i:0;O:42:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Jpegoptim\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m85\\";i:1;s:7:\\"--force\\";i:2;s:11:\\"--strip-all\\";i:3;s:17:\\"--all-progressive\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:9:\\"jpegoptim\\";}i:1;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Pngquant\\":5:{s:7:\\"options\\";a:1:{i:0;s:7:\\"--force\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"pngquant\\";}i:2;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Optipng\\":5:{s:7:\\"options\\";a:3:{i:0;s:3:\\"-i0\\";i:1;s:3:\\"-o2\\";i:2;s:6:\\"-quiet\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"optipng\\";}i:3;O:37:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Svgo\\":5:{s:7:\\"options\\";a:1:{i:0;s:20:\\"--disable=cleanupIDs\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:4:\\"svgo\\";}i:4;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Gifsicle\\":5:{s:7:\\"options\\";a:2:{i:0;s:2:\\"-b\\";i:1;s:3:\\"-O3\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"gifsicle\\";}i:5;O:38:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Cwebp\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m 6\\";i:1;s:8:\\"-pass 10\\";i:2;s:3:\\"-mt\\";i:3;s:5:\\"-q 90\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:5:\\"cwebp\\";}i:6;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Avifenc\\":6:{s:7:\\"options\\";a:8:{i:0;s:14:\\"-a cq-level=23\\";i:1;s:6:\\"-j all\\";i:2;s:7:\\"--min 0\\";i:3;s:8:\\"--max 63\\";i:4;s:12:\\"--minalpha 0\\";i:5;s:13:\\"--maxalpha 63\\";i:6;s:14:\\"-a end-usage=q\\";i:7;s:12:\\"-a tune=ssim\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"avifenc\\";s:16:\\"decodeBinaryName\\";s:7:\\"avifdec\\";}}s:9:\\"\\u0000*\\u0000logger\\";O:33:\\"Spatie\\\\ImageOptimizer\\\\DummyLogger\\":0:{}s:10:\\"\\u0000*\\u0000timeout\\";i:60;}}s:6:\\"format\\";a:1:{i:0;s:3:\\"jpg\\";}s:3:\\"fit\\";a:3:{i:0;E:27:\\"Spatie\\\\Image\\\\Enums\\\\Fit:Crop\\";i:1;i:600;i:2;i:600;}}}s:23:\\"\\u0000*\\u0000performOnCollections\\";a:0:{}s:17:\\"\\u0000*\\u0000performOnQueue\\";b:1;s:26:\\"\\u0000*\\u0000keepOriginalImageFormat\\";b:0;s:27:\\"\\u0000*\\u0000generateResponsiveImages\\";b:0;s:18:\\"\\u0000*\\u0000widthCalculator\\";N;s:24:\\"\\u0000*\\u0000loadingAttributeValue\\";N;s:16:\\"\\u0000*\\u0000pdfPageNumber\\";i:1;s:7:\\"\\u0000*\\u0000name\\";s:5:\\"thumb\\";}i:1;O:42:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\":11:{s:12:\\"\\u0000*\\u0000fileNamer\\";O:54:\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\":0:{}s:28:\\"\\u0000*\\u0000extractVideoFrameAtSecond\\";d:0;s:16:\\"\\u0000*\\u0000manipulations\\";O:45:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Manipulations\\":1:{s:16:\\"\\u0000*\\u0000manipulations\\";a:3:{s:8:\\"optimize\\";a:1:{i:0;O:36:\\"Spatie\\\\ImageOptimizer\\\\OptimizerChain\\":3:{s:13:\\"\\u0000*\\u0000optimizers\\";a:7:{i:0;O:42:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Jpegoptim\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m85\\";i:1;s:7:\\"--force\\";i:2;s:11:\\"--strip-all\\";i:3;s:17:\\"--all-progressive\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:9:\\"jpegoptim\\";}i:1;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Pngquant\\":5:{s:7:\\"options\\";a:1:{i:0;s:7:\\"--force\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"pngquant\\";}i:2;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Optipng\\":5:{s:7:\\"options\\";a:3:{i:0;s:3:\\"-i0\\";i:1;s:3:\\"-o2\\";i:2;s:6:\\"-quiet\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"optipng\\";}i:3;O:37:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Svgo\\":5:{s:7:\\"options\\";a:1:{i:0;s:20:\\"--disable=cleanupIDs\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:4:\\"svgo\\";}i:4;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Gifsicle\\":5:{s:7:\\"options\\";a:2:{i:0;s:2:\\"-b\\";i:1;s:3:\\"-O3\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"gifsicle\\";}i:5;O:38:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Cwebp\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m 6\\";i:1;s:8:\\"-pass 10\\";i:2;s:3:\\"-mt\\";i:3;s:5:\\"-q 90\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:5:\\"cwebp\\";}i:6;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Avifenc\\":6:{s:7:\\"options\\";a:8:{i:0;s:14:\\"-a cq-level=23\\";i:1;s:6:\\"-j all\\";i:2;s:7:\\"--min 0\\";i:3;s:8:\\"--max 63\\";i:4;s:12:\\"--minalpha 0\\";i:5;s:13:\\"--maxalpha 63\\";i:6;s:14:\\"-a end-usage=q\\";i:7;s:12:\\"-a tune=ssim\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"avifenc\\";s:16:\\"decodeBinaryName\\";s:7:\\"avifdec\\";}}s:9:\\"\\u0000*\\u0000logger\\";O:33:\\"Spatie\\\\ImageOptimizer\\\\DummyLogger\\":0:{}s:10:\\"\\u0000*\\u0000timeout\\";i:60;}}s:6:\\"format\\";a:1:{i:0;s:3:\\"jpg\\";}s:3:\\"fit\\";a:3:{i:0;r:83;i:1;i:400;i:2;i:400;}}}s:23:\\"\\u0000*\\u0000performOnCollections\\";a:0:{}s:17:\\"\\u0000*\\u0000performOnQueue\\";b:1;s:26:\\"\\u0000*\\u0000keepOriginalImageFormat\\";b:0;s:27:\\"\\u0000*\\u0000generateResponsiveImages\\";b:0;s:18:\\"\\u0000*\\u0000widthCalculator\\";N;s:24:\\"\\u0000*\\u0000loadingAttributeValue\\";N;s:16:\\"\\u0000*\\u0000pdfPageNumber\\";i:1;s:7:\\"\\u0000*\\u0000name\\";s:4:\\"icon\\";}}s:28:\\"\\u0000*\\u0000escapeWhenCastingToString\\";b:0;}s:8:\\"\\u0000*\\u0000media\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":5:{s:5:\\"class\\";s:49:\\"Spatie\\\\MediaLibrary\\\\MediaCollections\\\\Models\\\\Media\\";s:2:\\"id\\";i:8;s:9:\\"relations\\";a:0:{}s:10:\\"connection\\";s:5:\\"pgsql\\";s:15:\\"collectionClass\\";N;}s:14:\\"\\u0000*\\u0000onlyMissing\\";b:0;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:0:\\"\\";}"}}	0	\N	1720597804	1720597804
9	default	{"uuid":"59115175-2007-475c-a5eb-c9d84e4492d1","displayName":"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob","command":"O:58:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\\":5:{s:14:\\"\\u0000*\\u0000conversions\\";O:52:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\ConversionCollection\\":2:{s:8:\\"\\u0000*\\u0000items\\";a:2:{i:0;O:42:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\":11:{s:12:\\"\\u0000*\\u0000fileNamer\\";O:54:\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\":0:{}s:28:\\"\\u0000*\\u0000extractVideoFrameAtSecond\\";d:0;s:16:\\"\\u0000*\\u0000manipulations\\";O:45:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Manipulations\\":1:{s:16:\\"\\u0000*\\u0000manipulations\\";a:3:{s:8:\\"optimize\\";a:1:{i:0;O:36:\\"Spatie\\\\ImageOptimizer\\\\OptimizerChain\\":3:{s:13:\\"\\u0000*\\u0000optimizers\\";a:7:{i:0;O:42:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Jpegoptim\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m85\\";i:1;s:7:\\"--force\\";i:2;s:11:\\"--strip-all\\";i:3;s:17:\\"--all-progressive\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:9:\\"jpegoptim\\";}i:1;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Pngquant\\":5:{s:7:\\"options\\";a:1:{i:0;s:7:\\"--force\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"pngquant\\";}i:2;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Optipng\\":5:{s:7:\\"options\\";a:3:{i:0;s:3:\\"-i0\\";i:1;s:3:\\"-o2\\";i:2;s:6:\\"-quiet\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"optipng\\";}i:3;O:37:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Svgo\\":5:{s:7:\\"options\\";a:1:{i:0;s:20:\\"--disable=cleanupIDs\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:4:\\"svgo\\";}i:4;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Gifsicle\\":5:{s:7:\\"options\\";a:2:{i:0;s:2:\\"-b\\";i:1;s:3:\\"-O3\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"gifsicle\\";}i:5;O:38:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Cwebp\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m 6\\";i:1;s:8:\\"-pass 10\\";i:2;s:3:\\"-mt\\";i:3;s:5:\\"-q 90\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:5:\\"cwebp\\";}i:6;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Avifenc\\":6:{s:7:\\"options\\";a:8:{i:0;s:14:\\"-a cq-level=23\\";i:1;s:6:\\"-j all\\";i:2;s:7:\\"--min 0\\";i:3;s:8:\\"--max 63\\";i:4;s:12:\\"--minalpha 0\\";i:5;s:13:\\"--maxalpha 63\\";i:6;s:14:\\"-a end-usage=q\\";i:7;s:12:\\"-a tune=ssim\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"avifenc\\";s:16:\\"decodeBinaryName\\";s:7:\\"avifdec\\";}}s:9:\\"\\u0000*\\u0000logger\\";O:33:\\"Spatie\\\\ImageOptimizer\\\\DummyLogger\\":0:{}s:10:\\"\\u0000*\\u0000timeout\\";i:60;}}s:6:\\"format\\";a:1:{i:0;s:3:\\"jpg\\";}s:3:\\"fit\\";a:3:{i:0;E:27:\\"Spatie\\\\Image\\\\Enums\\\\Fit:Crop\\";i:1;i:600;i:2;i:600;}}}s:23:\\"\\u0000*\\u0000performOnCollections\\";a:0:{}s:17:\\"\\u0000*\\u0000performOnQueue\\";b:1;s:26:\\"\\u0000*\\u0000keepOriginalImageFormat\\";b:0;s:27:\\"\\u0000*\\u0000generateResponsiveImages\\";b:0;s:18:\\"\\u0000*\\u0000widthCalculator\\";N;s:24:\\"\\u0000*\\u0000loadingAttributeValue\\";N;s:16:\\"\\u0000*\\u0000pdfPageNumber\\";i:1;s:7:\\"\\u0000*\\u0000name\\";s:5:\\"thumb\\";}i:1;O:42:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\":11:{s:12:\\"\\u0000*\\u0000fileNamer\\";O:54:\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\":0:{}s:28:\\"\\u0000*\\u0000extractVideoFrameAtSecond\\";d:0;s:16:\\"\\u0000*\\u0000manipulations\\";O:45:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Manipulations\\":1:{s:16:\\"\\u0000*\\u0000manipulations\\";a:3:{s:8:\\"optimize\\";a:1:{i:0;O:36:\\"Spatie\\\\ImageOptimizer\\\\OptimizerChain\\":3:{s:13:\\"\\u0000*\\u0000optimizers\\";a:7:{i:0;O:42:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Jpegoptim\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m85\\";i:1;s:7:\\"--force\\";i:2;s:11:\\"--strip-all\\";i:3;s:17:\\"--all-progressive\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:9:\\"jpegoptim\\";}i:1;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Pngquant\\":5:{s:7:\\"options\\";a:1:{i:0;s:7:\\"--force\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"pngquant\\";}i:2;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Optipng\\":5:{s:7:\\"options\\";a:3:{i:0;s:3:\\"-i0\\";i:1;s:3:\\"-o2\\";i:2;s:6:\\"-quiet\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"optipng\\";}i:3;O:37:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Svgo\\":5:{s:7:\\"options\\";a:1:{i:0;s:20:\\"--disable=cleanupIDs\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:4:\\"svgo\\";}i:4;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Gifsicle\\":5:{s:7:\\"options\\";a:2:{i:0;s:2:\\"-b\\";i:1;s:3:\\"-O3\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"gifsicle\\";}i:5;O:38:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Cwebp\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m 6\\";i:1;s:8:\\"-pass 10\\";i:2;s:3:\\"-mt\\";i:3;s:5:\\"-q 90\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:5:\\"cwebp\\";}i:6;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Avifenc\\":6:{s:7:\\"options\\";a:8:{i:0;s:14:\\"-a cq-level=23\\";i:1;s:6:\\"-j all\\";i:2;s:7:\\"--min 0\\";i:3;s:8:\\"--max 63\\";i:4;s:12:\\"--minalpha 0\\";i:5;s:13:\\"--maxalpha 63\\";i:6;s:14:\\"-a end-usage=q\\";i:7;s:12:\\"-a tune=ssim\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"avifenc\\";s:16:\\"decodeBinaryName\\";s:7:\\"avifdec\\";}}s:9:\\"\\u0000*\\u0000logger\\";O:33:\\"Spatie\\\\ImageOptimizer\\\\DummyLogger\\":0:{}s:10:\\"\\u0000*\\u0000timeout\\";i:60;}}s:6:\\"format\\";a:1:{i:0;s:3:\\"jpg\\";}s:3:\\"fit\\";a:3:{i:0;r:83;i:1;i:400;i:2;i:400;}}}s:23:\\"\\u0000*\\u0000performOnCollections\\";a:0:{}s:17:\\"\\u0000*\\u0000performOnQueue\\";b:1;s:26:\\"\\u0000*\\u0000keepOriginalImageFormat\\";b:0;s:27:\\"\\u0000*\\u0000generateResponsiveImages\\";b:0;s:18:\\"\\u0000*\\u0000widthCalculator\\";N;s:24:\\"\\u0000*\\u0000loadingAttributeValue\\";N;s:16:\\"\\u0000*\\u0000pdfPageNumber\\";i:1;s:7:\\"\\u0000*\\u0000name\\";s:4:\\"icon\\";}}s:28:\\"\\u0000*\\u0000escapeWhenCastingToString\\";b:0;}s:8:\\"\\u0000*\\u0000media\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":5:{s:5:\\"class\\";s:49:\\"Spatie\\\\MediaLibrary\\\\MediaCollections\\\\Models\\\\Media\\";s:2:\\"id\\";i:9;s:9:\\"relations\\";a:0:{}s:10:\\"connection\\";s:5:\\"pgsql\\";s:15:\\"collectionClass\\";N;}s:14:\\"\\u0000*\\u0000onlyMissing\\";b:0;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:0:\\"\\";}"}}	0	\N	1720598268	1720598268
10	default	{"uuid":"6e30d645-058f-4d40-828d-dc6fc3bd54da","displayName":"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob","command":"O:58:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\\":5:{s:14:\\"\\u0000*\\u0000conversions\\";O:52:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\ConversionCollection\\":2:{s:8:\\"\\u0000*\\u0000items\\";a:2:{i:0;O:42:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\":11:{s:12:\\"\\u0000*\\u0000fileNamer\\";O:54:\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\":0:{}s:28:\\"\\u0000*\\u0000extractVideoFrameAtSecond\\";d:0;s:16:\\"\\u0000*\\u0000manipulations\\";O:45:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Manipulations\\":1:{s:16:\\"\\u0000*\\u0000manipulations\\";a:3:{s:8:\\"optimize\\";a:1:{i:0;O:36:\\"Spatie\\\\ImageOptimizer\\\\OptimizerChain\\":3:{s:13:\\"\\u0000*\\u0000optimizers\\";a:7:{i:0;O:42:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Jpegoptim\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m85\\";i:1;s:7:\\"--force\\";i:2;s:11:\\"--strip-all\\";i:3;s:17:\\"--all-progressive\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:9:\\"jpegoptim\\";}i:1;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Pngquant\\":5:{s:7:\\"options\\";a:1:{i:0;s:7:\\"--force\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"pngquant\\";}i:2;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Optipng\\":5:{s:7:\\"options\\";a:3:{i:0;s:3:\\"-i0\\";i:1;s:3:\\"-o2\\";i:2;s:6:\\"-quiet\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"optipng\\";}i:3;O:37:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Svgo\\":5:{s:7:\\"options\\";a:1:{i:0;s:20:\\"--disable=cleanupIDs\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:4:\\"svgo\\";}i:4;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Gifsicle\\":5:{s:7:\\"options\\";a:2:{i:0;s:2:\\"-b\\";i:1;s:3:\\"-O3\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"gifsicle\\";}i:5;O:38:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Cwebp\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m 6\\";i:1;s:8:\\"-pass 10\\";i:2;s:3:\\"-mt\\";i:3;s:5:\\"-q 90\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:5:\\"cwebp\\";}i:6;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Avifenc\\":6:{s:7:\\"options\\";a:8:{i:0;s:14:\\"-a cq-level=23\\";i:1;s:6:\\"-j all\\";i:2;s:7:\\"--min 0\\";i:3;s:8:\\"--max 63\\";i:4;s:12:\\"--minalpha 0\\";i:5;s:13:\\"--maxalpha 63\\";i:6;s:14:\\"-a end-usage=q\\";i:7;s:12:\\"-a tune=ssim\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"avifenc\\";s:16:\\"decodeBinaryName\\";s:7:\\"avifdec\\";}}s:9:\\"\\u0000*\\u0000logger\\";O:33:\\"Spatie\\\\ImageOptimizer\\\\DummyLogger\\":0:{}s:10:\\"\\u0000*\\u0000timeout\\";i:60;}}s:6:\\"format\\";a:1:{i:0;s:3:\\"jpg\\";}s:3:\\"fit\\";a:3:{i:0;E:27:\\"Spatie\\\\Image\\\\Enums\\\\Fit:Crop\\";i:1;i:600;i:2;i:600;}}}s:23:\\"\\u0000*\\u0000performOnCollections\\";a:0:{}s:17:\\"\\u0000*\\u0000performOnQueue\\";b:1;s:26:\\"\\u0000*\\u0000keepOriginalImageFormat\\";b:0;s:27:\\"\\u0000*\\u0000generateResponsiveImages\\";b:0;s:18:\\"\\u0000*\\u0000widthCalculator\\";N;s:24:\\"\\u0000*\\u0000loadingAttributeValue\\";N;s:16:\\"\\u0000*\\u0000pdfPageNumber\\";i:1;s:7:\\"\\u0000*\\u0000name\\";s:5:\\"thumb\\";}i:1;O:42:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\":11:{s:12:\\"\\u0000*\\u0000fileNamer\\";O:54:\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\":0:{}s:28:\\"\\u0000*\\u0000extractVideoFrameAtSecond\\";d:0;s:16:\\"\\u0000*\\u0000manipulations\\";O:45:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Manipulations\\":1:{s:16:\\"\\u0000*\\u0000manipulations\\";a:3:{s:8:\\"optimize\\";a:1:{i:0;O:36:\\"Spatie\\\\ImageOptimizer\\\\OptimizerChain\\":3:{s:13:\\"\\u0000*\\u0000optimizers\\";a:7:{i:0;O:42:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Jpegoptim\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m85\\";i:1;s:7:\\"--force\\";i:2;s:11:\\"--strip-all\\";i:3;s:17:\\"--all-progressive\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:9:\\"jpegoptim\\";}i:1;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Pngquant\\":5:{s:7:\\"options\\";a:1:{i:0;s:7:\\"--force\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"pngquant\\";}i:2;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Optipng\\":5:{s:7:\\"options\\";a:3:{i:0;s:3:\\"-i0\\";i:1;s:3:\\"-o2\\";i:2;s:6:\\"-quiet\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"optipng\\";}i:3;O:37:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Svgo\\":5:{s:7:\\"options\\";a:1:{i:0;s:20:\\"--disable=cleanupIDs\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:4:\\"svgo\\";}i:4;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Gifsicle\\":5:{s:7:\\"options\\";a:2:{i:0;s:2:\\"-b\\";i:1;s:3:\\"-O3\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"gifsicle\\";}i:5;O:38:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Cwebp\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m 6\\";i:1;s:8:\\"-pass 10\\";i:2;s:3:\\"-mt\\";i:3;s:5:\\"-q 90\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:5:\\"cwebp\\";}i:6;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Avifenc\\":6:{s:7:\\"options\\";a:8:{i:0;s:14:\\"-a cq-level=23\\";i:1;s:6:\\"-j all\\";i:2;s:7:\\"--min 0\\";i:3;s:8:\\"--max 63\\";i:4;s:12:\\"--minalpha 0\\";i:5;s:13:\\"--maxalpha 63\\";i:6;s:14:\\"-a end-usage=q\\";i:7;s:12:\\"-a tune=ssim\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"avifenc\\";s:16:\\"decodeBinaryName\\";s:7:\\"avifdec\\";}}s:9:\\"\\u0000*\\u0000logger\\";O:33:\\"Spatie\\\\ImageOptimizer\\\\DummyLogger\\":0:{}s:10:\\"\\u0000*\\u0000timeout\\";i:60;}}s:6:\\"format\\";a:1:{i:0;s:3:\\"jpg\\";}s:3:\\"fit\\";a:3:{i:0;r:83;i:1;i:400;i:2;i:400;}}}s:23:\\"\\u0000*\\u0000performOnCollections\\";a:0:{}s:17:\\"\\u0000*\\u0000performOnQueue\\";b:1;s:26:\\"\\u0000*\\u0000keepOriginalImageFormat\\";b:0;s:27:\\"\\u0000*\\u0000generateResponsiveImages\\";b:0;s:18:\\"\\u0000*\\u0000widthCalculator\\";N;s:24:\\"\\u0000*\\u0000loadingAttributeValue\\";N;s:16:\\"\\u0000*\\u0000pdfPageNumber\\";i:1;s:7:\\"\\u0000*\\u0000name\\";s:4:\\"icon\\";}}s:28:\\"\\u0000*\\u0000escapeWhenCastingToString\\";b:0;}s:8:\\"\\u0000*\\u0000media\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":5:{s:5:\\"class\\";s:49:\\"Spatie\\\\MediaLibrary\\\\MediaCollections\\\\Models\\\\Media\\";s:2:\\"id\\";i:10;s:9:\\"relations\\";a:0:{}s:10:\\"connection\\";s:5:\\"pgsql\\";s:15:\\"collectionClass\\";N;}s:14:\\"\\u0000*\\u0000onlyMissing\\";b:0;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:0:\\"\\";}"}}	0	\N	1720598323	1720598323
11	default	{"uuid":"92440d2b-1f88-40e4-a7a1-aa6067f6a13d","displayName":"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob","command":"O:58:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\\":5:{s:14:\\"\\u0000*\\u0000conversions\\";O:52:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\ConversionCollection\\":2:{s:8:\\"\\u0000*\\u0000items\\";a:2:{i:0;O:42:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\":11:{s:12:\\"\\u0000*\\u0000fileNamer\\";O:54:\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\":0:{}s:28:\\"\\u0000*\\u0000extractVideoFrameAtSecond\\";d:0;s:16:\\"\\u0000*\\u0000manipulations\\";O:45:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Manipulations\\":1:{s:16:\\"\\u0000*\\u0000manipulations\\";a:3:{s:8:\\"optimize\\";a:1:{i:0;O:36:\\"Spatie\\\\ImageOptimizer\\\\OptimizerChain\\":3:{s:13:\\"\\u0000*\\u0000optimizers\\";a:7:{i:0;O:42:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Jpegoptim\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m85\\";i:1;s:7:\\"--force\\";i:2;s:11:\\"--strip-all\\";i:3;s:17:\\"--all-progressive\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:9:\\"jpegoptim\\";}i:1;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Pngquant\\":5:{s:7:\\"options\\";a:1:{i:0;s:7:\\"--force\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"pngquant\\";}i:2;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Optipng\\":5:{s:7:\\"options\\";a:3:{i:0;s:3:\\"-i0\\";i:1;s:3:\\"-o2\\";i:2;s:6:\\"-quiet\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"optipng\\";}i:3;O:37:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Svgo\\":5:{s:7:\\"options\\";a:1:{i:0;s:20:\\"--disable=cleanupIDs\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:4:\\"svgo\\";}i:4;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Gifsicle\\":5:{s:7:\\"options\\";a:2:{i:0;s:2:\\"-b\\";i:1;s:3:\\"-O3\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"gifsicle\\";}i:5;O:38:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Cwebp\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m 6\\";i:1;s:8:\\"-pass 10\\";i:2;s:3:\\"-mt\\";i:3;s:5:\\"-q 90\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:5:\\"cwebp\\";}i:6;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Avifenc\\":6:{s:7:\\"options\\";a:8:{i:0;s:14:\\"-a cq-level=23\\";i:1;s:6:\\"-j all\\";i:2;s:7:\\"--min 0\\";i:3;s:8:\\"--max 63\\";i:4;s:12:\\"--minalpha 0\\";i:5;s:13:\\"--maxalpha 63\\";i:6;s:14:\\"-a end-usage=q\\";i:7;s:12:\\"-a tune=ssim\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"avifenc\\";s:16:\\"decodeBinaryName\\";s:7:\\"avifdec\\";}}s:9:\\"\\u0000*\\u0000logger\\";O:33:\\"Spatie\\\\ImageOptimizer\\\\DummyLogger\\":0:{}s:10:\\"\\u0000*\\u0000timeout\\";i:60;}}s:6:\\"format\\";a:1:{i:0;s:3:\\"jpg\\";}s:3:\\"fit\\";a:3:{i:0;E:27:\\"Spatie\\\\Image\\\\Enums\\\\Fit:Crop\\";i:1;i:600;i:2;i:600;}}}s:23:\\"\\u0000*\\u0000performOnCollections\\";a:0:{}s:17:\\"\\u0000*\\u0000performOnQueue\\";b:1;s:26:\\"\\u0000*\\u0000keepOriginalImageFormat\\";b:0;s:27:\\"\\u0000*\\u0000generateResponsiveImages\\";b:0;s:18:\\"\\u0000*\\u0000widthCalculator\\";N;s:24:\\"\\u0000*\\u0000loadingAttributeValue\\";N;s:16:\\"\\u0000*\\u0000pdfPageNumber\\";i:1;s:7:\\"\\u0000*\\u0000name\\";s:5:\\"thumb\\";}i:1;O:42:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\":11:{s:12:\\"\\u0000*\\u0000fileNamer\\";O:54:\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\":0:{}s:28:\\"\\u0000*\\u0000extractVideoFrameAtSecond\\";d:0;s:16:\\"\\u0000*\\u0000manipulations\\";O:45:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Manipulations\\":1:{s:16:\\"\\u0000*\\u0000manipulations\\";a:3:{s:8:\\"optimize\\";a:1:{i:0;O:36:\\"Spatie\\\\ImageOptimizer\\\\OptimizerChain\\":3:{s:13:\\"\\u0000*\\u0000optimizers\\";a:7:{i:0;O:42:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Jpegoptim\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m85\\";i:1;s:7:\\"--force\\";i:2;s:11:\\"--strip-all\\";i:3;s:17:\\"--all-progressive\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:9:\\"jpegoptim\\";}i:1;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Pngquant\\":5:{s:7:\\"options\\";a:1:{i:0;s:7:\\"--force\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"pngquant\\";}i:2;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Optipng\\":5:{s:7:\\"options\\";a:3:{i:0;s:3:\\"-i0\\";i:1;s:3:\\"-o2\\";i:2;s:6:\\"-quiet\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"optipng\\";}i:3;O:37:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Svgo\\":5:{s:7:\\"options\\";a:1:{i:0;s:20:\\"--disable=cleanupIDs\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:4:\\"svgo\\";}i:4;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Gifsicle\\":5:{s:7:\\"options\\";a:2:{i:0;s:2:\\"-b\\";i:1;s:3:\\"-O3\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"gifsicle\\";}i:5;O:38:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Cwebp\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m 6\\";i:1;s:8:\\"-pass 10\\";i:2;s:3:\\"-mt\\";i:3;s:5:\\"-q 90\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:5:\\"cwebp\\";}i:6;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Avifenc\\":6:{s:7:\\"options\\";a:8:{i:0;s:14:\\"-a cq-level=23\\";i:1;s:6:\\"-j all\\";i:2;s:7:\\"--min 0\\";i:3;s:8:\\"--max 63\\";i:4;s:12:\\"--minalpha 0\\";i:5;s:13:\\"--maxalpha 63\\";i:6;s:14:\\"-a end-usage=q\\";i:7;s:12:\\"-a tune=ssim\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"avifenc\\";s:16:\\"decodeBinaryName\\";s:7:\\"avifdec\\";}}s:9:\\"\\u0000*\\u0000logger\\";O:33:\\"Spatie\\\\ImageOptimizer\\\\DummyLogger\\":0:{}s:10:\\"\\u0000*\\u0000timeout\\";i:60;}}s:6:\\"format\\";a:1:{i:0;s:3:\\"jpg\\";}s:3:\\"fit\\";a:3:{i:0;r:83;i:1;i:400;i:2;i:400;}}}s:23:\\"\\u0000*\\u0000performOnCollections\\";a:0:{}s:17:\\"\\u0000*\\u0000performOnQueue\\";b:1;s:26:\\"\\u0000*\\u0000keepOriginalImageFormat\\";b:0;s:27:\\"\\u0000*\\u0000generateResponsiveImages\\";b:0;s:18:\\"\\u0000*\\u0000widthCalculator\\";N;s:24:\\"\\u0000*\\u0000loadingAttributeValue\\";N;s:16:\\"\\u0000*\\u0000pdfPageNumber\\";i:1;s:7:\\"\\u0000*\\u0000name\\";s:4:\\"icon\\";}}s:28:\\"\\u0000*\\u0000escapeWhenCastingToString\\";b:0;}s:8:\\"\\u0000*\\u0000media\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":5:{s:5:\\"class\\";s:49:\\"Spatie\\\\MediaLibrary\\\\MediaCollections\\\\Models\\\\Media\\";s:2:\\"id\\";i:11;s:9:\\"relations\\";a:0:{}s:10:\\"connection\\";s:5:\\"pgsql\\";s:15:\\"collectionClass\\";N;}s:14:\\"\\u0000*\\u0000onlyMissing\\";b:0;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:0:\\"\\";}"}}	0	\N	1720605991	1720605991
12	default	{"uuid":"fada6f57-89f9-48c0-8c6a-39fbef36877d","displayName":"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob","command":"O:58:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\\":5:{s:14:\\"\\u0000*\\u0000conversions\\";O:52:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\ConversionCollection\\":2:{s:8:\\"\\u0000*\\u0000items\\";a:2:{i:0;O:42:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\":11:{s:12:\\"\\u0000*\\u0000fileNamer\\";O:54:\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\":0:{}s:28:\\"\\u0000*\\u0000extractVideoFrameAtSecond\\";d:0;s:16:\\"\\u0000*\\u0000manipulations\\";O:45:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Manipulations\\":1:{s:16:\\"\\u0000*\\u0000manipulations\\";a:3:{s:8:\\"optimize\\";a:1:{i:0;O:36:\\"Spatie\\\\ImageOptimizer\\\\OptimizerChain\\":3:{s:13:\\"\\u0000*\\u0000optimizers\\";a:7:{i:0;O:42:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Jpegoptim\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m85\\";i:1;s:7:\\"--force\\";i:2;s:11:\\"--strip-all\\";i:3;s:17:\\"--all-progressive\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:9:\\"jpegoptim\\";}i:1;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Pngquant\\":5:{s:7:\\"options\\";a:1:{i:0;s:7:\\"--force\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"pngquant\\";}i:2;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Optipng\\":5:{s:7:\\"options\\";a:3:{i:0;s:3:\\"-i0\\";i:1;s:3:\\"-o2\\";i:2;s:6:\\"-quiet\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"optipng\\";}i:3;O:37:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Svgo\\":5:{s:7:\\"options\\";a:1:{i:0;s:20:\\"--disable=cleanupIDs\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:4:\\"svgo\\";}i:4;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Gifsicle\\":5:{s:7:\\"options\\";a:2:{i:0;s:2:\\"-b\\";i:1;s:3:\\"-O3\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"gifsicle\\";}i:5;O:38:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Cwebp\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m 6\\";i:1;s:8:\\"-pass 10\\";i:2;s:3:\\"-mt\\";i:3;s:5:\\"-q 90\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:5:\\"cwebp\\";}i:6;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Avifenc\\":6:{s:7:\\"options\\";a:8:{i:0;s:14:\\"-a cq-level=23\\";i:1;s:6:\\"-j all\\";i:2;s:7:\\"--min 0\\";i:3;s:8:\\"--max 63\\";i:4;s:12:\\"--minalpha 0\\";i:5;s:13:\\"--maxalpha 63\\";i:6;s:14:\\"-a end-usage=q\\";i:7;s:12:\\"-a tune=ssim\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"avifenc\\";s:16:\\"decodeBinaryName\\";s:7:\\"avifdec\\";}}s:9:\\"\\u0000*\\u0000logger\\";O:33:\\"Spatie\\\\ImageOptimizer\\\\DummyLogger\\":0:{}s:10:\\"\\u0000*\\u0000timeout\\";i:60;}}s:6:\\"format\\";a:1:{i:0;s:3:\\"jpg\\";}s:3:\\"fit\\";a:3:{i:0;E:27:\\"Spatie\\\\Image\\\\Enums\\\\Fit:Crop\\";i:1;i:600;i:2;i:600;}}}s:23:\\"\\u0000*\\u0000performOnCollections\\";a:0:{}s:17:\\"\\u0000*\\u0000performOnQueue\\";b:1;s:26:\\"\\u0000*\\u0000keepOriginalImageFormat\\";b:0;s:27:\\"\\u0000*\\u0000generateResponsiveImages\\";b:0;s:18:\\"\\u0000*\\u0000widthCalculator\\";N;s:24:\\"\\u0000*\\u0000loadingAttributeValue\\";N;s:16:\\"\\u0000*\\u0000pdfPageNumber\\";i:1;s:7:\\"\\u0000*\\u0000name\\";s:5:\\"thumb\\";}i:1;O:42:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\":11:{s:12:\\"\\u0000*\\u0000fileNamer\\";O:54:\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\":0:{}s:28:\\"\\u0000*\\u0000extractVideoFrameAtSecond\\";d:0;s:16:\\"\\u0000*\\u0000manipulations\\";O:45:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Manipulations\\":1:{s:16:\\"\\u0000*\\u0000manipulations\\";a:3:{s:8:\\"optimize\\";a:1:{i:0;O:36:\\"Spatie\\\\ImageOptimizer\\\\OptimizerChain\\":3:{s:13:\\"\\u0000*\\u0000optimizers\\";a:7:{i:0;O:42:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Jpegoptim\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m85\\";i:1;s:7:\\"--force\\";i:2;s:11:\\"--strip-all\\";i:3;s:17:\\"--all-progressive\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:9:\\"jpegoptim\\";}i:1;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Pngquant\\":5:{s:7:\\"options\\";a:1:{i:0;s:7:\\"--force\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"pngquant\\";}i:2;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Optipng\\":5:{s:7:\\"options\\";a:3:{i:0;s:3:\\"-i0\\";i:1;s:3:\\"-o2\\";i:2;s:6:\\"-quiet\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"optipng\\";}i:3;O:37:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Svgo\\":5:{s:7:\\"options\\";a:1:{i:0;s:20:\\"--disable=cleanupIDs\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:4:\\"svgo\\";}i:4;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Gifsicle\\":5:{s:7:\\"options\\";a:2:{i:0;s:2:\\"-b\\";i:1;s:3:\\"-O3\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"gifsicle\\";}i:5;O:38:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Cwebp\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m 6\\";i:1;s:8:\\"-pass 10\\";i:2;s:3:\\"-mt\\";i:3;s:5:\\"-q 90\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:5:\\"cwebp\\";}i:6;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Avifenc\\":6:{s:7:\\"options\\";a:8:{i:0;s:14:\\"-a cq-level=23\\";i:1;s:6:\\"-j all\\";i:2;s:7:\\"--min 0\\";i:3;s:8:\\"--max 63\\";i:4;s:12:\\"--minalpha 0\\";i:5;s:13:\\"--maxalpha 63\\";i:6;s:14:\\"-a end-usage=q\\";i:7;s:12:\\"-a tune=ssim\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"avifenc\\";s:16:\\"decodeBinaryName\\";s:7:\\"avifdec\\";}}s:9:\\"\\u0000*\\u0000logger\\";O:33:\\"Spatie\\\\ImageOptimizer\\\\DummyLogger\\":0:{}s:10:\\"\\u0000*\\u0000timeout\\";i:60;}}s:6:\\"format\\";a:1:{i:0;s:3:\\"jpg\\";}s:3:\\"fit\\";a:3:{i:0;r:83;i:1;i:400;i:2;i:400;}}}s:23:\\"\\u0000*\\u0000performOnCollections\\";a:0:{}s:17:\\"\\u0000*\\u0000performOnQueue\\";b:1;s:26:\\"\\u0000*\\u0000keepOriginalImageFormat\\";b:0;s:27:\\"\\u0000*\\u0000generateResponsiveImages\\";b:0;s:18:\\"\\u0000*\\u0000widthCalculator\\";N;s:24:\\"\\u0000*\\u0000loadingAttributeValue\\";N;s:16:\\"\\u0000*\\u0000pdfPageNumber\\";i:1;s:7:\\"\\u0000*\\u0000name\\";s:4:\\"icon\\";}}s:28:\\"\\u0000*\\u0000escapeWhenCastingToString\\";b:0;}s:8:\\"\\u0000*\\u0000media\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":5:{s:5:\\"class\\";s:49:\\"Spatie\\\\MediaLibrary\\\\MediaCollections\\\\Models\\\\Media\\";s:2:\\"id\\";i:12;s:9:\\"relations\\";a:0:{}s:10:\\"connection\\";s:5:\\"pgsql\\";s:15:\\"collectionClass\\";N;}s:14:\\"\\u0000*\\u0000onlyMissing\\";b:0;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:0:\\"\\";}"}}	0	\N	1720606083	1720606083
13	default	{"uuid":"3b8729a1-75f1-49dc-a717-7f3ed2d82687","displayName":"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob","command":"O:58:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\\":5:{s:14:\\"\\u0000*\\u0000conversions\\";O:52:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\ConversionCollection\\":2:{s:8:\\"\\u0000*\\u0000items\\";a:2:{i:0;O:42:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\":11:{s:12:\\"\\u0000*\\u0000fileNamer\\";O:54:\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\":0:{}s:28:\\"\\u0000*\\u0000extractVideoFrameAtSecond\\";d:0;s:16:\\"\\u0000*\\u0000manipulations\\";O:45:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Manipulations\\":1:{s:16:\\"\\u0000*\\u0000manipulations\\";a:3:{s:8:\\"optimize\\";a:1:{i:0;O:36:\\"Spatie\\\\ImageOptimizer\\\\OptimizerChain\\":3:{s:13:\\"\\u0000*\\u0000optimizers\\";a:7:{i:0;O:42:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Jpegoptim\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m85\\";i:1;s:7:\\"--force\\";i:2;s:11:\\"--strip-all\\";i:3;s:17:\\"--all-progressive\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:9:\\"jpegoptim\\";}i:1;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Pngquant\\":5:{s:7:\\"options\\";a:1:{i:0;s:7:\\"--force\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"pngquant\\";}i:2;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Optipng\\":5:{s:7:\\"options\\";a:3:{i:0;s:3:\\"-i0\\";i:1;s:3:\\"-o2\\";i:2;s:6:\\"-quiet\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"optipng\\";}i:3;O:37:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Svgo\\":5:{s:7:\\"options\\";a:1:{i:0;s:20:\\"--disable=cleanupIDs\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:4:\\"svgo\\";}i:4;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Gifsicle\\":5:{s:7:\\"options\\";a:2:{i:0;s:2:\\"-b\\";i:1;s:3:\\"-O3\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"gifsicle\\";}i:5;O:38:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Cwebp\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m 6\\";i:1;s:8:\\"-pass 10\\";i:2;s:3:\\"-mt\\";i:3;s:5:\\"-q 90\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:5:\\"cwebp\\";}i:6;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Avifenc\\":6:{s:7:\\"options\\";a:8:{i:0;s:14:\\"-a cq-level=23\\";i:1;s:6:\\"-j all\\";i:2;s:7:\\"--min 0\\";i:3;s:8:\\"--max 63\\";i:4;s:12:\\"--minalpha 0\\";i:5;s:13:\\"--maxalpha 63\\";i:6;s:14:\\"-a end-usage=q\\";i:7;s:12:\\"-a tune=ssim\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"avifenc\\";s:16:\\"decodeBinaryName\\";s:7:\\"avifdec\\";}}s:9:\\"\\u0000*\\u0000logger\\";O:33:\\"Spatie\\\\ImageOptimizer\\\\DummyLogger\\":0:{}s:10:\\"\\u0000*\\u0000timeout\\";i:60;}}s:6:\\"format\\";a:1:{i:0;s:3:\\"jpg\\";}s:3:\\"fit\\";a:3:{i:0;E:27:\\"Spatie\\\\Image\\\\Enums\\\\Fit:Crop\\";i:1;i:600;i:2;i:600;}}}s:23:\\"\\u0000*\\u0000performOnCollections\\";a:0:{}s:17:\\"\\u0000*\\u0000performOnQueue\\";b:1;s:26:\\"\\u0000*\\u0000keepOriginalImageFormat\\";b:0;s:27:\\"\\u0000*\\u0000generateResponsiveImages\\";b:0;s:18:\\"\\u0000*\\u0000widthCalculator\\";N;s:24:\\"\\u0000*\\u0000loadingAttributeValue\\";N;s:16:\\"\\u0000*\\u0000pdfPageNumber\\";i:1;s:7:\\"\\u0000*\\u0000name\\";s:5:\\"thumb\\";}i:1;O:42:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\":11:{s:12:\\"\\u0000*\\u0000fileNamer\\";O:54:\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\":0:{}s:28:\\"\\u0000*\\u0000extractVideoFrameAtSecond\\";d:0;s:16:\\"\\u0000*\\u0000manipulations\\";O:45:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Manipulations\\":1:{s:16:\\"\\u0000*\\u0000manipulations\\";a:3:{s:8:\\"optimize\\";a:1:{i:0;O:36:\\"Spatie\\\\ImageOptimizer\\\\OptimizerChain\\":3:{s:13:\\"\\u0000*\\u0000optimizers\\";a:7:{i:0;O:42:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Jpegoptim\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m85\\";i:1;s:7:\\"--force\\";i:2;s:11:\\"--strip-all\\";i:3;s:17:\\"--all-progressive\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:9:\\"jpegoptim\\";}i:1;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Pngquant\\":5:{s:7:\\"options\\";a:1:{i:0;s:7:\\"--force\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"pngquant\\";}i:2;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Optipng\\":5:{s:7:\\"options\\";a:3:{i:0;s:3:\\"-i0\\";i:1;s:3:\\"-o2\\";i:2;s:6:\\"-quiet\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"optipng\\";}i:3;O:37:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Svgo\\":5:{s:7:\\"options\\";a:1:{i:0;s:20:\\"--disable=cleanupIDs\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:4:\\"svgo\\";}i:4;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Gifsicle\\":5:{s:7:\\"options\\";a:2:{i:0;s:2:\\"-b\\";i:1;s:3:\\"-O3\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"gifsicle\\";}i:5;O:38:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Cwebp\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m 6\\";i:1;s:8:\\"-pass 10\\";i:2;s:3:\\"-mt\\";i:3;s:5:\\"-q 90\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:5:\\"cwebp\\";}i:6;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Avifenc\\":6:{s:7:\\"options\\";a:8:{i:0;s:14:\\"-a cq-level=23\\";i:1;s:6:\\"-j all\\";i:2;s:7:\\"--min 0\\";i:3;s:8:\\"--max 63\\";i:4;s:12:\\"--minalpha 0\\";i:5;s:13:\\"--maxalpha 63\\";i:6;s:14:\\"-a end-usage=q\\";i:7;s:12:\\"-a tune=ssim\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"avifenc\\";s:16:\\"decodeBinaryName\\";s:7:\\"avifdec\\";}}s:9:\\"\\u0000*\\u0000logger\\";O:33:\\"Spatie\\\\ImageOptimizer\\\\DummyLogger\\":0:{}s:10:\\"\\u0000*\\u0000timeout\\";i:60;}}s:6:\\"format\\";a:1:{i:0;s:3:\\"jpg\\";}s:3:\\"fit\\";a:3:{i:0;r:83;i:1;i:400;i:2;i:400;}}}s:23:\\"\\u0000*\\u0000performOnCollections\\";a:0:{}s:17:\\"\\u0000*\\u0000performOnQueue\\";b:1;s:26:\\"\\u0000*\\u0000keepOriginalImageFormat\\";b:0;s:27:\\"\\u0000*\\u0000generateResponsiveImages\\";b:0;s:18:\\"\\u0000*\\u0000widthCalculator\\";N;s:24:\\"\\u0000*\\u0000loadingAttributeValue\\";N;s:16:\\"\\u0000*\\u0000pdfPageNumber\\";i:1;s:7:\\"\\u0000*\\u0000name\\";s:4:\\"icon\\";}}s:28:\\"\\u0000*\\u0000escapeWhenCastingToString\\";b:0;}s:8:\\"\\u0000*\\u0000media\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":5:{s:5:\\"class\\";s:49:\\"Spatie\\\\MediaLibrary\\\\MediaCollections\\\\Models\\\\Media\\";s:2:\\"id\\";i:13;s:9:\\"relations\\";a:0:{}s:10:\\"connection\\";s:5:\\"pgsql\\";s:15:\\"collectionClass\\";N;}s:14:\\"\\u0000*\\u0000onlyMissing\\";b:0;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:0:\\"\\";}"}}	0	\N	1720606167	1720606167
14	default	{"uuid":"6b57da99-dbee-4ba9-bb5b-9d847d2755c1","displayName":"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob","command":"O:58:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\\":5:{s:14:\\"\\u0000*\\u0000conversions\\";O:52:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\ConversionCollection\\":2:{s:8:\\"\\u0000*\\u0000items\\";a:2:{i:0;O:42:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\":11:{s:12:\\"\\u0000*\\u0000fileNamer\\";O:54:\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\":0:{}s:28:\\"\\u0000*\\u0000extractVideoFrameAtSecond\\";d:0;s:16:\\"\\u0000*\\u0000manipulations\\";O:45:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Manipulations\\":1:{s:16:\\"\\u0000*\\u0000manipulations\\";a:3:{s:8:\\"optimize\\";a:1:{i:0;O:36:\\"Spatie\\\\ImageOptimizer\\\\OptimizerChain\\":3:{s:13:\\"\\u0000*\\u0000optimizers\\";a:7:{i:0;O:42:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Jpegoptim\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m85\\";i:1;s:7:\\"--force\\";i:2;s:11:\\"--strip-all\\";i:3;s:17:\\"--all-progressive\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:9:\\"jpegoptim\\";}i:1;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Pngquant\\":5:{s:7:\\"options\\";a:1:{i:0;s:7:\\"--force\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"pngquant\\";}i:2;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Optipng\\":5:{s:7:\\"options\\";a:3:{i:0;s:3:\\"-i0\\";i:1;s:3:\\"-o2\\";i:2;s:6:\\"-quiet\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"optipng\\";}i:3;O:37:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Svgo\\":5:{s:7:\\"options\\";a:1:{i:0;s:20:\\"--disable=cleanupIDs\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:4:\\"svgo\\";}i:4;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Gifsicle\\":5:{s:7:\\"options\\";a:2:{i:0;s:2:\\"-b\\";i:1;s:3:\\"-O3\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"gifsicle\\";}i:5;O:38:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Cwebp\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m 6\\";i:1;s:8:\\"-pass 10\\";i:2;s:3:\\"-mt\\";i:3;s:5:\\"-q 90\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:5:\\"cwebp\\";}i:6;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Avifenc\\":6:{s:7:\\"options\\";a:8:{i:0;s:14:\\"-a cq-level=23\\";i:1;s:6:\\"-j all\\";i:2;s:7:\\"--min 0\\";i:3;s:8:\\"--max 63\\";i:4;s:12:\\"--minalpha 0\\";i:5;s:13:\\"--maxalpha 63\\";i:6;s:14:\\"-a end-usage=q\\";i:7;s:12:\\"-a tune=ssim\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"avifenc\\";s:16:\\"decodeBinaryName\\";s:7:\\"avifdec\\";}}s:9:\\"\\u0000*\\u0000logger\\";O:33:\\"Spatie\\\\ImageOptimizer\\\\DummyLogger\\":0:{}s:10:\\"\\u0000*\\u0000timeout\\";i:60;}}s:6:\\"format\\";a:1:{i:0;s:3:\\"jpg\\";}s:3:\\"fit\\";a:3:{i:0;E:27:\\"Spatie\\\\Image\\\\Enums\\\\Fit:Crop\\";i:1;i:600;i:2;i:600;}}}s:23:\\"\\u0000*\\u0000performOnCollections\\";a:0:{}s:17:\\"\\u0000*\\u0000performOnQueue\\";b:1;s:26:\\"\\u0000*\\u0000keepOriginalImageFormat\\";b:0;s:27:\\"\\u0000*\\u0000generateResponsiveImages\\";b:0;s:18:\\"\\u0000*\\u0000widthCalculator\\";N;s:24:\\"\\u0000*\\u0000loadingAttributeValue\\";N;s:16:\\"\\u0000*\\u0000pdfPageNumber\\";i:1;s:7:\\"\\u0000*\\u0000name\\";s:5:\\"thumb\\";}i:1;O:42:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\":11:{s:12:\\"\\u0000*\\u0000fileNamer\\";O:54:\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\":0:{}s:28:\\"\\u0000*\\u0000extractVideoFrameAtSecond\\";d:0;s:16:\\"\\u0000*\\u0000manipulations\\";O:45:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Manipulations\\":1:{s:16:\\"\\u0000*\\u0000manipulations\\";a:3:{s:8:\\"optimize\\";a:1:{i:0;O:36:\\"Spatie\\\\ImageOptimizer\\\\OptimizerChain\\":3:{s:13:\\"\\u0000*\\u0000optimizers\\";a:7:{i:0;O:42:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Jpegoptim\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m85\\";i:1;s:7:\\"--force\\";i:2;s:11:\\"--strip-all\\";i:3;s:17:\\"--all-progressive\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:9:\\"jpegoptim\\";}i:1;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Pngquant\\":5:{s:7:\\"options\\";a:1:{i:0;s:7:\\"--force\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"pngquant\\";}i:2;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Optipng\\":5:{s:7:\\"options\\";a:3:{i:0;s:3:\\"-i0\\";i:1;s:3:\\"-o2\\";i:2;s:6:\\"-quiet\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"optipng\\";}i:3;O:37:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Svgo\\":5:{s:7:\\"options\\";a:1:{i:0;s:20:\\"--disable=cleanupIDs\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:4:\\"svgo\\";}i:4;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Gifsicle\\":5:{s:7:\\"options\\";a:2:{i:0;s:2:\\"-b\\";i:1;s:3:\\"-O3\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"gifsicle\\";}i:5;O:38:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Cwebp\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m 6\\";i:1;s:8:\\"-pass 10\\";i:2;s:3:\\"-mt\\";i:3;s:5:\\"-q 90\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:5:\\"cwebp\\";}i:6;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Avifenc\\":6:{s:7:\\"options\\";a:8:{i:0;s:14:\\"-a cq-level=23\\";i:1;s:6:\\"-j all\\";i:2;s:7:\\"--min 0\\";i:3;s:8:\\"--max 63\\";i:4;s:12:\\"--minalpha 0\\";i:5;s:13:\\"--maxalpha 63\\";i:6;s:14:\\"-a end-usage=q\\";i:7;s:12:\\"-a tune=ssim\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"avifenc\\";s:16:\\"decodeBinaryName\\";s:7:\\"avifdec\\";}}s:9:\\"\\u0000*\\u0000logger\\";O:33:\\"Spatie\\\\ImageOptimizer\\\\DummyLogger\\":0:{}s:10:\\"\\u0000*\\u0000timeout\\";i:60;}}s:6:\\"format\\";a:1:{i:0;s:3:\\"jpg\\";}s:3:\\"fit\\";a:3:{i:0;r:83;i:1;i:400;i:2;i:400;}}}s:23:\\"\\u0000*\\u0000performOnCollections\\";a:0:{}s:17:\\"\\u0000*\\u0000performOnQueue\\";b:1;s:26:\\"\\u0000*\\u0000keepOriginalImageFormat\\";b:0;s:27:\\"\\u0000*\\u0000generateResponsiveImages\\";b:0;s:18:\\"\\u0000*\\u0000widthCalculator\\";N;s:24:\\"\\u0000*\\u0000loadingAttributeValue\\";N;s:16:\\"\\u0000*\\u0000pdfPageNumber\\";i:1;s:7:\\"\\u0000*\\u0000name\\";s:4:\\"icon\\";}}s:28:\\"\\u0000*\\u0000escapeWhenCastingToString\\";b:0;}s:8:\\"\\u0000*\\u0000media\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":5:{s:5:\\"class\\";s:49:\\"Spatie\\\\MediaLibrary\\\\MediaCollections\\\\Models\\\\Media\\";s:2:\\"id\\";i:14;s:9:\\"relations\\";a:0:{}s:10:\\"connection\\";s:5:\\"pgsql\\";s:15:\\"collectionClass\\";N;}s:14:\\"\\u0000*\\u0000onlyMissing\\";b:0;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:0:\\"\\";}"}}	0	\N	1720606321	1720606321
15	default	{"uuid":"61e2502b-6f54-4954-9757-f77953e9622d","displayName":"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob","command":"O:58:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\\":5:{s:14:\\"\\u0000*\\u0000conversions\\";O:52:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\ConversionCollection\\":2:{s:8:\\"\\u0000*\\u0000items\\";a:2:{i:0;O:42:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\":11:{s:12:\\"\\u0000*\\u0000fileNamer\\";O:54:\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\":0:{}s:28:\\"\\u0000*\\u0000extractVideoFrameAtSecond\\";d:0;s:16:\\"\\u0000*\\u0000manipulations\\";O:45:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Manipulations\\":1:{s:16:\\"\\u0000*\\u0000manipulations\\";a:3:{s:8:\\"optimize\\";a:1:{i:0;O:36:\\"Spatie\\\\ImageOptimizer\\\\OptimizerChain\\":3:{s:13:\\"\\u0000*\\u0000optimizers\\";a:7:{i:0;O:42:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Jpegoptim\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m85\\";i:1;s:7:\\"--force\\";i:2;s:11:\\"--strip-all\\";i:3;s:17:\\"--all-progressive\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:9:\\"jpegoptim\\";}i:1;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Pngquant\\":5:{s:7:\\"options\\";a:1:{i:0;s:7:\\"--force\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"pngquant\\";}i:2;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Optipng\\":5:{s:7:\\"options\\";a:3:{i:0;s:3:\\"-i0\\";i:1;s:3:\\"-o2\\";i:2;s:6:\\"-quiet\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"optipng\\";}i:3;O:37:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Svgo\\":5:{s:7:\\"options\\";a:1:{i:0;s:20:\\"--disable=cleanupIDs\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:4:\\"svgo\\";}i:4;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Gifsicle\\":5:{s:7:\\"options\\";a:2:{i:0;s:2:\\"-b\\";i:1;s:3:\\"-O3\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"gifsicle\\";}i:5;O:38:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Cwebp\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m 6\\";i:1;s:8:\\"-pass 10\\";i:2;s:3:\\"-mt\\";i:3;s:5:\\"-q 90\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:5:\\"cwebp\\";}i:6;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Avifenc\\":6:{s:7:\\"options\\";a:8:{i:0;s:14:\\"-a cq-level=23\\";i:1;s:6:\\"-j all\\";i:2;s:7:\\"--min 0\\";i:3;s:8:\\"--max 63\\";i:4;s:12:\\"--minalpha 0\\";i:5;s:13:\\"--maxalpha 63\\";i:6;s:14:\\"-a end-usage=q\\";i:7;s:12:\\"-a tune=ssim\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"avifenc\\";s:16:\\"decodeBinaryName\\";s:7:\\"avifdec\\";}}s:9:\\"\\u0000*\\u0000logger\\";O:33:\\"Spatie\\\\ImageOptimizer\\\\DummyLogger\\":0:{}s:10:\\"\\u0000*\\u0000timeout\\";i:60;}}s:6:\\"format\\";a:1:{i:0;s:3:\\"jpg\\";}s:3:\\"fit\\";a:3:{i:0;E:27:\\"Spatie\\\\Image\\\\Enums\\\\Fit:Crop\\";i:1;i:600;i:2;i:600;}}}s:23:\\"\\u0000*\\u0000performOnCollections\\";a:0:{}s:17:\\"\\u0000*\\u0000performOnQueue\\";b:1;s:26:\\"\\u0000*\\u0000keepOriginalImageFormat\\";b:0;s:27:\\"\\u0000*\\u0000generateResponsiveImages\\";b:0;s:18:\\"\\u0000*\\u0000widthCalculator\\";N;s:24:\\"\\u0000*\\u0000loadingAttributeValue\\";N;s:16:\\"\\u0000*\\u0000pdfPageNumber\\";i:1;s:7:\\"\\u0000*\\u0000name\\";s:5:\\"thumb\\";}i:1;O:42:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\":11:{s:12:\\"\\u0000*\\u0000fileNamer\\";O:54:\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\":0:{}s:28:\\"\\u0000*\\u0000extractVideoFrameAtSecond\\";d:0;s:16:\\"\\u0000*\\u0000manipulations\\";O:45:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Manipulations\\":1:{s:16:\\"\\u0000*\\u0000manipulations\\";a:3:{s:8:\\"optimize\\";a:1:{i:0;O:36:\\"Spatie\\\\ImageOptimizer\\\\OptimizerChain\\":3:{s:13:\\"\\u0000*\\u0000optimizers\\";a:7:{i:0;O:42:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Jpegoptim\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m85\\";i:1;s:7:\\"--force\\";i:2;s:11:\\"--strip-all\\";i:3;s:17:\\"--all-progressive\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:9:\\"jpegoptim\\";}i:1;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Pngquant\\":5:{s:7:\\"options\\";a:1:{i:0;s:7:\\"--force\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"pngquant\\";}i:2;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Optipng\\":5:{s:7:\\"options\\";a:3:{i:0;s:3:\\"-i0\\";i:1;s:3:\\"-o2\\";i:2;s:6:\\"-quiet\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"optipng\\";}i:3;O:37:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Svgo\\":5:{s:7:\\"options\\";a:1:{i:0;s:20:\\"--disable=cleanupIDs\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:4:\\"svgo\\";}i:4;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Gifsicle\\":5:{s:7:\\"options\\";a:2:{i:0;s:2:\\"-b\\";i:1;s:3:\\"-O3\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"gifsicle\\";}i:5;O:38:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Cwebp\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m 6\\";i:1;s:8:\\"-pass 10\\";i:2;s:3:\\"-mt\\";i:3;s:5:\\"-q 90\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:5:\\"cwebp\\";}i:6;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Avifenc\\":6:{s:7:\\"options\\";a:8:{i:0;s:14:\\"-a cq-level=23\\";i:1;s:6:\\"-j all\\";i:2;s:7:\\"--min 0\\";i:3;s:8:\\"--max 63\\";i:4;s:12:\\"--minalpha 0\\";i:5;s:13:\\"--maxalpha 63\\";i:6;s:14:\\"-a end-usage=q\\";i:7;s:12:\\"-a tune=ssim\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"avifenc\\";s:16:\\"decodeBinaryName\\";s:7:\\"avifdec\\";}}s:9:\\"\\u0000*\\u0000logger\\";O:33:\\"Spatie\\\\ImageOptimizer\\\\DummyLogger\\":0:{}s:10:\\"\\u0000*\\u0000timeout\\";i:60;}}s:6:\\"format\\";a:1:{i:0;s:3:\\"jpg\\";}s:3:\\"fit\\";a:3:{i:0;r:83;i:1;i:400;i:2;i:400;}}}s:23:\\"\\u0000*\\u0000performOnCollections\\";a:0:{}s:17:\\"\\u0000*\\u0000performOnQueue\\";b:1;s:26:\\"\\u0000*\\u0000keepOriginalImageFormat\\";b:0;s:27:\\"\\u0000*\\u0000generateResponsiveImages\\";b:0;s:18:\\"\\u0000*\\u0000widthCalculator\\";N;s:24:\\"\\u0000*\\u0000loadingAttributeValue\\";N;s:16:\\"\\u0000*\\u0000pdfPageNumber\\";i:1;s:7:\\"\\u0000*\\u0000name\\";s:4:\\"icon\\";}}s:28:\\"\\u0000*\\u0000escapeWhenCastingToString\\";b:0;}s:8:\\"\\u0000*\\u0000media\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":5:{s:5:\\"class\\";s:49:\\"Spatie\\\\MediaLibrary\\\\MediaCollections\\\\Models\\\\Media\\";s:2:\\"id\\";i:15;s:9:\\"relations\\";a:0:{}s:10:\\"connection\\";s:5:\\"pgsql\\";s:15:\\"collectionClass\\";N;}s:14:\\"\\u0000*\\u0000onlyMissing\\";b:0;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:0:\\"\\";}"}}	0	\N	1720606378	1720606378
16	default	{"uuid":"b970368a-aeb0-4f76-a14a-316e9a0c1a99","displayName":"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob","command":"O:58:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\\":5:{s:14:\\"\\u0000*\\u0000conversions\\";O:52:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\ConversionCollection\\":2:{s:8:\\"\\u0000*\\u0000items\\";a:2:{i:0;O:42:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\":11:{s:12:\\"\\u0000*\\u0000fileNamer\\";O:54:\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\":0:{}s:28:\\"\\u0000*\\u0000extractVideoFrameAtSecond\\";d:0;s:16:\\"\\u0000*\\u0000manipulations\\";O:45:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Manipulations\\":1:{s:16:\\"\\u0000*\\u0000manipulations\\";a:3:{s:8:\\"optimize\\";a:1:{i:0;O:36:\\"Spatie\\\\ImageOptimizer\\\\OptimizerChain\\":3:{s:13:\\"\\u0000*\\u0000optimizers\\";a:7:{i:0;O:42:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Jpegoptim\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m85\\";i:1;s:7:\\"--force\\";i:2;s:11:\\"--strip-all\\";i:3;s:17:\\"--all-progressive\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:9:\\"jpegoptim\\";}i:1;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Pngquant\\":5:{s:7:\\"options\\";a:1:{i:0;s:7:\\"--force\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"pngquant\\";}i:2;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Optipng\\":5:{s:7:\\"options\\";a:3:{i:0;s:3:\\"-i0\\";i:1;s:3:\\"-o2\\";i:2;s:6:\\"-quiet\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"optipng\\";}i:3;O:37:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Svgo\\":5:{s:7:\\"options\\";a:1:{i:0;s:20:\\"--disable=cleanupIDs\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:4:\\"svgo\\";}i:4;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Gifsicle\\":5:{s:7:\\"options\\";a:2:{i:0;s:2:\\"-b\\";i:1;s:3:\\"-O3\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"gifsicle\\";}i:5;O:38:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Cwebp\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m 6\\";i:1;s:8:\\"-pass 10\\";i:2;s:3:\\"-mt\\";i:3;s:5:\\"-q 90\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:5:\\"cwebp\\";}i:6;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Avifenc\\":6:{s:7:\\"options\\";a:8:{i:0;s:14:\\"-a cq-level=23\\";i:1;s:6:\\"-j all\\";i:2;s:7:\\"--min 0\\";i:3;s:8:\\"--max 63\\";i:4;s:12:\\"--minalpha 0\\";i:5;s:13:\\"--maxalpha 63\\";i:6;s:14:\\"-a end-usage=q\\";i:7;s:12:\\"-a tune=ssim\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"avifenc\\";s:16:\\"decodeBinaryName\\";s:7:\\"avifdec\\";}}s:9:\\"\\u0000*\\u0000logger\\";O:33:\\"Spatie\\\\ImageOptimizer\\\\DummyLogger\\":0:{}s:10:\\"\\u0000*\\u0000timeout\\";i:60;}}s:6:\\"format\\";a:1:{i:0;s:3:\\"jpg\\";}s:3:\\"fit\\";a:3:{i:0;E:27:\\"Spatie\\\\Image\\\\Enums\\\\Fit:Crop\\";i:1;i:600;i:2;i:600;}}}s:23:\\"\\u0000*\\u0000performOnCollections\\";a:0:{}s:17:\\"\\u0000*\\u0000performOnQueue\\";b:1;s:26:\\"\\u0000*\\u0000keepOriginalImageFormat\\";b:0;s:27:\\"\\u0000*\\u0000generateResponsiveImages\\";b:0;s:18:\\"\\u0000*\\u0000widthCalculator\\";N;s:24:\\"\\u0000*\\u0000loadingAttributeValue\\";N;s:16:\\"\\u0000*\\u0000pdfPageNumber\\";i:1;s:7:\\"\\u0000*\\u0000name\\";s:5:\\"thumb\\";}i:1;O:42:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\":11:{s:12:\\"\\u0000*\\u0000fileNamer\\";O:54:\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\":0:{}s:28:\\"\\u0000*\\u0000extractVideoFrameAtSecond\\";d:0;s:16:\\"\\u0000*\\u0000manipulations\\";O:45:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Manipulations\\":1:{s:16:\\"\\u0000*\\u0000manipulations\\";a:3:{s:8:\\"optimize\\";a:1:{i:0;O:36:\\"Spatie\\\\ImageOptimizer\\\\OptimizerChain\\":3:{s:13:\\"\\u0000*\\u0000optimizers\\";a:7:{i:0;O:42:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Jpegoptim\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m85\\";i:1;s:7:\\"--force\\";i:2;s:11:\\"--strip-all\\";i:3;s:17:\\"--all-progressive\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:9:\\"jpegoptim\\";}i:1;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Pngquant\\":5:{s:7:\\"options\\";a:1:{i:0;s:7:\\"--force\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"pngquant\\";}i:2;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Optipng\\":5:{s:7:\\"options\\";a:3:{i:0;s:3:\\"-i0\\";i:1;s:3:\\"-o2\\";i:2;s:6:\\"-quiet\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"optipng\\";}i:3;O:37:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Svgo\\":5:{s:7:\\"options\\";a:1:{i:0;s:20:\\"--disable=cleanupIDs\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:4:\\"svgo\\";}i:4;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Gifsicle\\":5:{s:7:\\"options\\";a:2:{i:0;s:2:\\"-b\\";i:1;s:3:\\"-O3\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"gifsicle\\";}i:5;O:38:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Cwebp\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m 6\\";i:1;s:8:\\"-pass 10\\";i:2;s:3:\\"-mt\\";i:3;s:5:\\"-q 90\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:5:\\"cwebp\\";}i:6;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Avifenc\\":6:{s:7:\\"options\\";a:8:{i:0;s:14:\\"-a cq-level=23\\";i:1;s:6:\\"-j all\\";i:2;s:7:\\"--min 0\\";i:3;s:8:\\"--max 63\\";i:4;s:12:\\"--minalpha 0\\";i:5;s:13:\\"--maxalpha 63\\";i:6;s:14:\\"-a end-usage=q\\";i:7;s:12:\\"-a tune=ssim\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"avifenc\\";s:16:\\"decodeBinaryName\\";s:7:\\"avifdec\\";}}s:9:\\"\\u0000*\\u0000logger\\";O:33:\\"Spatie\\\\ImageOptimizer\\\\DummyLogger\\":0:{}s:10:\\"\\u0000*\\u0000timeout\\";i:60;}}s:6:\\"format\\";a:1:{i:0;s:3:\\"jpg\\";}s:3:\\"fit\\";a:3:{i:0;r:83;i:1;i:400;i:2;i:400;}}}s:23:\\"\\u0000*\\u0000performOnCollections\\";a:0:{}s:17:\\"\\u0000*\\u0000performOnQueue\\";b:1;s:26:\\"\\u0000*\\u0000keepOriginalImageFormat\\";b:0;s:27:\\"\\u0000*\\u0000generateResponsiveImages\\";b:0;s:18:\\"\\u0000*\\u0000widthCalculator\\";N;s:24:\\"\\u0000*\\u0000loadingAttributeValue\\";N;s:16:\\"\\u0000*\\u0000pdfPageNumber\\";i:1;s:7:\\"\\u0000*\\u0000name\\";s:4:\\"icon\\";}}s:28:\\"\\u0000*\\u0000escapeWhenCastingToString\\";b:0;}s:8:\\"\\u0000*\\u0000media\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":5:{s:5:\\"class\\";s:49:\\"Spatie\\\\MediaLibrary\\\\MediaCollections\\\\Models\\\\Media\\";s:2:\\"id\\";i:16;s:9:\\"relations\\";a:0:{}s:10:\\"connection\\";s:5:\\"pgsql\\";s:15:\\"collectionClass\\";N;}s:14:\\"\\u0000*\\u0000onlyMissing\\";b:0;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:0:\\"\\";}"}}	0	\N	1720606446	1720606446
17	default	{"uuid":"943a3d05-29b9-435c-a69f-29bca75bf409","displayName":"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob","command":"O:58:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\\":5:{s:14:\\"\\u0000*\\u0000conversions\\";O:52:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\ConversionCollection\\":2:{s:8:\\"\\u0000*\\u0000items\\";a:2:{i:0;O:42:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\":11:{s:12:\\"\\u0000*\\u0000fileNamer\\";O:54:\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\":0:{}s:28:\\"\\u0000*\\u0000extractVideoFrameAtSecond\\";d:0;s:16:\\"\\u0000*\\u0000manipulations\\";O:45:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Manipulations\\":1:{s:16:\\"\\u0000*\\u0000manipulations\\";a:3:{s:8:\\"optimize\\";a:1:{i:0;O:36:\\"Spatie\\\\ImageOptimizer\\\\OptimizerChain\\":3:{s:13:\\"\\u0000*\\u0000optimizers\\";a:7:{i:0;O:42:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Jpegoptim\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m85\\";i:1;s:7:\\"--force\\";i:2;s:11:\\"--strip-all\\";i:3;s:17:\\"--all-progressive\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:9:\\"jpegoptim\\";}i:1;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Pngquant\\":5:{s:7:\\"options\\";a:1:{i:0;s:7:\\"--force\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"pngquant\\";}i:2;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Optipng\\":5:{s:7:\\"options\\";a:3:{i:0;s:3:\\"-i0\\";i:1;s:3:\\"-o2\\";i:2;s:6:\\"-quiet\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"optipng\\";}i:3;O:37:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Svgo\\":5:{s:7:\\"options\\";a:1:{i:0;s:20:\\"--disable=cleanupIDs\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:4:\\"svgo\\";}i:4;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Gifsicle\\":5:{s:7:\\"options\\";a:2:{i:0;s:2:\\"-b\\";i:1;s:3:\\"-O3\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"gifsicle\\";}i:5;O:38:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Cwebp\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m 6\\";i:1;s:8:\\"-pass 10\\";i:2;s:3:\\"-mt\\";i:3;s:5:\\"-q 90\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:5:\\"cwebp\\";}i:6;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Avifenc\\":6:{s:7:\\"options\\";a:8:{i:0;s:14:\\"-a cq-level=23\\";i:1;s:6:\\"-j all\\";i:2;s:7:\\"--min 0\\";i:3;s:8:\\"--max 63\\";i:4;s:12:\\"--minalpha 0\\";i:5;s:13:\\"--maxalpha 63\\";i:6;s:14:\\"-a end-usage=q\\";i:7;s:12:\\"-a tune=ssim\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"avifenc\\";s:16:\\"decodeBinaryName\\";s:7:\\"avifdec\\";}}s:9:\\"\\u0000*\\u0000logger\\";O:33:\\"Spatie\\\\ImageOptimizer\\\\DummyLogger\\":0:{}s:10:\\"\\u0000*\\u0000timeout\\";i:60;}}s:6:\\"format\\";a:1:{i:0;s:3:\\"jpg\\";}s:3:\\"fit\\";a:3:{i:0;E:27:\\"Spatie\\\\Image\\\\Enums\\\\Fit:Crop\\";i:1;i:600;i:2;i:600;}}}s:23:\\"\\u0000*\\u0000performOnCollections\\";a:0:{}s:17:\\"\\u0000*\\u0000performOnQueue\\";b:1;s:26:\\"\\u0000*\\u0000keepOriginalImageFormat\\";b:0;s:27:\\"\\u0000*\\u0000generateResponsiveImages\\";b:0;s:18:\\"\\u0000*\\u0000widthCalculator\\";N;s:24:\\"\\u0000*\\u0000loadingAttributeValue\\";N;s:16:\\"\\u0000*\\u0000pdfPageNumber\\";i:1;s:7:\\"\\u0000*\\u0000name\\";s:5:\\"thumb\\";}i:1;O:42:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\":11:{s:12:\\"\\u0000*\\u0000fileNamer\\";O:54:\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\":0:{}s:28:\\"\\u0000*\\u0000extractVideoFrameAtSecond\\";d:0;s:16:\\"\\u0000*\\u0000manipulations\\";O:45:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Manipulations\\":1:{s:16:\\"\\u0000*\\u0000manipulations\\";a:3:{s:8:\\"optimize\\";a:1:{i:0;O:36:\\"Spatie\\\\ImageOptimizer\\\\OptimizerChain\\":3:{s:13:\\"\\u0000*\\u0000optimizers\\";a:7:{i:0;O:42:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Jpegoptim\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m85\\";i:1;s:7:\\"--force\\";i:2;s:11:\\"--strip-all\\";i:3;s:17:\\"--all-progressive\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:9:\\"jpegoptim\\";}i:1;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Pngquant\\":5:{s:7:\\"options\\";a:1:{i:0;s:7:\\"--force\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"pngquant\\";}i:2;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Optipng\\":5:{s:7:\\"options\\";a:3:{i:0;s:3:\\"-i0\\";i:1;s:3:\\"-o2\\";i:2;s:6:\\"-quiet\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"optipng\\";}i:3;O:37:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Svgo\\":5:{s:7:\\"options\\";a:1:{i:0;s:20:\\"--disable=cleanupIDs\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:4:\\"svgo\\";}i:4;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Gifsicle\\":5:{s:7:\\"options\\";a:2:{i:0;s:2:\\"-b\\";i:1;s:3:\\"-O3\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"gifsicle\\";}i:5;O:38:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Cwebp\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m 6\\";i:1;s:8:\\"-pass 10\\";i:2;s:3:\\"-mt\\";i:3;s:5:\\"-q 90\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:5:\\"cwebp\\";}i:6;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Avifenc\\":6:{s:7:\\"options\\";a:8:{i:0;s:14:\\"-a cq-level=23\\";i:1;s:6:\\"-j all\\";i:2;s:7:\\"--min 0\\";i:3;s:8:\\"--max 63\\";i:4;s:12:\\"--minalpha 0\\";i:5;s:13:\\"--maxalpha 63\\";i:6;s:14:\\"-a end-usage=q\\";i:7;s:12:\\"-a tune=ssim\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"avifenc\\";s:16:\\"decodeBinaryName\\";s:7:\\"avifdec\\";}}s:9:\\"\\u0000*\\u0000logger\\";O:33:\\"Spatie\\\\ImageOptimizer\\\\DummyLogger\\":0:{}s:10:\\"\\u0000*\\u0000timeout\\";i:60;}}s:6:\\"format\\";a:1:{i:0;s:3:\\"jpg\\";}s:3:\\"fit\\";a:3:{i:0;r:83;i:1;i:400;i:2;i:400;}}}s:23:\\"\\u0000*\\u0000performOnCollections\\";a:0:{}s:17:\\"\\u0000*\\u0000performOnQueue\\";b:1;s:26:\\"\\u0000*\\u0000keepOriginalImageFormat\\";b:0;s:27:\\"\\u0000*\\u0000generateResponsiveImages\\";b:0;s:18:\\"\\u0000*\\u0000widthCalculator\\";N;s:24:\\"\\u0000*\\u0000loadingAttributeValue\\";N;s:16:\\"\\u0000*\\u0000pdfPageNumber\\";i:1;s:7:\\"\\u0000*\\u0000name\\";s:4:\\"icon\\";}}s:28:\\"\\u0000*\\u0000escapeWhenCastingToString\\";b:0;}s:8:\\"\\u0000*\\u0000media\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":5:{s:5:\\"class\\";s:49:\\"Spatie\\\\MediaLibrary\\\\MediaCollections\\\\Models\\\\Media\\";s:2:\\"id\\";i:17;s:9:\\"relations\\";a:0:{}s:10:\\"connection\\";s:5:\\"pgsql\\";s:15:\\"collectionClass\\";N;}s:14:\\"\\u0000*\\u0000onlyMissing\\";b:0;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:0:\\"\\";}"}}	0	\N	1720606517	1720606517
18	default	{"uuid":"6b21dff9-e6de-4320-8987-a94d80402d19","displayName":"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob","command":"O:58:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\\":5:{s:14:\\"\\u0000*\\u0000conversions\\";O:52:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\ConversionCollection\\":2:{s:8:\\"\\u0000*\\u0000items\\";a:2:{i:0;O:42:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\":11:{s:12:\\"\\u0000*\\u0000fileNamer\\";O:54:\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\":0:{}s:28:\\"\\u0000*\\u0000extractVideoFrameAtSecond\\";d:0;s:16:\\"\\u0000*\\u0000manipulations\\";O:45:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Manipulations\\":1:{s:16:\\"\\u0000*\\u0000manipulations\\";a:3:{s:8:\\"optimize\\";a:1:{i:0;O:36:\\"Spatie\\\\ImageOptimizer\\\\OptimizerChain\\":3:{s:13:\\"\\u0000*\\u0000optimizers\\";a:7:{i:0;O:42:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Jpegoptim\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m85\\";i:1;s:7:\\"--force\\";i:2;s:11:\\"--strip-all\\";i:3;s:17:\\"--all-progressive\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:9:\\"jpegoptim\\";}i:1;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Pngquant\\":5:{s:7:\\"options\\";a:1:{i:0;s:7:\\"--force\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"pngquant\\";}i:2;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Optipng\\":5:{s:7:\\"options\\";a:3:{i:0;s:3:\\"-i0\\";i:1;s:3:\\"-o2\\";i:2;s:6:\\"-quiet\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"optipng\\";}i:3;O:37:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Svgo\\":5:{s:7:\\"options\\";a:1:{i:0;s:20:\\"--disable=cleanupIDs\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:4:\\"svgo\\";}i:4;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Gifsicle\\":5:{s:7:\\"options\\";a:2:{i:0;s:2:\\"-b\\";i:1;s:3:\\"-O3\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"gifsicle\\";}i:5;O:38:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Cwebp\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m 6\\";i:1;s:8:\\"-pass 10\\";i:2;s:3:\\"-mt\\";i:3;s:5:\\"-q 90\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:5:\\"cwebp\\";}i:6;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Avifenc\\":6:{s:7:\\"options\\";a:8:{i:0;s:14:\\"-a cq-level=23\\";i:1;s:6:\\"-j all\\";i:2;s:7:\\"--min 0\\";i:3;s:8:\\"--max 63\\";i:4;s:12:\\"--minalpha 0\\";i:5;s:13:\\"--maxalpha 63\\";i:6;s:14:\\"-a end-usage=q\\";i:7;s:12:\\"-a tune=ssim\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"avifenc\\";s:16:\\"decodeBinaryName\\";s:7:\\"avifdec\\";}}s:9:\\"\\u0000*\\u0000logger\\";O:33:\\"Spatie\\\\ImageOptimizer\\\\DummyLogger\\":0:{}s:10:\\"\\u0000*\\u0000timeout\\";i:60;}}s:6:\\"format\\";a:1:{i:0;s:3:\\"jpg\\";}s:3:\\"fit\\";a:3:{i:0;E:27:\\"Spatie\\\\Image\\\\Enums\\\\Fit:Crop\\";i:1;i:800;i:2;i:800;}}}s:23:\\"\\u0000*\\u0000performOnCollections\\";a:0:{}s:17:\\"\\u0000*\\u0000performOnQueue\\";b:1;s:26:\\"\\u0000*\\u0000keepOriginalImageFormat\\";b:0;s:27:\\"\\u0000*\\u0000generateResponsiveImages\\";b:0;s:18:\\"\\u0000*\\u0000widthCalculator\\";N;s:24:\\"\\u0000*\\u0000loadingAttributeValue\\";N;s:16:\\"\\u0000*\\u0000pdfPageNumber\\";i:1;s:7:\\"\\u0000*\\u0000name\\";s:5:\\"thumb\\";}i:1;O:42:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\":11:{s:12:\\"\\u0000*\\u0000fileNamer\\";O:54:\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\":0:{}s:28:\\"\\u0000*\\u0000extractVideoFrameAtSecond\\";d:0;s:16:\\"\\u0000*\\u0000manipulations\\";O:45:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Manipulations\\":1:{s:16:\\"\\u0000*\\u0000manipulations\\";a:3:{s:8:\\"optimize\\";a:1:{i:0;O:36:\\"Spatie\\\\ImageOptimizer\\\\OptimizerChain\\":3:{s:13:\\"\\u0000*\\u0000optimizers\\";a:7:{i:0;O:42:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Jpegoptim\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m85\\";i:1;s:7:\\"--force\\";i:2;s:11:\\"--strip-all\\";i:3;s:17:\\"--all-progressive\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:9:\\"jpegoptim\\";}i:1;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Pngquant\\":5:{s:7:\\"options\\";a:1:{i:0;s:7:\\"--force\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"pngquant\\";}i:2;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Optipng\\":5:{s:7:\\"options\\";a:3:{i:0;s:3:\\"-i0\\";i:1;s:3:\\"-o2\\";i:2;s:6:\\"-quiet\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"optipng\\";}i:3;O:37:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Svgo\\":5:{s:7:\\"options\\";a:1:{i:0;s:20:\\"--disable=cleanupIDs\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:4:\\"svgo\\";}i:4;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Gifsicle\\":5:{s:7:\\"options\\";a:2:{i:0;s:2:\\"-b\\";i:1;s:3:\\"-O3\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"gifsicle\\";}i:5;O:38:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Cwebp\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m 6\\";i:1;s:8:\\"-pass 10\\";i:2;s:3:\\"-mt\\";i:3;s:5:\\"-q 90\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:5:\\"cwebp\\";}i:6;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Avifenc\\":6:{s:7:\\"options\\";a:8:{i:0;s:14:\\"-a cq-level=23\\";i:1;s:6:\\"-j all\\";i:2;s:7:\\"--min 0\\";i:3;s:8:\\"--max 63\\";i:4;s:12:\\"--minalpha 0\\";i:5;s:13:\\"--maxalpha 63\\";i:6;s:14:\\"-a end-usage=q\\";i:7;s:12:\\"-a tune=ssim\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"avifenc\\";s:16:\\"decodeBinaryName\\";s:7:\\"avifdec\\";}}s:9:\\"\\u0000*\\u0000logger\\";O:33:\\"Spatie\\\\ImageOptimizer\\\\DummyLogger\\":0:{}s:10:\\"\\u0000*\\u0000timeout\\";i:60;}}s:6:\\"format\\";a:1:{i:0;s:3:\\"jpg\\";}s:3:\\"fit\\";a:3:{i:0;r:83;i:1;i:600;i:2;i:600;}}}s:23:\\"\\u0000*\\u0000performOnCollections\\";a:0:{}s:17:\\"\\u0000*\\u0000performOnQueue\\";b:1;s:26:\\"\\u0000*\\u0000keepOriginalImageFormat\\";b:0;s:27:\\"\\u0000*\\u0000generateResponsiveImages\\";b:0;s:18:\\"\\u0000*\\u0000widthCalculator\\";N;s:24:\\"\\u0000*\\u0000loadingAttributeValue\\";N;s:16:\\"\\u0000*\\u0000pdfPageNumber\\";i:1;s:7:\\"\\u0000*\\u0000name\\";s:4:\\"icon\\";}}s:28:\\"\\u0000*\\u0000escapeWhenCastingToString\\";b:0;}s:8:\\"\\u0000*\\u0000media\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":5:{s:5:\\"class\\";s:49:\\"Spatie\\\\MediaLibrary\\\\MediaCollections\\\\Models\\\\Media\\";s:2:\\"id\\";i:18;s:9:\\"relations\\";a:0:{}s:10:\\"connection\\";s:5:\\"pgsql\\";s:15:\\"collectionClass\\";N;}s:14:\\"\\u0000*\\u0000onlyMissing\\";b:0;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:0:\\"\\";}"}}	0	\N	1720708769	1720708769
19	default	{"uuid":"cdc99092-11c8-4aa1-abde-9d7a02acd23f","displayName":"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob","command":"O:58:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\\":5:{s:14:\\"\\u0000*\\u0000conversions\\";O:52:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\ConversionCollection\\":2:{s:8:\\"\\u0000*\\u0000items\\";a:2:{i:0;O:42:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\":11:{s:12:\\"\\u0000*\\u0000fileNamer\\";O:54:\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\":0:{}s:28:\\"\\u0000*\\u0000extractVideoFrameAtSecond\\";d:0;s:16:\\"\\u0000*\\u0000manipulations\\";O:45:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Manipulations\\":1:{s:16:\\"\\u0000*\\u0000manipulations\\";a:3:{s:8:\\"optimize\\";a:1:{i:0;O:36:\\"Spatie\\\\ImageOptimizer\\\\OptimizerChain\\":3:{s:13:\\"\\u0000*\\u0000optimizers\\";a:7:{i:0;O:42:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Jpegoptim\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m85\\";i:1;s:7:\\"--force\\";i:2;s:11:\\"--strip-all\\";i:3;s:17:\\"--all-progressive\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:9:\\"jpegoptim\\";}i:1;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Pngquant\\":5:{s:7:\\"options\\";a:1:{i:0;s:7:\\"--force\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"pngquant\\";}i:2;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Optipng\\":5:{s:7:\\"options\\";a:3:{i:0;s:3:\\"-i0\\";i:1;s:3:\\"-o2\\";i:2;s:6:\\"-quiet\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"optipng\\";}i:3;O:37:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Svgo\\":5:{s:7:\\"options\\";a:1:{i:0;s:20:\\"--disable=cleanupIDs\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:4:\\"svgo\\";}i:4;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Gifsicle\\":5:{s:7:\\"options\\";a:2:{i:0;s:2:\\"-b\\";i:1;s:3:\\"-O3\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"gifsicle\\";}i:5;O:38:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Cwebp\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m 6\\";i:1;s:8:\\"-pass 10\\";i:2;s:3:\\"-mt\\";i:3;s:5:\\"-q 90\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:5:\\"cwebp\\";}i:6;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Avifenc\\":6:{s:7:\\"options\\";a:8:{i:0;s:14:\\"-a cq-level=23\\";i:1;s:6:\\"-j all\\";i:2;s:7:\\"--min 0\\";i:3;s:8:\\"--max 63\\";i:4;s:12:\\"--minalpha 0\\";i:5;s:13:\\"--maxalpha 63\\";i:6;s:14:\\"-a end-usage=q\\";i:7;s:12:\\"-a tune=ssim\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"avifenc\\";s:16:\\"decodeBinaryName\\";s:7:\\"avifdec\\";}}s:9:\\"\\u0000*\\u0000logger\\";O:33:\\"Spatie\\\\ImageOptimizer\\\\DummyLogger\\":0:{}s:10:\\"\\u0000*\\u0000timeout\\";i:60;}}s:6:\\"format\\";a:1:{i:0;s:3:\\"jpg\\";}s:3:\\"fit\\";a:3:{i:0;E:27:\\"Spatie\\\\Image\\\\Enums\\\\Fit:Crop\\";i:1;i:800;i:2;i:800;}}}s:23:\\"\\u0000*\\u0000performOnCollections\\";a:0:{}s:17:\\"\\u0000*\\u0000performOnQueue\\";b:1;s:26:\\"\\u0000*\\u0000keepOriginalImageFormat\\";b:0;s:27:\\"\\u0000*\\u0000generateResponsiveImages\\";b:0;s:18:\\"\\u0000*\\u0000widthCalculator\\";N;s:24:\\"\\u0000*\\u0000loadingAttributeValue\\";N;s:16:\\"\\u0000*\\u0000pdfPageNumber\\";i:1;s:7:\\"\\u0000*\\u0000name\\";s:5:\\"thumb\\";}i:1;O:42:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\":11:{s:12:\\"\\u0000*\\u0000fileNamer\\";O:54:\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\":0:{}s:28:\\"\\u0000*\\u0000extractVideoFrameAtSecond\\";d:0;s:16:\\"\\u0000*\\u0000manipulations\\";O:45:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Manipulations\\":1:{s:16:\\"\\u0000*\\u0000manipulations\\";a:3:{s:8:\\"optimize\\";a:1:{i:0;O:36:\\"Spatie\\\\ImageOptimizer\\\\OptimizerChain\\":3:{s:13:\\"\\u0000*\\u0000optimizers\\";a:7:{i:0;O:42:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Jpegoptim\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m85\\";i:1;s:7:\\"--force\\";i:2;s:11:\\"--strip-all\\";i:3;s:17:\\"--all-progressive\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:9:\\"jpegoptim\\";}i:1;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Pngquant\\":5:{s:7:\\"options\\";a:1:{i:0;s:7:\\"--force\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"pngquant\\";}i:2;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Optipng\\":5:{s:7:\\"options\\";a:3:{i:0;s:3:\\"-i0\\";i:1;s:3:\\"-o2\\";i:2;s:6:\\"-quiet\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"optipng\\";}i:3;O:37:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Svgo\\":5:{s:7:\\"options\\";a:1:{i:0;s:20:\\"--disable=cleanupIDs\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:4:\\"svgo\\";}i:4;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Gifsicle\\":5:{s:7:\\"options\\";a:2:{i:0;s:2:\\"-b\\";i:1;s:3:\\"-O3\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"gifsicle\\";}i:5;O:38:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Cwebp\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m 6\\";i:1;s:8:\\"-pass 10\\";i:2;s:3:\\"-mt\\";i:3;s:5:\\"-q 90\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:5:\\"cwebp\\";}i:6;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Avifenc\\":6:{s:7:\\"options\\";a:8:{i:0;s:14:\\"-a cq-level=23\\";i:1;s:6:\\"-j all\\";i:2;s:7:\\"--min 0\\";i:3;s:8:\\"--max 63\\";i:4;s:12:\\"--minalpha 0\\";i:5;s:13:\\"--maxalpha 63\\";i:6;s:14:\\"-a end-usage=q\\";i:7;s:12:\\"-a tune=ssim\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"avifenc\\";s:16:\\"decodeBinaryName\\";s:7:\\"avifdec\\";}}s:9:\\"\\u0000*\\u0000logger\\";O:33:\\"Spatie\\\\ImageOptimizer\\\\DummyLogger\\":0:{}s:10:\\"\\u0000*\\u0000timeout\\";i:60;}}s:6:\\"format\\";a:1:{i:0;s:3:\\"jpg\\";}s:3:\\"fit\\";a:3:{i:0;r:83;i:1;i:600;i:2;i:600;}}}s:23:\\"\\u0000*\\u0000performOnCollections\\";a:0:{}s:17:\\"\\u0000*\\u0000performOnQueue\\";b:1;s:26:\\"\\u0000*\\u0000keepOriginalImageFormat\\";b:0;s:27:\\"\\u0000*\\u0000generateResponsiveImages\\";b:0;s:18:\\"\\u0000*\\u0000widthCalculator\\";N;s:24:\\"\\u0000*\\u0000loadingAttributeValue\\";N;s:16:\\"\\u0000*\\u0000pdfPageNumber\\";i:1;s:7:\\"\\u0000*\\u0000name\\";s:4:\\"icon\\";}}s:28:\\"\\u0000*\\u0000escapeWhenCastingToString\\";b:0;}s:8:\\"\\u0000*\\u0000media\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":5:{s:5:\\"class\\";s:49:\\"Spatie\\\\MediaLibrary\\\\MediaCollections\\\\Models\\\\Media\\";s:2:\\"id\\";i:19;s:9:\\"relations\\";a:0:{}s:10:\\"connection\\";s:5:\\"pgsql\\";s:15:\\"collectionClass\\";N;}s:14:\\"\\u0000*\\u0000onlyMissing\\";b:0;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:0:\\"\\";}"}}	0	\N	1720708770	1720708770
20	default	{"uuid":"20ed24c9-9230-4c0d-97fa-3001dbfccc23","displayName":"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob","command":"O:58:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\\":5:{s:14:\\"\\u0000*\\u0000conversions\\";O:52:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\ConversionCollection\\":2:{s:8:\\"\\u0000*\\u0000items\\";a:2:{i:0;O:42:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\":11:{s:12:\\"\\u0000*\\u0000fileNamer\\";O:54:\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\":0:{}s:28:\\"\\u0000*\\u0000extractVideoFrameAtSecond\\";d:0;s:16:\\"\\u0000*\\u0000manipulations\\";O:45:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Manipulations\\":1:{s:16:\\"\\u0000*\\u0000manipulations\\";a:3:{s:8:\\"optimize\\";a:1:{i:0;O:36:\\"Spatie\\\\ImageOptimizer\\\\OptimizerChain\\":3:{s:13:\\"\\u0000*\\u0000optimizers\\";a:7:{i:0;O:42:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Jpegoptim\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m85\\";i:1;s:7:\\"--force\\";i:2;s:11:\\"--strip-all\\";i:3;s:17:\\"--all-progressive\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:9:\\"jpegoptim\\";}i:1;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Pngquant\\":5:{s:7:\\"options\\";a:1:{i:0;s:7:\\"--force\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"pngquant\\";}i:2;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Optipng\\":5:{s:7:\\"options\\";a:3:{i:0;s:3:\\"-i0\\";i:1;s:3:\\"-o2\\";i:2;s:6:\\"-quiet\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"optipng\\";}i:3;O:37:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Svgo\\":5:{s:7:\\"options\\";a:1:{i:0;s:20:\\"--disable=cleanupIDs\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:4:\\"svgo\\";}i:4;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Gifsicle\\":5:{s:7:\\"options\\";a:2:{i:0;s:2:\\"-b\\";i:1;s:3:\\"-O3\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"gifsicle\\";}i:5;O:38:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Cwebp\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m 6\\";i:1;s:8:\\"-pass 10\\";i:2;s:3:\\"-mt\\";i:3;s:5:\\"-q 90\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:5:\\"cwebp\\";}i:6;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Avifenc\\":6:{s:7:\\"options\\";a:8:{i:0;s:14:\\"-a cq-level=23\\";i:1;s:6:\\"-j all\\";i:2;s:7:\\"--min 0\\";i:3;s:8:\\"--max 63\\";i:4;s:12:\\"--minalpha 0\\";i:5;s:13:\\"--maxalpha 63\\";i:6;s:14:\\"-a end-usage=q\\";i:7;s:12:\\"-a tune=ssim\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"avifenc\\";s:16:\\"decodeBinaryName\\";s:7:\\"avifdec\\";}}s:9:\\"\\u0000*\\u0000logger\\";O:33:\\"Spatie\\\\ImageOptimizer\\\\DummyLogger\\":0:{}s:10:\\"\\u0000*\\u0000timeout\\";i:60;}}s:6:\\"format\\";a:1:{i:0;s:3:\\"jpg\\";}s:3:\\"fit\\";a:3:{i:0;E:27:\\"Spatie\\\\Image\\\\Enums\\\\Fit:Crop\\";i:1;i:800;i:2;i:800;}}}s:23:\\"\\u0000*\\u0000performOnCollections\\";a:0:{}s:17:\\"\\u0000*\\u0000performOnQueue\\";b:1;s:26:\\"\\u0000*\\u0000keepOriginalImageFormat\\";b:0;s:27:\\"\\u0000*\\u0000generateResponsiveImages\\";b:0;s:18:\\"\\u0000*\\u0000widthCalculator\\";N;s:24:\\"\\u0000*\\u0000loadingAttributeValue\\";N;s:16:\\"\\u0000*\\u0000pdfPageNumber\\";i:1;s:7:\\"\\u0000*\\u0000name\\";s:5:\\"thumb\\";}i:1;O:42:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\":11:{s:12:\\"\\u0000*\\u0000fileNamer\\";O:54:\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\":0:{}s:28:\\"\\u0000*\\u0000extractVideoFrameAtSecond\\";d:0;s:16:\\"\\u0000*\\u0000manipulations\\";O:45:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Manipulations\\":1:{s:16:\\"\\u0000*\\u0000manipulations\\";a:3:{s:8:\\"optimize\\";a:1:{i:0;O:36:\\"Spatie\\\\ImageOptimizer\\\\OptimizerChain\\":3:{s:13:\\"\\u0000*\\u0000optimizers\\";a:7:{i:0;O:42:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Jpegoptim\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m85\\";i:1;s:7:\\"--force\\";i:2;s:11:\\"--strip-all\\";i:3;s:17:\\"--all-progressive\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:9:\\"jpegoptim\\";}i:1;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Pngquant\\":5:{s:7:\\"options\\";a:1:{i:0;s:7:\\"--force\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"pngquant\\";}i:2;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Optipng\\":5:{s:7:\\"options\\";a:3:{i:0;s:3:\\"-i0\\";i:1;s:3:\\"-o2\\";i:2;s:6:\\"-quiet\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"optipng\\";}i:3;O:37:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Svgo\\":5:{s:7:\\"options\\";a:1:{i:0;s:20:\\"--disable=cleanupIDs\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:4:\\"svgo\\";}i:4;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Gifsicle\\":5:{s:7:\\"options\\";a:2:{i:0;s:2:\\"-b\\";i:1;s:3:\\"-O3\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"gifsicle\\";}i:5;O:38:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Cwebp\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m 6\\";i:1;s:8:\\"-pass 10\\";i:2;s:3:\\"-mt\\";i:3;s:5:\\"-q 90\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:5:\\"cwebp\\";}i:6;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Avifenc\\":6:{s:7:\\"options\\";a:8:{i:0;s:14:\\"-a cq-level=23\\";i:1;s:6:\\"-j all\\";i:2;s:7:\\"--min 0\\";i:3;s:8:\\"--max 63\\";i:4;s:12:\\"--minalpha 0\\";i:5;s:13:\\"--maxalpha 63\\";i:6;s:14:\\"-a end-usage=q\\";i:7;s:12:\\"-a tune=ssim\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"avifenc\\";s:16:\\"decodeBinaryName\\";s:7:\\"avifdec\\";}}s:9:\\"\\u0000*\\u0000logger\\";O:33:\\"Spatie\\\\ImageOptimizer\\\\DummyLogger\\":0:{}s:10:\\"\\u0000*\\u0000timeout\\";i:60;}}s:6:\\"format\\";a:1:{i:0;s:3:\\"jpg\\";}s:3:\\"fit\\";a:3:{i:0;r:83;i:1;i:600;i:2;i:600;}}}s:23:\\"\\u0000*\\u0000performOnCollections\\";a:0:{}s:17:\\"\\u0000*\\u0000performOnQueue\\";b:1;s:26:\\"\\u0000*\\u0000keepOriginalImageFormat\\";b:0;s:27:\\"\\u0000*\\u0000generateResponsiveImages\\";b:0;s:18:\\"\\u0000*\\u0000widthCalculator\\";N;s:24:\\"\\u0000*\\u0000loadingAttributeValue\\";N;s:16:\\"\\u0000*\\u0000pdfPageNumber\\";i:1;s:7:\\"\\u0000*\\u0000name\\";s:4:\\"icon\\";}}s:28:\\"\\u0000*\\u0000escapeWhenCastingToString\\";b:0;}s:8:\\"\\u0000*\\u0000media\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":5:{s:5:\\"class\\";s:49:\\"Spatie\\\\MediaLibrary\\\\MediaCollections\\\\Models\\\\Media\\";s:2:\\"id\\";i:20;s:9:\\"relations\\";a:0:{}s:10:\\"connection\\";s:5:\\"pgsql\\";s:15:\\"collectionClass\\";N;}s:14:\\"\\u0000*\\u0000onlyMissing\\";b:0;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:0:\\"\\";}"}}	0	\N	1720708802	1720708802
21	default	{"uuid":"15a7f4fd-8beb-4a80-b321-161784c28fbb","displayName":"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob","command":"O:58:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\\":5:{s:14:\\"\\u0000*\\u0000conversions\\";O:52:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\ConversionCollection\\":2:{s:8:\\"\\u0000*\\u0000items\\";a:2:{i:0;O:42:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\":11:{s:12:\\"\\u0000*\\u0000fileNamer\\";O:54:\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\":0:{}s:28:\\"\\u0000*\\u0000extractVideoFrameAtSecond\\";d:0;s:16:\\"\\u0000*\\u0000manipulations\\";O:45:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Manipulations\\":1:{s:16:\\"\\u0000*\\u0000manipulations\\";a:3:{s:8:\\"optimize\\";a:1:{i:0;O:36:\\"Spatie\\\\ImageOptimizer\\\\OptimizerChain\\":3:{s:13:\\"\\u0000*\\u0000optimizers\\";a:7:{i:0;O:42:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Jpegoptim\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m85\\";i:1;s:7:\\"--force\\";i:2;s:11:\\"--strip-all\\";i:3;s:17:\\"--all-progressive\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:9:\\"jpegoptim\\";}i:1;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Pngquant\\":5:{s:7:\\"options\\";a:1:{i:0;s:7:\\"--force\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"pngquant\\";}i:2;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Optipng\\":5:{s:7:\\"options\\";a:3:{i:0;s:3:\\"-i0\\";i:1;s:3:\\"-o2\\";i:2;s:6:\\"-quiet\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"optipng\\";}i:3;O:37:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Svgo\\":5:{s:7:\\"options\\";a:1:{i:0;s:20:\\"--disable=cleanupIDs\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:4:\\"svgo\\";}i:4;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Gifsicle\\":5:{s:7:\\"options\\";a:2:{i:0;s:2:\\"-b\\";i:1;s:3:\\"-O3\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"gifsicle\\";}i:5;O:38:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Cwebp\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m 6\\";i:1;s:8:\\"-pass 10\\";i:2;s:3:\\"-mt\\";i:3;s:5:\\"-q 90\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:5:\\"cwebp\\";}i:6;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Avifenc\\":6:{s:7:\\"options\\";a:8:{i:0;s:14:\\"-a cq-level=23\\";i:1;s:6:\\"-j all\\";i:2;s:7:\\"--min 0\\";i:3;s:8:\\"--max 63\\";i:4;s:12:\\"--minalpha 0\\";i:5;s:13:\\"--maxalpha 63\\";i:6;s:14:\\"-a end-usage=q\\";i:7;s:12:\\"-a tune=ssim\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"avifenc\\";s:16:\\"decodeBinaryName\\";s:7:\\"avifdec\\";}}s:9:\\"\\u0000*\\u0000logger\\";O:33:\\"Spatie\\\\ImageOptimizer\\\\DummyLogger\\":0:{}s:10:\\"\\u0000*\\u0000timeout\\";i:60;}}s:6:\\"format\\";a:1:{i:0;s:3:\\"jpg\\";}s:3:\\"fit\\";a:3:{i:0;E:27:\\"Spatie\\\\Image\\\\Enums\\\\Fit:Crop\\";i:1;i:800;i:2;i:800;}}}s:23:\\"\\u0000*\\u0000performOnCollections\\";a:0:{}s:17:\\"\\u0000*\\u0000performOnQueue\\";b:1;s:26:\\"\\u0000*\\u0000keepOriginalImageFormat\\";b:0;s:27:\\"\\u0000*\\u0000generateResponsiveImages\\";b:0;s:18:\\"\\u0000*\\u0000widthCalculator\\";N;s:24:\\"\\u0000*\\u0000loadingAttributeValue\\";N;s:16:\\"\\u0000*\\u0000pdfPageNumber\\";i:1;s:7:\\"\\u0000*\\u0000name\\";s:5:\\"thumb\\";}i:1;O:42:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\":11:{s:12:\\"\\u0000*\\u0000fileNamer\\";O:54:\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\":0:{}s:28:\\"\\u0000*\\u0000extractVideoFrameAtSecond\\";d:0;s:16:\\"\\u0000*\\u0000manipulations\\";O:45:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Manipulations\\":1:{s:16:\\"\\u0000*\\u0000manipulations\\";a:3:{s:8:\\"optimize\\";a:1:{i:0;O:36:\\"Spatie\\\\ImageOptimizer\\\\OptimizerChain\\":3:{s:13:\\"\\u0000*\\u0000optimizers\\";a:7:{i:0;O:42:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Jpegoptim\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m85\\";i:1;s:7:\\"--force\\";i:2;s:11:\\"--strip-all\\";i:3;s:17:\\"--all-progressive\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:9:\\"jpegoptim\\";}i:1;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Pngquant\\":5:{s:7:\\"options\\";a:1:{i:0;s:7:\\"--force\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"pngquant\\";}i:2;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Optipng\\":5:{s:7:\\"options\\";a:3:{i:0;s:3:\\"-i0\\";i:1;s:3:\\"-o2\\";i:2;s:6:\\"-quiet\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"optipng\\";}i:3;O:37:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Svgo\\":5:{s:7:\\"options\\";a:1:{i:0;s:20:\\"--disable=cleanupIDs\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:4:\\"svgo\\";}i:4;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Gifsicle\\":5:{s:7:\\"options\\";a:2:{i:0;s:2:\\"-b\\";i:1;s:3:\\"-O3\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"gifsicle\\";}i:5;O:38:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Cwebp\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m 6\\";i:1;s:8:\\"-pass 10\\";i:2;s:3:\\"-mt\\";i:3;s:5:\\"-q 90\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:5:\\"cwebp\\";}i:6;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Avifenc\\":6:{s:7:\\"options\\";a:8:{i:0;s:14:\\"-a cq-level=23\\";i:1;s:6:\\"-j all\\";i:2;s:7:\\"--min 0\\";i:3;s:8:\\"--max 63\\";i:4;s:12:\\"--minalpha 0\\";i:5;s:13:\\"--maxalpha 63\\";i:6;s:14:\\"-a end-usage=q\\";i:7;s:12:\\"-a tune=ssim\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"avifenc\\";s:16:\\"decodeBinaryName\\";s:7:\\"avifdec\\";}}s:9:\\"\\u0000*\\u0000logger\\";O:33:\\"Spatie\\\\ImageOptimizer\\\\DummyLogger\\":0:{}s:10:\\"\\u0000*\\u0000timeout\\";i:60;}}s:6:\\"format\\";a:1:{i:0;s:3:\\"jpg\\";}s:3:\\"fit\\";a:3:{i:0;r:83;i:1;i:600;i:2;i:600;}}}s:23:\\"\\u0000*\\u0000performOnCollections\\";a:0:{}s:17:\\"\\u0000*\\u0000performOnQueue\\";b:1;s:26:\\"\\u0000*\\u0000keepOriginalImageFormat\\";b:0;s:27:\\"\\u0000*\\u0000generateResponsiveImages\\";b:0;s:18:\\"\\u0000*\\u0000widthCalculator\\";N;s:24:\\"\\u0000*\\u0000loadingAttributeValue\\";N;s:16:\\"\\u0000*\\u0000pdfPageNumber\\";i:1;s:7:\\"\\u0000*\\u0000name\\";s:4:\\"icon\\";}}s:28:\\"\\u0000*\\u0000escapeWhenCastingToString\\";b:0;}s:8:\\"\\u0000*\\u0000media\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":5:{s:5:\\"class\\";s:49:\\"Spatie\\\\MediaLibrary\\\\MediaCollections\\\\Models\\\\Media\\";s:2:\\"id\\";i:21;s:9:\\"relations\\";a:0:{}s:10:\\"connection\\";s:5:\\"pgsql\\";s:15:\\"collectionClass\\";N;}s:14:\\"\\u0000*\\u0000onlyMissing\\";b:0;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:0:\\"\\";}"}}	0	\N	1720708833	1720708833
22	default	{"uuid":"757b3208-8e12-4f31-98c2-dc0c0c1b1e9e","displayName":"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob","command":"O:58:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\\":5:{s:14:\\"\\u0000*\\u0000conversions\\";O:52:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\ConversionCollection\\":2:{s:8:\\"\\u0000*\\u0000items\\";a:2:{i:0;O:42:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\":11:{s:12:\\"\\u0000*\\u0000fileNamer\\";O:54:\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\":0:{}s:28:\\"\\u0000*\\u0000extractVideoFrameAtSecond\\";d:0;s:16:\\"\\u0000*\\u0000manipulations\\";O:45:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Manipulations\\":1:{s:16:\\"\\u0000*\\u0000manipulations\\";a:3:{s:8:\\"optimize\\";a:1:{i:0;O:36:\\"Spatie\\\\ImageOptimizer\\\\OptimizerChain\\":3:{s:13:\\"\\u0000*\\u0000optimizers\\";a:7:{i:0;O:42:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Jpegoptim\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m85\\";i:1;s:7:\\"--force\\";i:2;s:11:\\"--strip-all\\";i:3;s:17:\\"--all-progressive\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:9:\\"jpegoptim\\";}i:1;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Pngquant\\":5:{s:7:\\"options\\";a:1:{i:0;s:7:\\"--force\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"pngquant\\";}i:2;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Optipng\\":5:{s:7:\\"options\\";a:3:{i:0;s:3:\\"-i0\\";i:1;s:3:\\"-o2\\";i:2;s:6:\\"-quiet\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"optipng\\";}i:3;O:37:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Svgo\\":5:{s:7:\\"options\\";a:1:{i:0;s:20:\\"--disable=cleanupIDs\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:4:\\"svgo\\";}i:4;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Gifsicle\\":5:{s:7:\\"options\\";a:2:{i:0;s:2:\\"-b\\";i:1;s:3:\\"-O3\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"gifsicle\\";}i:5;O:38:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Cwebp\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m 6\\";i:1;s:8:\\"-pass 10\\";i:2;s:3:\\"-mt\\";i:3;s:5:\\"-q 90\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:5:\\"cwebp\\";}i:6;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Avifenc\\":6:{s:7:\\"options\\";a:8:{i:0;s:14:\\"-a cq-level=23\\";i:1;s:6:\\"-j all\\";i:2;s:7:\\"--min 0\\";i:3;s:8:\\"--max 63\\";i:4;s:12:\\"--minalpha 0\\";i:5;s:13:\\"--maxalpha 63\\";i:6;s:14:\\"-a end-usage=q\\";i:7;s:12:\\"-a tune=ssim\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"avifenc\\";s:16:\\"decodeBinaryName\\";s:7:\\"avifdec\\";}}s:9:\\"\\u0000*\\u0000logger\\";O:33:\\"Spatie\\\\ImageOptimizer\\\\DummyLogger\\":0:{}s:10:\\"\\u0000*\\u0000timeout\\";i:60;}}s:6:\\"format\\";a:1:{i:0;s:3:\\"jpg\\";}s:3:\\"fit\\";a:3:{i:0;E:27:\\"Spatie\\\\Image\\\\Enums\\\\Fit:Crop\\";i:1;i:600;i:2;i:600;}}}s:23:\\"\\u0000*\\u0000performOnCollections\\";a:0:{}s:17:\\"\\u0000*\\u0000performOnQueue\\";b:1;s:26:\\"\\u0000*\\u0000keepOriginalImageFormat\\";b:0;s:27:\\"\\u0000*\\u0000generateResponsiveImages\\";b:0;s:18:\\"\\u0000*\\u0000widthCalculator\\";N;s:24:\\"\\u0000*\\u0000loadingAttributeValue\\";N;s:16:\\"\\u0000*\\u0000pdfPageNumber\\";i:1;s:7:\\"\\u0000*\\u0000name\\";s:5:\\"thumb\\";}i:1;O:42:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\":11:{s:12:\\"\\u0000*\\u0000fileNamer\\";O:54:\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\":0:{}s:28:\\"\\u0000*\\u0000extractVideoFrameAtSecond\\";d:0;s:16:\\"\\u0000*\\u0000manipulations\\";O:45:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Manipulations\\":1:{s:16:\\"\\u0000*\\u0000manipulations\\";a:3:{s:8:\\"optimize\\";a:1:{i:0;O:36:\\"Spatie\\\\ImageOptimizer\\\\OptimizerChain\\":3:{s:13:\\"\\u0000*\\u0000optimizers\\";a:7:{i:0;O:42:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Jpegoptim\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m85\\";i:1;s:7:\\"--force\\";i:2;s:11:\\"--strip-all\\";i:3;s:17:\\"--all-progressive\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:9:\\"jpegoptim\\";}i:1;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Pngquant\\":5:{s:7:\\"options\\";a:1:{i:0;s:7:\\"--force\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"pngquant\\";}i:2;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Optipng\\":5:{s:7:\\"options\\";a:3:{i:0;s:3:\\"-i0\\";i:1;s:3:\\"-o2\\";i:2;s:6:\\"-quiet\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"optipng\\";}i:3;O:37:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Svgo\\":5:{s:7:\\"options\\";a:1:{i:0;s:20:\\"--disable=cleanupIDs\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:4:\\"svgo\\";}i:4;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Gifsicle\\":5:{s:7:\\"options\\";a:2:{i:0;s:2:\\"-b\\";i:1;s:3:\\"-O3\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"gifsicle\\";}i:5;O:38:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Cwebp\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m 6\\";i:1;s:8:\\"-pass 10\\";i:2;s:3:\\"-mt\\";i:3;s:5:\\"-q 90\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:5:\\"cwebp\\";}i:6;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Avifenc\\":6:{s:7:\\"options\\";a:8:{i:0;s:14:\\"-a cq-level=23\\";i:1;s:6:\\"-j all\\";i:2;s:7:\\"--min 0\\";i:3;s:8:\\"--max 63\\";i:4;s:12:\\"--minalpha 0\\";i:5;s:13:\\"--maxalpha 63\\";i:6;s:14:\\"-a end-usage=q\\";i:7;s:12:\\"-a tune=ssim\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"avifenc\\";s:16:\\"decodeBinaryName\\";s:7:\\"avifdec\\";}}s:9:\\"\\u0000*\\u0000logger\\";O:33:\\"Spatie\\\\ImageOptimizer\\\\DummyLogger\\":0:{}s:10:\\"\\u0000*\\u0000timeout\\";i:60;}}s:6:\\"format\\";a:1:{i:0;s:3:\\"jpg\\";}s:3:\\"fit\\";a:3:{i:0;r:83;i:1;i:400;i:2;i:400;}}}s:23:\\"\\u0000*\\u0000performOnCollections\\";a:0:{}s:17:\\"\\u0000*\\u0000performOnQueue\\";b:1;s:26:\\"\\u0000*\\u0000keepOriginalImageFormat\\";b:0;s:27:\\"\\u0000*\\u0000generateResponsiveImages\\";b:0;s:18:\\"\\u0000*\\u0000widthCalculator\\";N;s:24:\\"\\u0000*\\u0000loadingAttributeValue\\";N;s:16:\\"\\u0000*\\u0000pdfPageNumber\\";i:1;s:7:\\"\\u0000*\\u0000name\\";s:4:\\"icon\\";}}s:28:\\"\\u0000*\\u0000escapeWhenCastingToString\\";b:0;}s:8:\\"\\u0000*\\u0000media\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":5:{s:5:\\"class\\";s:49:\\"Spatie\\\\MediaLibrary\\\\MediaCollections\\\\Models\\\\Media\\";s:2:\\"id\\";i:22;s:9:\\"relations\\";a:0:{}s:10:\\"connection\\";s:5:\\"pgsql\\";s:15:\\"collectionClass\\";N;}s:14:\\"\\u0000*\\u0000onlyMissing\\";b:0;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:0:\\"\\";}"}}	0	\N	1720708931	1720708931
23	default	{"uuid":"6283047e-3f9a-4743-922f-d7f6e1fb969a","displayName":"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob","command":"O:58:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\\":5:{s:14:\\"\\u0000*\\u0000conversions\\";O:52:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\ConversionCollection\\":2:{s:8:\\"\\u0000*\\u0000items\\";a:2:{i:0;O:42:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\":11:{s:12:\\"\\u0000*\\u0000fileNamer\\";O:54:\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\":0:{}s:28:\\"\\u0000*\\u0000extractVideoFrameAtSecond\\";d:0;s:16:\\"\\u0000*\\u0000manipulations\\";O:45:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Manipulations\\":1:{s:16:\\"\\u0000*\\u0000manipulations\\";a:3:{s:8:\\"optimize\\";a:1:{i:0;O:36:\\"Spatie\\\\ImageOptimizer\\\\OptimizerChain\\":3:{s:13:\\"\\u0000*\\u0000optimizers\\";a:7:{i:0;O:42:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Jpegoptim\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m85\\";i:1;s:7:\\"--force\\";i:2;s:11:\\"--strip-all\\";i:3;s:17:\\"--all-progressive\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:9:\\"jpegoptim\\";}i:1;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Pngquant\\":5:{s:7:\\"options\\";a:1:{i:0;s:7:\\"--force\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"pngquant\\";}i:2;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Optipng\\":5:{s:7:\\"options\\";a:3:{i:0;s:3:\\"-i0\\";i:1;s:3:\\"-o2\\";i:2;s:6:\\"-quiet\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"optipng\\";}i:3;O:37:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Svgo\\":5:{s:7:\\"options\\";a:1:{i:0;s:20:\\"--disable=cleanupIDs\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:4:\\"svgo\\";}i:4;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Gifsicle\\":5:{s:7:\\"options\\";a:2:{i:0;s:2:\\"-b\\";i:1;s:3:\\"-O3\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"gifsicle\\";}i:5;O:38:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Cwebp\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m 6\\";i:1;s:8:\\"-pass 10\\";i:2;s:3:\\"-mt\\";i:3;s:5:\\"-q 90\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:5:\\"cwebp\\";}i:6;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Avifenc\\":6:{s:7:\\"options\\";a:8:{i:0;s:14:\\"-a cq-level=23\\";i:1;s:6:\\"-j all\\";i:2;s:7:\\"--min 0\\";i:3;s:8:\\"--max 63\\";i:4;s:12:\\"--minalpha 0\\";i:5;s:13:\\"--maxalpha 63\\";i:6;s:14:\\"-a end-usage=q\\";i:7;s:12:\\"-a tune=ssim\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"avifenc\\";s:16:\\"decodeBinaryName\\";s:7:\\"avifdec\\";}}s:9:\\"\\u0000*\\u0000logger\\";O:33:\\"Spatie\\\\ImageOptimizer\\\\DummyLogger\\":0:{}s:10:\\"\\u0000*\\u0000timeout\\";i:60;}}s:6:\\"format\\";a:1:{i:0;s:3:\\"jpg\\";}s:3:\\"fit\\";a:3:{i:0;E:27:\\"Spatie\\\\Image\\\\Enums\\\\Fit:Crop\\";i:1;i:600;i:2;i:600;}}}s:23:\\"\\u0000*\\u0000performOnCollections\\";a:0:{}s:17:\\"\\u0000*\\u0000performOnQueue\\";b:1;s:26:\\"\\u0000*\\u0000keepOriginalImageFormat\\";b:0;s:27:\\"\\u0000*\\u0000generateResponsiveImages\\";b:0;s:18:\\"\\u0000*\\u0000widthCalculator\\";N;s:24:\\"\\u0000*\\u0000loadingAttributeValue\\";N;s:16:\\"\\u0000*\\u0000pdfPageNumber\\";i:1;s:7:\\"\\u0000*\\u0000name\\";s:5:\\"thumb\\";}i:1;O:42:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\":11:{s:12:\\"\\u0000*\\u0000fileNamer\\";O:54:\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\":0:{}s:28:\\"\\u0000*\\u0000extractVideoFrameAtSecond\\";d:0;s:16:\\"\\u0000*\\u0000manipulations\\";O:45:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Manipulations\\":1:{s:16:\\"\\u0000*\\u0000manipulations\\";a:3:{s:8:\\"optimize\\";a:1:{i:0;O:36:\\"Spatie\\\\ImageOptimizer\\\\OptimizerChain\\":3:{s:13:\\"\\u0000*\\u0000optimizers\\";a:7:{i:0;O:42:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Jpegoptim\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m85\\";i:1;s:7:\\"--force\\";i:2;s:11:\\"--strip-all\\";i:3;s:17:\\"--all-progressive\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:9:\\"jpegoptim\\";}i:1;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Pngquant\\":5:{s:7:\\"options\\";a:1:{i:0;s:7:\\"--force\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"pngquant\\";}i:2;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Optipng\\":5:{s:7:\\"options\\";a:3:{i:0;s:3:\\"-i0\\";i:1;s:3:\\"-o2\\";i:2;s:6:\\"-quiet\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"optipng\\";}i:3;O:37:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Svgo\\":5:{s:7:\\"options\\";a:1:{i:0;s:20:\\"--disable=cleanupIDs\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:4:\\"svgo\\";}i:4;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Gifsicle\\":5:{s:7:\\"options\\";a:2:{i:0;s:2:\\"-b\\";i:1;s:3:\\"-O3\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"gifsicle\\";}i:5;O:38:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Cwebp\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m 6\\";i:1;s:8:\\"-pass 10\\";i:2;s:3:\\"-mt\\";i:3;s:5:\\"-q 90\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:5:\\"cwebp\\";}i:6;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Avifenc\\":6:{s:7:\\"options\\";a:8:{i:0;s:14:\\"-a cq-level=23\\";i:1;s:6:\\"-j all\\";i:2;s:7:\\"--min 0\\";i:3;s:8:\\"--max 63\\";i:4;s:12:\\"--minalpha 0\\";i:5;s:13:\\"--maxalpha 63\\";i:6;s:14:\\"-a end-usage=q\\";i:7;s:12:\\"-a tune=ssim\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"avifenc\\";s:16:\\"decodeBinaryName\\";s:7:\\"avifdec\\";}}s:9:\\"\\u0000*\\u0000logger\\";O:33:\\"Spatie\\\\ImageOptimizer\\\\DummyLogger\\":0:{}s:10:\\"\\u0000*\\u0000timeout\\";i:60;}}s:6:\\"format\\";a:1:{i:0;s:3:\\"jpg\\";}s:3:\\"fit\\";a:3:{i:0;r:83;i:1;i:400;i:2;i:400;}}}s:23:\\"\\u0000*\\u0000performOnCollections\\";a:0:{}s:17:\\"\\u0000*\\u0000performOnQueue\\";b:1;s:26:\\"\\u0000*\\u0000keepOriginalImageFormat\\";b:0;s:27:\\"\\u0000*\\u0000generateResponsiveImages\\";b:0;s:18:\\"\\u0000*\\u0000widthCalculator\\";N;s:24:\\"\\u0000*\\u0000loadingAttributeValue\\";N;s:16:\\"\\u0000*\\u0000pdfPageNumber\\";i:1;s:7:\\"\\u0000*\\u0000name\\";s:4:\\"icon\\";}}s:28:\\"\\u0000*\\u0000escapeWhenCastingToString\\";b:0;}s:8:\\"\\u0000*\\u0000media\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":5:{s:5:\\"class\\";s:49:\\"Spatie\\\\MediaLibrary\\\\MediaCollections\\\\Models\\\\Media\\";s:2:\\"id\\";i:23;s:9:\\"relations\\";a:0:{}s:10:\\"connection\\";s:5:\\"pgsql\\";s:15:\\"collectionClass\\";N;}s:14:\\"\\u0000*\\u0000onlyMissing\\";b:0;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:0:\\"\\";}"}}	0	\N	1720708952	1720708952
24	default	{"uuid":"7b7314a9-cce0-469b-bbd4-2b15c52515f1","displayName":"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob","command":"O:58:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\\":5:{s:14:\\"\\u0000*\\u0000conversions\\";O:52:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\ConversionCollection\\":2:{s:8:\\"\\u0000*\\u0000items\\";a:2:{i:0;O:42:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\":11:{s:12:\\"\\u0000*\\u0000fileNamer\\";O:54:\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\":0:{}s:28:\\"\\u0000*\\u0000extractVideoFrameAtSecond\\";d:0;s:16:\\"\\u0000*\\u0000manipulations\\";O:45:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Manipulations\\":1:{s:16:\\"\\u0000*\\u0000manipulations\\";a:3:{s:8:\\"optimize\\";a:1:{i:0;O:36:\\"Spatie\\\\ImageOptimizer\\\\OptimizerChain\\":3:{s:13:\\"\\u0000*\\u0000optimizers\\";a:7:{i:0;O:42:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Jpegoptim\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m85\\";i:1;s:7:\\"--force\\";i:2;s:11:\\"--strip-all\\";i:3;s:17:\\"--all-progressive\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:9:\\"jpegoptim\\";}i:1;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Pngquant\\":5:{s:7:\\"options\\";a:1:{i:0;s:7:\\"--force\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"pngquant\\";}i:2;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Optipng\\":5:{s:7:\\"options\\";a:3:{i:0;s:3:\\"-i0\\";i:1;s:3:\\"-o2\\";i:2;s:6:\\"-quiet\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"optipng\\";}i:3;O:37:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Svgo\\":5:{s:7:\\"options\\";a:1:{i:0;s:20:\\"--disable=cleanupIDs\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:4:\\"svgo\\";}i:4;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Gifsicle\\":5:{s:7:\\"options\\";a:2:{i:0;s:2:\\"-b\\";i:1;s:3:\\"-O3\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"gifsicle\\";}i:5;O:38:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Cwebp\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m 6\\";i:1;s:8:\\"-pass 10\\";i:2;s:3:\\"-mt\\";i:3;s:5:\\"-q 90\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:5:\\"cwebp\\";}i:6;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Avifenc\\":6:{s:7:\\"options\\";a:8:{i:0;s:14:\\"-a cq-level=23\\";i:1;s:6:\\"-j all\\";i:2;s:7:\\"--min 0\\";i:3;s:8:\\"--max 63\\";i:4;s:12:\\"--minalpha 0\\";i:5;s:13:\\"--maxalpha 63\\";i:6;s:14:\\"-a end-usage=q\\";i:7;s:12:\\"-a tune=ssim\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"avifenc\\";s:16:\\"decodeBinaryName\\";s:7:\\"avifdec\\";}}s:9:\\"\\u0000*\\u0000logger\\";O:33:\\"Spatie\\\\ImageOptimizer\\\\DummyLogger\\":0:{}s:10:\\"\\u0000*\\u0000timeout\\";i:60;}}s:6:\\"format\\";a:1:{i:0;s:3:\\"jpg\\";}s:3:\\"fit\\";a:3:{i:0;E:27:\\"Spatie\\\\Image\\\\Enums\\\\Fit:Crop\\";i:1;i:600;i:2;i:600;}}}s:23:\\"\\u0000*\\u0000performOnCollections\\";a:0:{}s:17:\\"\\u0000*\\u0000performOnQueue\\";b:1;s:26:\\"\\u0000*\\u0000keepOriginalImageFormat\\";b:0;s:27:\\"\\u0000*\\u0000generateResponsiveImages\\";b:0;s:18:\\"\\u0000*\\u0000widthCalculator\\";N;s:24:\\"\\u0000*\\u0000loadingAttributeValue\\";N;s:16:\\"\\u0000*\\u0000pdfPageNumber\\";i:1;s:7:\\"\\u0000*\\u0000name\\";s:5:\\"thumb\\";}i:1;O:42:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\":11:{s:12:\\"\\u0000*\\u0000fileNamer\\";O:54:\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\":0:{}s:28:\\"\\u0000*\\u0000extractVideoFrameAtSecond\\";d:0;s:16:\\"\\u0000*\\u0000manipulations\\";O:45:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Manipulations\\":1:{s:16:\\"\\u0000*\\u0000manipulations\\";a:3:{s:8:\\"optimize\\";a:1:{i:0;O:36:\\"Spatie\\\\ImageOptimizer\\\\OptimizerChain\\":3:{s:13:\\"\\u0000*\\u0000optimizers\\";a:7:{i:0;O:42:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Jpegoptim\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m85\\";i:1;s:7:\\"--force\\";i:2;s:11:\\"--strip-all\\";i:3;s:17:\\"--all-progressive\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:9:\\"jpegoptim\\";}i:1;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Pngquant\\":5:{s:7:\\"options\\";a:1:{i:0;s:7:\\"--force\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"pngquant\\";}i:2;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Optipng\\":5:{s:7:\\"options\\";a:3:{i:0;s:3:\\"-i0\\";i:1;s:3:\\"-o2\\";i:2;s:6:\\"-quiet\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"optipng\\";}i:3;O:37:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Svgo\\":5:{s:7:\\"options\\";a:1:{i:0;s:20:\\"--disable=cleanupIDs\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:4:\\"svgo\\";}i:4;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Gifsicle\\":5:{s:7:\\"options\\";a:2:{i:0;s:2:\\"-b\\";i:1;s:3:\\"-O3\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"gifsicle\\";}i:5;O:38:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Cwebp\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m 6\\";i:1;s:8:\\"-pass 10\\";i:2;s:3:\\"-mt\\";i:3;s:5:\\"-q 90\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:5:\\"cwebp\\";}i:6;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Avifenc\\":6:{s:7:\\"options\\";a:8:{i:0;s:14:\\"-a cq-level=23\\";i:1;s:6:\\"-j all\\";i:2;s:7:\\"--min 0\\";i:3;s:8:\\"--max 63\\";i:4;s:12:\\"--minalpha 0\\";i:5;s:13:\\"--maxalpha 63\\";i:6;s:14:\\"-a end-usage=q\\";i:7;s:12:\\"-a tune=ssim\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"avifenc\\";s:16:\\"decodeBinaryName\\";s:7:\\"avifdec\\";}}s:9:\\"\\u0000*\\u0000logger\\";O:33:\\"Spatie\\\\ImageOptimizer\\\\DummyLogger\\":0:{}s:10:\\"\\u0000*\\u0000timeout\\";i:60;}}s:6:\\"format\\";a:1:{i:0;s:3:\\"jpg\\";}s:3:\\"fit\\";a:3:{i:0;r:83;i:1;i:400;i:2;i:400;}}}s:23:\\"\\u0000*\\u0000performOnCollections\\";a:0:{}s:17:\\"\\u0000*\\u0000performOnQueue\\";b:1;s:26:\\"\\u0000*\\u0000keepOriginalImageFormat\\";b:0;s:27:\\"\\u0000*\\u0000generateResponsiveImages\\";b:0;s:18:\\"\\u0000*\\u0000widthCalculator\\";N;s:24:\\"\\u0000*\\u0000loadingAttributeValue\\";N;s:16:\\"\\u0000*\\u0000pdfPageNumber\\";i:1;s:7:\\"\\u0000*\\u0000name\\";s:4:\\"icon\\";}}s:28:\\"\\u0000*\\u0000escapeWhenCastingToString\\";b:0;}s:8:\\"\\u0000*\\u0000media\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":5:{s:5:\\"class\\";s:49:\\"Spatie\\\\MediaLibrary\\\\MediaCollections\\\\Models\\\\Media\\";s:2:\\"id\\";i:24;s:9:\\"relations\\";a:0:{}s:10:\\"connection\\";s:5:\\"pgsql\\";s:15:\\"collectionClass\\";N;}s:14:\\"\\u0000*\\u0000onlyMissing\\";b:0;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:0:\\"\\";}"}}	0	\N	1720791581	1720791581
25	default	{"uuid":"924087f2-be3f-494e-89a4-c602ad047d71","displayName":"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob","command":"O:58:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\\":5:{s:14:\\"\\u0000*\\u0000conversions\\";O:52:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\ConversionCollection\\":2:{s:8:\\"\\u0000*\\u0000items\\";a:2:{i:0;O:42:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\":11:{s:12:\\"\\u0000*\\u0000fileNamer\\";O:54:\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\":0:{}s:28:\\"\\u0000*\\u0000extractVideoFrameAtSecond\\";d:0;s:16:\\"\\u0000*\\u0000manipulations\\";O:45:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Manipulations\\":1:{s:16:\\"\\u0000*\\u0000manipulations\\";a:3:{s:8:\\"optimize\\";a:1:{i:0;O:36:\\"Spatie\\\\ImageOptimizer\\\\OptimizerChain\\":3:{s:13:\\"\\u0000*\\u0000optimizers\\";a:7:{i:0;O:42:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Jpegoptim\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m85\\";i:1;s:7:\\"--force\\";i:2;s:11:\\"--strip-all\\";i:3;s:17:\\"--all-progressive\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:9:\\"jpegoptim\\";}i:1;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Pngquant\\":5:{s:7:\\"options\\";a:1:{i:0;s:7:\\"--force\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"pngquant\\";}i:2;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Optipng\\":5:{s:7:\\"options\\";a:3:{i:0;s:3:\\"-i0\\";i:1;s:3:\\"-o2\\";i:2;s:6:\\"-quiet\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"optipng\\";}i:3;O:37:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Svgo\\":5:{s:7:\\"options\\";a:1:{i:0;s:20:\\"--disable=cleanupIDs\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:4:\\"svgo\\";}i:4;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Gifsicle\\":5:{s:7:\\"options\\";a:2:{i:0;s:2:\\"-b\\";i:1;s:3:\\"-O3\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"gifsicle\\";}i:5;O:38:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Cwebp\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m 6\\";i:1;s:8:\\"-pass 10\\";i:2;s:3:\\"-mt\\";i:3;s:5:\\"-q 90\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:5:\\"cwebp\\";}i:6;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Avifenc\\":6:{s:7:\\"options\\";a:8:{i:0;s:14:\\"-a cq-level=23\\";i:1;s:6:\\"-j all\\";i:2;s:7:\\"--min 0\\";i:3;s:8:\\"--max 63\\";i:4;s:12:\\"--minalpha 0\\";i:5;s:13:\\"--maxalpha 63\\";i:6;s:14:\\"-a end-usage=q\\";i:7;s:12:\\"-a tune=ssim\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"avifenc\\";s:16:\\"decodeBinaryName\\";s:7:\\"avifdec\\";}}s:9:\\"\\u0000*\\u0000logger\\";O:33:\\"Spatie\\\\ImageOptimizer\\\\DummyLogger\\":0:{}s:10:\\"\\u0000*\\u0000timeout\\";i:60;}}s:6:\\"format\\";a:1:{i:0;s:3:\\"jpg\\";}s:3:\\"fit\\";a:3:{i:0;E:27:\\"Spatie\\\\Image\\\\Enums\\\\Fit:Crop\\";i:1;i:600;i:2;i:600;}}}s:23:\\"\\u0000*\\u0000performOnCollections\\";a:0:{}s:17:\\"\\u0000*\\u0000performOnQueue\\";b:1;s:26:\\"\\u0000*\\u0000keepOriginalImageFormat\\";b:0;s:27:\\"\\u0000*\\u0000generateResponsiveImages\\";b:0;s:18:\\"\\u0000*\\u0000widthCalculator\\";N;s:24:\\"\\u0000*\\u0000loadingAttributeValue\\";N;s:16:\\"\\u0000*\\u0000pdfPageNumber\\";i:1;s:7:\\"\\u0000*\\u0000name\\";s:5:\\"thumb\\";}i:1;O:42:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\":11:{s:12:\\"\\u0000*\\u0000fileNamer\\";O:54:\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\":0:{}s:28:\\"\\u0000*\\u0000extractVideoFrameAtSecond\\";d:0;s:16:\\"\\u0000*\\u0000manipulations\\";O:45:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Manipulations\\":1:{s:16:\\"\\u0000*\\u0000manipulations\\";a:3:{s:8:\\"optimize\\";a:1:{i:0;O:36:\\"Spatie\\\\ImageOptimizer\\\\OptimizerChain\\":3:{s:13:\\"\\u0000*\\u0000optimizers\\";a:7:{i:0;O:42:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Jpegoptim\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m85\\";i:1;s:7:\\"--force\\";i:2;s:11:\\"--strip-all\\";i:3;s:17:\\"--all-progressive\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:9:\\"jpegoptim\\";}i:1;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Pngquant\\":5:{s:7:\\"options\\";a:1:{i:0;s:7:\\"--force\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"pngquant\\";}i:2;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Optipng\\":5:{s:7:\\"options\\";a:3:{i:0;s:3:\\"-i0\\";i:1;s:3:\\"-o2\\";i:2;s:6:\\"-quiet\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"optipng\\";}i:3;O:37:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Svgo\\":5:{s:7:\\"options\\";a:1:{i:0;s:20:\\"--disable=cleanupIDs\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:4:\\"svgo\\";}i:4;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Gifsicle\\":5:{s:7:\\"options\\";a:2:{i:0;s:2:\\"-b\\";i:1;s:3:\\"-O3\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"gifsicle\\";}i:5;O:38:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Cwebp\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m 6\\";i:1;s:8:\\"-pass 10\\";i:2;s:3:\\"-mt\\";i:3;s:5:\\"-q 90\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:5:\\"cwebp\\";}i:6;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Avifenc\\":6:{s:7:\\"options\\";a:8:{i:0;s:14:\\"-a cq-level=23\\";i:1;s:6:\\"-j all\\";i:2;s:7:\\"--min 0\\";i:3;s:8:\\"--max 63\\";i:4;s:12:\\"--minalpha 0\\";i:5;s:13:\\"--maxalpha 63\\";i:6;s:14:\\"-a end-usage=q\\";i:7;s:12:\\"-a tune=ssim\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"avifenc\\";s:16:\\"decodeBinaryName\\";s:7:\\"avifdec\\";}}s:9:\\"\\u0000*\\u0000logger\\";O:33:\\"Spatie\\\\ImageOptimizer\\\\DummyLogger\\":0:{}s:10:\\"\\u0000*\\u0000timeout\\";i:60;}}s:6:\\"format\\";a:1:{i:0;s:3:\\"jpg\\";}s:3:\\"fit\\";a:3:{i:0;r:83;i:1;i:400;i:2;i:400;}}}s:23:\\"\\u0000*\\u0000performOnCollections\\";a:0:{}s:17:\\"\\u0000*\\u0000performOnQueue\\";b:1;s:26:\\"\\u0000*\\u0000keepOriginalImageFormat\\";b:0;s:27:\\"\\u0000*\\u0000generateResponsiveImages\\";b:0;s:18:\\"\\u0000*\\u0000widthCalculator\\";N;s:24:\\"\\u0000*\\u0000loadingAttributeValue\\";N;s:16:\\"\\u0000*\\u0000pdfPageNumber\\";i:1;s:7:\\"\\u0000*\\u0000name\\";s:4:\\"icon\\";}}s:28:\\"\\u0000*\\u0000escapeWhenCastingToString\\";b:0;}s:8:\\"\\u0000*\\u0000media\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":5:{s:5:\\"class\\";s:49:\\"Spatie\\\\MediaLibrary\\\\MediaCollections\\\\Models\\\\Media\\";s:2:\\"id\\";i:25;s:9:\\"relations\\";a:0:{}s:10:\\"connection\\";s:5:\\"pgsql\\";s:15:\\"collectionClass\\";N;}s:14:\\"\\u0000*\\u0000onlyMissing\\";b:0;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:0:\\"\\";}"}}	0	\N	1721812347	1721812347
26	default	{"uuid":"f91a6858-f7b5-4823-bd6c-26ab06d6a480","displayName":"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob","command":"O:58:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\\":5:{s:14:\\"\\u0000*\\u0000conversions\\";O:52:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\ConversionCollection\\":2:{s:8:\\"\\u0000*\\u0000items\\";a:2:{i:0;O:42:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\":11:{s:12:\\"\\u0000*\\u0000fileNamer\\";O:54:\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\":0:{}s:28:\\"\\u0000*\\u0000extractVideoFrameAtSecond\\";d:0;s:16:\\"\\u0000*\\u0000manipulations\\";O:45:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Manipulations\\":1:{s:16:\\"\\u0000*\\u0000manipulations\\";a:3:{s:8:\\"optimize\\";a:1:{i:0;O:36:\\"Spatie\\\\ImageOptimizer\\\\OptimizerChain\\":3:{s:13:\\"\\u0000*\\u0000optimizers\\";a:7:{i:0;O:42:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Jpegoptim\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m85\\";i:1;s:7:\\"--force\\";i:2;s:11:\\"--strip-all\\";i:3;s:17:\\"--all-progressive\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:9:\\"jpegoptim\\";}i:1;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Pngquant\\":5:{s:7:\\"options\\";a:1:{i:0;s:7:\\"--force\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"pngquant\\";}i:2;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Optipng\\":5:{s:7:\\"options\\";a:3:{i:0;s:3:\\"-i0\\";i:1;s:3:\\"-o2\\";i:2;s:6:\\"-quiet\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"optipng\\";}i:3;O:37:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Svgo\\":5:{s:7:\\"options\\";a:1:{i:0;s:20:\\"--disable=cleanupIDs\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:4:\\"svgo\\";}i:4;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Gifsicle\\":5:{s:7:\\"options\\";a:2:{i:0;s:2:\\"-b\\";i:1;s:3:\\"-O3\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"gifsicle\\";}i:5;O:38:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Cwebp\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m 6\\";i:1;s:8:\\"-pass 10\\";i:2;s:3:\\"-mt\\";i:3;s:5:\\"-q 90\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:5:\\"cwebp\\";}i:6;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Avifenc\\":6:{s:7:\\"options\\";a:8:{i:0;s:14:\\"-a cq-level=23\\";i:1;s:6:\\"-j all\\";i:2;s:7:\\"--min 0\\";i:3;s:8:\\"--max 63\\";i:4;s:12:\\"--minalpha 0\\";i:5;s:13:\\"--maxalpha 63\\";i:6;s:14:\\"-a end-usage=q\\";i:7;s:12:\\"-a tune=ssim\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"avifenc\\";s:16:\\"decodeBinaryName\\";s:7:\\"avifdec\\";}}s:9:\\"\\u0000*\\u0000logger\\";O:33:\\"Spatie\\\\ImageOptimizer\\\\DummyLogger\\":0:{}s:10:\\"\\u0000*\\u0000timeout\\";i:60;}}s:6:\\"format\\";a:1:{i:0;s:3:\\"jpg\\";}s:3:\\"fit\\";a:3:{i:0;E:27:\\"Spatie\\\\Image\\\\Enums\\\\Fit:Crop\\";i:1;i:800;i:2;i:800;}}}s:23:\\"\\u0000*\\u0000performOnCollections\\";a:0:{}s:17:\\"\\u0000*\\u0000performOnQueue\\";b:1;s:26:\\"\\u0000*\\u0000keepOriginalImageFormat\\";b:0;s:27:\\"\\u0000*\\u0000generateResponsiveImages\\";b:0;s:18:\\"\\u0000*\\u0000widthCalculator\\";N;s:24:\\"\\u0000*\\u0000loadingAttributeValue\\";N;s:16:\\"\\u0000*\\u0000pdfPageNumber\\";i:1;s:7:\\"\\u0000*\\u0000name\\";s:5:\\"thumb\\";}i:1;O:42:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\":11:{s:12:\\"\\u0000*\\u0000fileNamer\\";O:54:\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\":0:{}s:28:\\"\\u0000*\\u0000extractVideoFrameAtSecond\\";d:0;s:16:\\"\\u0000*\\u0000manipulations\\";O:45:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Manipulations\\":1:{s:16:\\"\\u0000*\\u0000manipulations\\";a:3:{s:8:\\"optimize\\";a:1:{i:0;O:36:\\"Spatie\\\\ImageOptimizer\\\\OptimizerChain\\":3:{s:13:\\"\\u0000*\\u0000optimizers\\";a:7:{i:0;O:42:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Jpegoptim\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m85\\";i:1;s:7:\\"--force\\";i:2;s:11:\\"--strip-all\\";i:3;s:17:\\"--all-progressive\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:9:\\"jpegoptim\\";}i:1;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Pngquant\\":5:{s:7:\\"options\\";a:1:{i:0;s:7:\\"--force\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"pngquant\\";}i:2;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Optipng\\":5:{s:7:\\"options\\";a:3:{i:0;s:3:\\"-i0\\";i:1;s:3:\\"-o2\\";i:2;s:6:\\"-quiet\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"optipng\\";}i:3;O:37:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Svgo\\":5:{s:7:\\"options\\";a:1:{i:0;s:20:\\"--disable=cleanupIDs\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:4:\\"svgo\\";}i:4;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Gifsicle\\":5:{s:7:\\"options\\";a:2:{i:0;s:2:\\"-b\\";i:1;s:3:\\"-O3\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"gifsicle\\";}i:5;O:38:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Cwebp\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m 6\\";i:1;s:8:\\"-pass 10\\";i:2;s:3:\\"-mt\\";i:3;s:5:\\"-q 90\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:5:\\"cwebp\\";}i:6;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Avifenc\\":6:{s:7:\\"options\\";a:8:{i:0;s:14:\\"-a cq-level=23\\";i:1;s:6:\\"-j all\\";i:2;s:7:\\"--min 0\\";i:3;s:8:\\"--max 63\\";i:4;s:12:\\"--minalpha 0\\";i:5;s:13:\\"--maxalpha 63\\";i:6;s:14:\\"-a end-usage=q\\";i:7;s:12:\\"-a tune=ssim\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"avifenc\\";s:16:\\"decodeBinaryName\\";s:7:\\"avifdec\\";}}s:9:\\"\\u0000*\\u0000logger\\";O:33:\\"Spatie\\\\ImageOptimizer\\\\DummyLogger\\":0:{}s:10:\\"\\u0000*\\u0000timeout\\";i:60;}}s:6:\\"format\\";a:1:{i:0;s:3:\\"jpg\\";}s:3:\\"fit\\";a:3:{i:0;r:83;i:1;i:600;i:2;i:600;}}}s:23:\\"\\u0000*\\u0000performOnCollections\\";a:0:{}s:17:\\"\\u0000*\\u0000performOnQueue\\";b:1;s:26:\\"\\u0000*\\u0000keepOriginalImageFormat\\";b:0;s:27:\\"\\u0000*\\u0000generateResponsiveImages\\";b:0;s:18:\\"\\u0000*\\u0000widthCalculator\\";N;s:24:\\"\\u0000*\\u0000loadingAttributeValue\\";N;s:16:\\"\\u0000*\\u0000pdfPageNumber\\";i:1;s:7:\\"\\u0000*\\u0000name\\";s:4:\\"icon\\";}}s:28:\\"\\u0000*\\u0000escapeWhenCastingToString\\";b:0;}s:8:\\"\\u0000*\\u0000media\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":5:{s:5:\\"class\\";s:49:\\"Spatie\\\\MediaLibrary\\\\MediaCollections\\\\Models\\\\Media\\";s:2:\\"id\\";i:26;s:9:\\"relations\\";a:0:{}s:10:\\"connection\\";s:5:\\"pgsql\\";s:15:\\"collectionClass\\";N;}s:14:\\"\\u0000*\\u0000onlyMissing\\";b:0;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:0:\\"\\";}"}}	0	\N	1727077857	1727077857
27	default	{"uuid":"1b8b7b61-8b06-41bd-beda-b575854cc382","displayName":"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob","command":"O:58:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\\":5:{s:14:\\"\\u0000*\\u0000conversions\\";O:52:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\ConversionCollection\\":2:{s:8:\\"\\u0000*\\u0000items\\";a:2:{i:0;O:42:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\":11:{s:12:\\"\\u0000*\\u0000fileNamer\\";O:54:\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\":0:{}s:28:\\"\\u0000*\\u0000extractVideoFrameAtSecond\\";d:0;s:16:\\"\\u0000*\\u0000manipulations\\";O:45:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Manipulations\\":1:{s:16:\\"\\u0000*\\u0000manipulations\\";a:3:{s:8:\\"optimize\\";a:1:{i:0;O:36:\\"Spatie\\\\ImageOptimizer\\\\OptimizerChain\\":3:{s:13:\\"\\u0000*\\u0000optimizers\\";a:7:{i:0;O:42:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Jpegoptim\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m85\\";i:1;s:7:\\"--force\\";i:2;s:11:\\"--strip-all\\";i:3;s:17:\\"--all-progressive\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:9:\\"jpegoptim\\";}i:1;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Pngquant\\":5:{s:7:\\"options\\";a:1:{i:0;s:7:\\"--force\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"pngquant\\";}i:2;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Optipng\\":5:{s:7:\\"options\\";a:3:{i:0;s:3:\\"-i0\\";i:1;s:3:\\"-o2\\";i:2;s:6:\\"-quiet\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"optipng\\";}i:3;O:37:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Svgo\\":5:{s:7:\\"options\\";a:1:{i:0;s:20:\\"--disable=cleanupIDs\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:4:\\"svgo\\";}i:4;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Gifsicle\\":5:{s:7:\\"options\\";a:2:{i:0;s:2:\\"-b\\";i:1;s:3:\\"-O3\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"gifsicle\\";}i:5;O:38:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Cwebp\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m 6\\";i:1;s:8:\\"-pass 10\\";i:2;s:3:\\"-mt\\";i:3;s:5:\\"-q 90\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:5:\\"cwebp\\";}i:6;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Avifenc\\":6:{s:7:\\"options\\";a:8:{i:0;s:14:\\"-a cq-level=23\\";i:1;s:6:\\"-j all\\";i:2;s:7:\\"--min 0\\";i:3;s:8:\\"--max 63\\";i:4;s:12:\\"--minalpha 0\\";i:5;s:13:\\"--maxalpha 63\\";i:6;s:14:\\"-a end-usage=q\\";i:7;s:12:\\"-a tune=ssim\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"avifenc\\";s:16:\\"decodeBinaryName\\";s:7:\\"avifdec\\";}}s:9:\\"\\u0000*\\u0000logger\\";O:33:\\"Spatie\\\\ImageOptimizer\\\\DummyLogger\\":0:{}s:10:\\"\\u0000*\\u0000timeout\\";i:60;}}s:6:\\"format\\";a:1:{i:0;s:3:\\"jpg\\";}s:3:\\"fit\\";a:3:{i:0;E:27:\\"Spatie\\\\Image\\\\Enums\\\\Fit:Crop\\";i:1;i:800;i:2;i:800;}}}s:23:\\"\\u0000*\\u0000performOnCollections\\";a:0:{}s:17:\\"\\u0000*\\u0000performOnQueue\\";b:1;s:26:\\"\\u0000*\\u0000keepOriginalImageFormat\\";b:0;s:27:\\"\\u0000*\\u0000generateResponsiveImages\\";b:0;s:18:\\"\\u0000*\\u0000widthCalculator\\";N;s:24:\\"\\u0000*\\u0000loadingAttributeValue\\";N;s:16:\\"\\u0000*\\u0000pdfPageNumber\\";i:1;s:7:\\"\\u0000*\\u0000name\\";s:5:\\"thumb\\";}i:1;O:42:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\":11:{s:12:\\"\\u0000*\\u0000fileNamer\\";O:54:\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\":0:{}s:28:\\"\\u0000*\\u0000extractVideoFrameAtSecond\\";d:0;s:16:\\"\\u0000*\\u0000manipulations\\";O:45:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Manipulations\\":1:{s:16:\\"\\u0000*\\u0000manipulations\\";a:3:{s:8:\\"optimize\\";a:1:{i:0;O:36:\\"Spatie\\\\ImageOptimizer\\\\OptimizerChain\\":3:{s:13:\\"\\u0000*\\u0000optimizers\\";a:7:{i:0;O:42:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Jpegoptim\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m85\\";i:1;s:7:\\"--force\\";i:2;s:11:\\"--strip-all\\";i:3;s:17:\\"--all-progressive\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:9:\\"jpegoptim\\";}i:1;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Pngquant\\":5:{s:7:\\"options\\";a:1:{i:0;s:7:\\"--force\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"pngquant\\";}i:2;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Optipng\\":5:{s:7:\\"options\\";a:3:{i:0;s:3:\\"-i0\\";i:1;s:3:\\"-o2\\";i:2;s:6:\\"-quiet\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"optipng\\";}i:3;O:37:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Svgo\\":5:{s:7:\\"options\\";a:1:{i:0;s:20:\\"--disable=cleanupIDs\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:4:\\"svgo\\";}i:4;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Gifsicle\\":5:{s:7:\\"options\\";a:2:{i:0;s:2:\\"-b\\";i:1;s:3:\\"-O3\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"gifsicle\\";}i:5;O:38:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Cwebp\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m 6\\";i:1;s:8:\\"-pass 10\\";i:2;s:3:\\"-mt\\";i:3;s:5:\\"-q 90\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:5:\\"cwebp\\";}i:6;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Avifenc\\":6:{s:7:\\"options\\";a:8:{i:0;s:14:\\"-a cq-level=23\\";i:1;s:6:\\"-j all\\";i:2;s:7:\\"--min 0\\";i:3;s:8:\\"--max 63\\";i:4;s:12:\\"--minalpha 0\\";i:5;s:13:\\"--maxalpha 63\\";i:6;s:14:\\"-a end-usage=q\\";i:7;s:12:\\"-a tune=ssim\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"avifenc\\";s:16:\\"decodeBinaryName\\";s:7:\\"avifdec\\";}}s:9:\\"\\u0000*\\u0000logger\\";O:33:\\"Spatie\\\\ImageOptimizer\\\\DummyLogger\\":0:{}s:10:\\"\\u0000*\\u0000timeout\\";i:60;}}s:6:\\"format\\";a:1:{i:0;s:3:\\"jpg\\";}s:3:\\"fit\\";a:3:{i:0;r:83;i:1;i:600;i:2;i:600;}}}s:23:\\"\\u0000*\\u0000performOnCollections\\";a:0:{}s:17:\\"\\u0000*\\u0000performOnQueue\\";b:1;s:26:\\"\\u0000*\\u0000keepOriginalImageFormat\\";b:0;s:27:\\"\\u0000*\\u0000generateResponsiveImages\\";b:0;s:18:\\"\\u0000*\\u0000widthCalculator\\";N;s:24:\\"\\u0000*\\u0000loadingAttributeValue\\";N;s:16:\\"\\u0000*\\u0000pdfPageNumber\\";i:1;s:7:\\"\\u0000*\\u0000name\\";s:4:\\"icon\\";}}s:28:\\"\\u0000*\\u0000escapeWhenCastingToString\\";b:0;}s:8:\\"\\u0000*\\u0000media\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":5:{s:5:\\"class\\";s:49:\\"Spatie\\\\MediaLibrary\\\\MediaCollections\\\\Models\\\\Media\\";s:2:\\"id\\";i:27;s:9:\\"relations\\";a:0:{}s:10:\\"connection\\";s:5:\\"pgsql\\";s:15:\\"collectionClass\\";N;}s:14:\\"\\u0000*\\u0000onlyMissing\\";b:0;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:0:\\"\\";}"}}	0	\N	1727077872	1727077872
28	default	{"uuid":"bfe02573-b28c-40af-aae2-7c997e4d1adc","displayName":"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob","command":"O:58:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\\":5:{s:14:\\"\\u0000*\\u0000conversions\\";O:52:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\ConversionCollection\\":2:{s:8:\\"\\u0000*\\u0000items\\";a:2:{i:0;O:42:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\":11:{s:12:\\"\\u0000*\\u0000fileNamer\\";O:54:\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\":0:{}s:28:\\"\\u0000*\\u0000extractVideoFrameAtSecond\\";d:0;s:16:\\"\\u0000*\\u0000manipulations\\";O:45:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Manipulations\\":1:{s:16:\\"\\u0000*\\u0000manipulations\\";a:3:{s:8:\\"optimize\\";a:1:{i:0;O:36:\\"Spatie\\\\ImageOptimizer\\\\OptimizerChain\\":3:{s:13:\\"\\u0000*\\u0000optimizers\\";a:7:{i:0;O:42:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Jpegoptim\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m85\\";i:1;s:7:\\"--force\\";i:2;s:11:\\"--strip-all\\";i:3;s:17:\\"--all-progressive\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:9:\\"jpegoptim\\";}i:1;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Pngquant\\":5:{s:7:\\"options\\";a:1:{i:0;s:7:\\"--force\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"pngquant\\";}i:2;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Optipng\\":5:{s:7:\\"options\\";a:3:{i:0;s:3:\\"-i0\\";i:1;s:3:\\"-o2\\";i:2;s:6:\\"-quiet\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"optipng\\";}i:3;O:37:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Svgo\\":5:{s:7:\\"options\\";a:1:{i:0;s:20:\\"--disable=cleanupIDs\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:4:\\"svgo\\";}i:4;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Gifsicle\\":5:{s:7:\\"options\\";a:2:{i:0;s:2:\\"-b\\";i:1;s:3:\\"-O3\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"gifsicle\\";}i:5;O:38:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Cwebp\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m 6\\";i:1;s:8:\\"-pass 10\\";i:2;s:3:\\"-mt\\";i:3;s:5:\\"-q 90\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:5:\\"cwebp\\";}i:6;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Avifenc\\":6:{s:7:\\"options\\";a:8:{i:0;s:14:\\"-a cq-level=23\\";i:1;s:6:\\"-j all\\";i:2;s:7:\\"--min 0\\";i:3;s:8:\\"--max 63\\";i:4;s:12:\\"--minalpha 0\\";i:5;s:13:\\"--maxalpha 63\\";i:6;s:14:\\"-a end-usage=q\\";i:7;s:12:\\"-a tune=ssim\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"avifenc\\";s:16:\\"decodeBinaryName\\";s:7:\\"avifdec\\";}}s:9:\\"\\u0000*\\u0000logger\\";O:33:\\"Spatie\\\\ImageOptimizer\\\\DummyLogger\\":0:{}s:10:\\"\\u0000*\\u0000timeout\\";i:60;}}s:6:\\"format\\";a:1:{i:0;s:3:\\"jpg\\";}s:3:\\"fit\\";a:3:{i:0;E:27:\\"Spatie\\\\Image\\\\Enums\\\\Fit:Crop\\";i:1;i:800;i:2;i:800;}}}s:23:\\"\\u0000*\\u0000performOnCollections\\";a:0:{}s:17:\\"\\u0000*\\u0000performOnQueue\\";b:1;s:26:\\"\\u0000*\\u0000keepOriginalImageFormat\\";b:0;s:27:\\"\\u0000*\\u0000generateResponsiveImages\\";b:0;s:18:\\"\\u0000*\\u0000widthCalculator\\";N;s:24:\\"\\u0000*\\u0000loadingAttributeValue\\";N;s:16:\\"\\u0000*\\u0000pdfPageNumber\\";i:1;s:7:\\"\\u0000*\\u0000name\\";s:5:\\"thumb\\";}i:1;O:42:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\":11:{s:12:\\"\\u0000*\\u0000fileNamer\\";O:54:\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\":0:{}s:28:\\"\\u0000*\\u0000extractVideoFrameAtSecond\\";d:0;s:16:\\"\\u0000*\\u0000manipulations\\";O:45:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Manipulations\\":1:{s:16:\\"\\u0000*\\u0000manipulations\\";a:3:{s:8:\\"optimize\\";a:1:{i:0;O:36:\\"Spatie\\\\ImageOptimizer\\\\OptimizerChain\\":3:{s:13:\\"\\u0000*\\u0000optimizers\\";a:7:{i:0;O:42:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Jpegoptim\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m85\\";i:1;s:7:\\"--force\\";i:2;s:11:\\"--strip-all\\";i:3;s:17:\\"--all-progressive\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:9:\\"jpegoptim\\";}i:1;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Pngquant\\":5:{s:7:\\"options\\";a:1:{i:0;s:7:\\"--force\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"pngquant\\";}i:2;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Optipng\\":5:{s:7:\\"options\\";a:3:{i:0;s:3:\\"-i0\\";i:1;s:3:\\"-o2\\";i:2;s:6:\\"-quiet\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"optipng\\";}i:3;O:37:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Svgo\\":5:{s:7:\\"options\\";a:1:{i:0;s:20:\\"--disable=cleanupIDs\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:4:\\"svgo\\";}i:4;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Gifsicle\\":5:{s:7:\\"options\\";a:2:{i:0;s:2:\\"-b\\";i:1;s:3:\\"-O3\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"gifsicle\\";}i:5;O:38:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Cwebp\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m 6\\";i:1;s:8:\\"-pass 10\\";i:2;s:3:\\"-mt\\";i:3;s:5:\\"-q 90\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:5:\\"cwebp\\";}i:6;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Avifenc\\":6:{s:7:\\"options\\";a:8:{i:0;s:14:\\"-a cq-level=23\\";i:1;s:6:\\"-j all\\";i:2;s:7:\\"--min 0\\";i:3;s:8:\\"--max 63\\";i:4;s:12:\\"--minalpha 0\\";i:5;s:13:\\"--maxalpha 63\\";i:6;s:14:\\"-a end-usage=q\\";i:7;s:12:\\"-a tune=ssim\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"avifenc\\";s:16:\\"decodeBinaryName\\";s:7:\\"avifdec\\";}}s:9:\\"\\u0000*\\u0000logger\\";O:33:\\"Spatie\\\\ImageOptimizer\\\\DummyLogger\\":0:{}s:10:\\"\\u0000*\\u0000timeout\\";i:60;}}s:6:\\"format\\";a:1:{i:0;s:3:\\"jpg\\";}s:3:\\"fit\\";a:3:{i:0;r:83;i:1;i:600;i:2;i:600;}}}s:23:\\"\\u0000*\\u0000performOnCollections\\";a:0:{}s:17:\\"\\u0000*\\u0000performOnQueue\\";b:1;s:26:\\"\\u0000*\\u0000keepOriginalImageFormat\\";b:0;s:27:\\"\\u0000*\\u0000generateResponsiveImages\\";b:0;s:18:\\"\\u0000*\\u0000widthCalculator\\";N;s:24:\\"\\u0000*\\u0000loadingAttributeValue\\";N;s:16:\\"\\u0000*\\u0000pdfPageNumber\\";i:1;s:7:\\"\\u0000*\\u0000name\\";s:4:\\"icon\\";}}s:28:\\"\\u0000*\\u0000escapeWhenCastingToString\\";b:0;}s:8:\\"\\u0000*\\u0000media\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":5:{s:5:\\"class\\";s:49:\\"Spatie\\\\MediaLibrary\\\\MediaCollections\\\\Models\\\\Media\\";s:2:\\"id\\";i:28;s:9:\\"relations\\";a:0:{}s:10:\\"connection\\";s:5:\\"pgsql\\";s:15:\\"collectionClass\\";N;}s:14:\\"\\u0000*\\u0000onlyMissing\\";b:0;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:0:\\"\\";}"}}	0	\N	1727078040	1727078040
29	default	{"uuid":"d672bad7-597f-463c-8d50-29f3c22baa6e","displayName":"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob","command":"O:58:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\\":5:{s:14:\\"\\u0000*\\u0000conversions\\";O:52:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\ConversionCollection\\":2:{s:8:\\"\\u0000*\\u0000items\\";a:2:{i:0;O:42:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\":11:{s:12:\\"\\u0000*\\u0000fileNamer\\";O:54:\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\":0:{}s:28:\\"\\u0000*\\u0000extractVideoFrameAtSecond\\";d:0;s:16:\\"\\u0000*\\u0000manipulations\\";O:45:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Manipulations\\":1:{s:16:\\"\\u0000*\\u0000manipulations\\";a:3:{s:8:\\"optimize\\";a:1:{i:0;O:36:\\"Spatie\\\\ImageOptimizer\\\\OptimizerChain\\":3:{s:13:\\"\\u0000*\\u0000optimizers\\";a:7:{i:0;O:42:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Jpegoptim\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m85\\";i:1;s:7:\\"--force\\";i:2;s:11:\\"--strip-all\\";i:3;s:17:\\"--all-progressive\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:9:\\"jpegoptim\\";}i:1;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Pngquant\\":5:{s:7:\\"options\\";a:1:{i:0;s:7:\\"--force\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"pngquant\\";}i:2;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Optipng\\":5:{s:7:\\"options\\";a:3:{i:0;s:3:\\"-i0\\";i:1;s:3:\\"-o2\\";i:2;s:6:\\"-quiet\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"optipng\\";}i:3;O:37:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Svgo\\":5:{s:7:\\"options\\";a:1:{i:0;s:20:\\"--disable=cleanupIDs\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:4:\\"svgo\\";}i:4;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Gifsicle\\":5:{s:7:\\"options\\";a:2:{i:0;s:2:\\"-b\\";i:1;s:3:\\"-O3\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"gifsicle\\";}i:5;O:38:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Cwebp\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m 6\\";i:1;s:8:\\"-pass 10\\";i:2;s:3:\\"-mt\\";i:3;s:5:\\"-q 90\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:5:\\"cwebp\\";}i:6;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Avifenc\\":6:{s:7:\\"options\\";a:8:{i:0;s:14:\\"-a cq-level=23\\";i:1;s:6:\\"-j all\\";i:2;s:7:\\"--min 0\\";i:3;s:8:\\"--max 63\\";i:4;s:12:\\"--minalpha 0\\";i:5;s:13:\\"--maxalpha 63\\";i:6;s:14:\\"-a end-usage=q\\";i:7;s:12:\\"-a tune=ssim\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"avifenc\\";s:16:\\"decodeBinaryName\\";s:7:\\"avifdec\\";}}s:9:\\"\\u0000*\\u0000logger\\";O:33:\\"Spatie\\\\ImageOptimizer\\\\DummyLogger\\":0:{}s:10:\\"\\u0000*\\u0000timeout\\";i:60;}}s:6:\\"format\\";a:1:{i:0;s:3:\\"jpg\\";}s:3:\\"fit\\";a:3:{i:0;E:27:\\"Spatie\\\\Image\\\\Enums\\\\Fit:Crop\\";i:1;i:800;i:2;i:800;}}}s:23:\\"\\u0000*\\u0000performOnCollections\\";a:0:{}s:17:\\"\\u0000*\\u0000performOnQueue\\";b:1;s:26:\\"\\u0000*\\u0000keepOriginalImageFormat\\";b:0;s:27:\\"\\u0000*\\u0000generateResponsiveImages\\";b:0;s:18:\\"\\u0000*\\u0000widthCalculator\\";N;s:24:\\"\\u0000*\\u0000loadingAttributeValue\\";N;s:16:\\"\\u0000*\\u0000pdfPageNumber\\";i:1;s:7:\\"\\u0000*\\u0000name\\";s:5:\\"thumb\\";}i:1;O:42:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\":11:{s:12:\\"\\u0000*\\u0000fileNamer\\";O:54:\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\":0:{}s:28:\\"\\u0000*\\u0000extractVideoFrameAtSecond\\";d:0;s:16:\\"\\u0000*\\u0000manipulations\\";O:45:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Manipulations\\":1:{s:16:\\"\\u0000*\\u0000manipulations\\";a:3:{s:8:\\"optimize\\";a:1:{i:0;O:36:\\"Spatie\\\\ImageOptimizer\\\\OptimizerChain\\":3:{s:13:\\"\\u0000*\\u0000optimizers\\";a:7:{i:0;O:42:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Jpegoptim\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m85\\";i:1;s:7:\\"--force\\";i:2;s:11:\\"--strip-all\\";i:3;s:17:\\"--all-progressive\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:9:\\"jpegoptim\\";}i:1;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Pngquant\\":5:{s:7:\\"options\\";a:1:{i:0;s:7:\\"--force\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"pngquant\\";}i:2;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Optipng\\":5:{s:7:\\"options\\";a:3:{i:0;s:3:\\"-i0\\";i:1;s:3:\\"-o2\\";i:2;s:6:\\"-quiet\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"optipng\\";}i:3;O:37:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Svgo\\":5:{s:7:\\"options\\";a:1:{i:0;s:20:\\"--disable=cleanupIDs\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:4:\\"svgo\\";}i:4;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Gifsicle\\":5:{s:7:\\"options\\";a:2:{i:0;s:2:\\"-b\\";i:1;s:3:\\"-O3\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"gifsicle\\";}i:5;O:38:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Cwebp\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m 6\\";i:1;s:8:\\"-pass 10\\";i:2;s:3:\\"-mt\\";i:3;s:5:\\"-q 90\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:5:\\"cwebp\\";}i:6;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Avifenc\\":6:{s:7:\\"options\\";a:8:{i:0;s:14:\\"-a cq-level=23\\";i:1;s:6:\\"-j all\\";i:2;s:7:\\"--min 0\\";i:3;s:8:\\"--max 63\\";i:4;s:12:\\"--minalpha 0\\";i:5;s:13:\\"--maxalpha 63\\";i:6;s:14:\\"-a end-usage=q\\";i:7;s:12:\\"-a tune=ssim\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"avifenc\\";s:16:\\"decodeBinaryName\\";s:7:\\"avifdec\\";}}s:9:\\"\\u0000*\\u0000logger\\";O:33:\\"Spatie\\\\ImageOptimizer\\\\DummyLogger\\":0:{}s:10:\\"\\u0000*\\u0000timeout\\";i:60;}}s:6:\\"format\\";a:1:{i:0;s:3:\\"jpg\\";}s:3:\\"fit\\";a:3:{i:0;r:83;i:1;i:600;i:2;i:600;}}}s:23:\\"\\u0000*\\u0000performOnCollections\\";a:0:{}s:17:\\"\\u0000*\\u0000performOnQueue\\";b:1;s:26:\\"\\u0000*\\u0000keepOriginalImageFormat\\";b:0;s:27:\\"\\u0000*\\u0000generateResponsiveImages\\";b:0;s:18:\\"\\u0000*\\u0000widthCalculator\\";N;s:24:\\"\\u0000*\\u0000loadingAttributeValue\\";N;s:16:\\"\\u0000*\\u0000pdfPageNumber\\";i:1;s:7:\\"\\u0000*\\u0000name\\";s:4:\\"icon\\";}}s:28:\\"\\u0000*\\u0000escapeWhenCastingToString\\";b:0;}s:8:\\"\\u0000*\\u0000media\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":5:{s:5:\\"class\\";s:49:\\"Spatie\\\\MediaLibrary\\\\MediaCollections\\\\Models\\\\Media\\";s:2:\\"id\\";i:29;s:9:\\"relations\\";a:0:{}s:10:\\"connection\\";s:5:\\"pgsql\\";s:15:\\"collectionClass\\";N;}s:14:\\"\\u0000*\\u0000onlyMissing\\";b:0;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:0:\\"\\";}"}}	0	\N	1727078067	1727078067
30	default	{"uuid":"116541c5-46bf-42f4-9895-4a3610bdc590","displayName":"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob","command":"O:58:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\\":5:{s:14:\\"\\u0000*\\u0000conversions\\";O:52:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\ConversionCollection\\":2:{s:8:\\"\\u0000*\\u0000items\\";a:2:{i:0;O:42:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\":11:{s:12:\\"\\u0000*\\u0000fileNamer\\";O:54:\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\":0:{}s:28:\\"\\u0000*\\u0000extractVideoFrameAtSecond\\";d:0;s:16:\\"\\u0000*\\u0000manipulations\\";O:45:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Manipulations\\":1:{s:16:\\"\\u0000*\\u0000manipulations\\";a:3:{s:8:\\"optimize\\";a:1:{i:0;O:36:\\"Spatie\\\\ImageOptimizer\\\\OptimizerChain\\":3:{s:13:\\"\\u0000*\\u0000optimizers\\";a:7:{i:0;O:42:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Jpegoptim\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m85\\";i:1;s:7:\\"--force\\";i:2;s:11:\\"--strip-all\\";i:3;s:17:\\"--all-progressive\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:9:\\"jpegoptim\\";}i:1;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Pngquant\\":5:{s:7:\\"options\\";a:1:{i:0;s:7:\\"--force\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"pngquant\\";}i:2;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Optipng\\":5:{s:7:\\"options\\";a:3:{i:0;s:3:\\"-i0\\";i:1;s:3:\\"-o2\\";i:2;s:6:\\"-quiet\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"optipng\\";}i:3;O:37:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Svgo\\":5:{s:7:\\"options\\";a:1:{i:0;s:20:\\"--disable=cleanupIDs\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:4:\\"svgo\\";}i:4;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Gifsicle\\":5:{s:7:\\"options\\";a:2:{i:0;s:2:\\"-b\\";i:1;s:3:\\"-O3\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"gifsicle\\";}i:5;O:38:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Cwebp\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m 6\\";i:1;s:8:\\"-pass 10\\";i:2;s:3:\\"-mt\\";i:3;s:5:\\"-q 90\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:5:\\"cwebp\\";}i:6;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Avifenc\\":6:{s:7:\\"options\\";a:8:{i:0;s:14:\\"-a cq-level=23\\";i:1;s:6:\\"-j all\\";i:2;s:7:\\"--min 0\\";i:3;s:8:\\"--max 63\\";i:4;s:12:\\"--minalpha 0\\";i:5;s:13:\\"--maxalpha 63\\";i:6;s:14:\\"-a end-usage=q\\";i:7;s:12:\\"-a tune=ssim\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"avifenc\\";s:16:\\"decodeBinaryName\\";s:7:\\"avifdec\\";}}s:9:\\"\\u0000*\\u0000logger\\";O:33:\\"Spatie\\\\ImageOptimizer\\\\DummyLogger\\":0:{}s:10:\\"\\u0000*\\u0000timeout\\";i:60;}}s:6:\\"format\\";a:1:{i:0;s:3:\\"jpg\\";}s:3:\\"fit\\";a:3:{i:0;E:27:\\"Spatie\\\\Image\\\\Enums\\\\Fit:Crop\\";i:1;i:800;i:2;i:800;}}}s:23:\\"\\u0000*\\u0000performOnCollections\\";a:0:{}s:17:\\"\\u0000*\\u0000performOnQueue\\";b:1;s:26:\\"\\u0000*\\u0000keepOriginalImageFormat\\";b:0;s:27:\\"\\u0000*\\u0000generateResponsiveImages\\";b:0;s:18:\\"\\u0000*\\u0000widthCalculator\\";N;s:24:\\"\\u0000*\\u0000loadingAttributeValue\\";N;s:16:\\"\\u0000*\\u0000pdfPageNumber\\";i:1;s:7:\\"\\u0000*\\u0000name\\";s:5:\\"thumb\\";}i:1;O:42:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\":11:{s:12:\\"\\u0000*\\u0000fileNamer\\";O:54:\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\":0:{}s:28:\\"\\u0000*\\u0000extractVideoFrameAtSecond\\";d:0;s:16:\\"\\u0000*\\u0000manipulations\\";O:45:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Manipulations\\":1:{s:16:\\"\\u0000*\\u0000manipulations\\";a:3:{s:8:\\"optimize\\";a:1:{i:0;O:36:\\"Spatie\\\\ImageOptimizer\\\\OptimizerChain\\":3:{s:13:\\"\\u0000*\\u0000optimizers\\";a:7:{i:0;O:42:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Jpegoptim\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m85\\";i:1;s:7:\\"--force\\";i:2;s:11:\\"--strip-all\\";i:3;s:17:\\"--all-progressive\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:9:\\"jpegoptim\\";}i:1;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Pngquant\\":5:{s:7:\\"options\\";a:1:{i:0;s:7:\\"--force\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"pngquant\\";}i:2;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Optipng\\":5:{s:7:\\"options\\";a:3:{i:0;s:3:\\"-i0\\";i:1;s:3:\\"-o2\\";i:2;s:6:\\"-quiet\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"optipng\\";}i:3;O:37:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Svgo\\":5:{s:7:\\"options\\";a:1:{i:0;s:20:\\"--disable=cleanupIDs\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:4:\\"svgo\\";}i:4;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Gifsicle\\":5:{s:7:\\"options\\";a:2:{i:0;s:2:\\"-b\\";i:1;s:3:\\"-O3\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"gifsicle\\";}i:5;O:38:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Cwebp\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m 6\\";i:1;s:8:\\"-pass 10\\";i:2;s:3:\\"-mt\\";i:3;s:5:\\"-q 90\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:5:\\"cwebp\\";}i:6;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Avifenc\\":6:{s:7:\\"options\\";a:8:{i:0;s:14:\\"-a cq-level=23\\";i:1;s:6:\\"-j all\\";i:2;s:7:\\"--min 0\\";i:3;s:8:\\"--max 63\\";i:4;s:12:\\"--minalpha 0\\";i:5;s:13:\\"--maxalpha 63\\";i:6;s:14:\\"-a end-usage=q\\";i:7;s:12:\\"-a tune=ssim\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"avifenc\\";s:16:\\"decodeBinaryName\\";s:7:\\"avifdec\\";}}s:9:\\"\\u0000*\\u0000logger\\";O:33:\\"Spatie\\\\ImageOptimizer\\\\DummyLogger\\":0:{}s:10:\\"\\u0000*\\u0000timeout\\";i:60;}}s:6:\\"format\\";a:1:{i:0;s:3:\\"jpg\\";}s:3:\\"fit\\";a:3:{i:0;r:83;i:1;i:600;i:2;i:600;}}}s:23:\\"\\u0000*\\u0000performOnCollections\\";a:0:{}s:17:\\"\\u0000*\\u0000performOnQueue\\";b:1;s:26:\\"\\u0000*\\u0000keepOriginalImageFormat\\";b:0;s:27:\\"\\u0000*\\u0000generateResponsiveImages\\";b:0;s:18:\\"\\u0000*\\u0000widthCalculator\\";N;s:24:\\"\\u0000*\\u0000loadingAttributeValue\\";N;s:16:\\"\\u0000*\\u0000pdfPageNumber\\";i:1;s:7:\\"\\u0000*\\u0000name\\";s:4:\\"icon\\";}}s:28:\\"\\u0000*\\u0000escapeWhenCastingToString\\";b:0;}s:8:\\"\\u0000*\\u0000media\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":5:{s:5:\\"class\\";s:49:\\"Spatie\\\\MediaLibrary\\\\MediaCollections\\\\Models\\\\Media\\";s:2:\\"id\\";i:30;s:9:\\"relations\\";a:0:{}s:10:\\"connection\\";s:5:\\"pgsql\\";s:15:\\"collectionClass\\";N;}s:14:\\"\\u0000*\\u0000onlyMissing\\";b:0;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:0:\\"\\";}"}}	0	\N	1727078119	1727078119
31	default	{"uuid":"a691d8fb-ec93-4f7c-8df3-9f10e8911358","displayName":"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob","command":"O:58:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\\":5:{s:14:\\"\\u0000*\\u0000conversions\\";O:52:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\ConversionCollection\\":2:{s:8:\\"\\u0000*\\u0000items\\";a:2:{i:0;O:42:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\":11:{s:12:\\"\\u0000*\\u0000fileNamer\\";O:54:\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\":0:{}s:28:\\"\\u0000*\\u0000extractVideoFrameAtSecond\\";d:0;s:16:\\"\\u0000*\\u0000manipulations\\";O:45:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Manipulations\\":1:{s:16:\\"\\u0000*\\u0000manipulations\\";a:3:{s:8:\\"optimize\\";a:1:{i:0;O:36:\\"Spatie\\\\ImageOptimizer\\\\OptimizerChain\\":3:{s:13:\\"\\u0000*\\u0000optimizers\\";a:7:{i:0;O:42:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Jpegoptim\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m85\\";i:1;s:7:\\"--force\\";i:2;s:11:\\"--strip-all\\";i:3;s:17:\\"--all-progressive\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:9:\\"jpegoptim\\";}i:1;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Pngquant\\":5:{s:7:\\"options\\";a:1:{i:0;s:7:\\"--force\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"pngquant\\";}i:2;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Optipng\\":5:{s:7:\\"options\\";a:3:{i:0;s:3:\\"-i0\\";i:1;s:3:\\"-o2\\";i:2;s:6:\\"-quiet\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"optipng\\";}i:3;O:37:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Svgo\\":5:{s:7:\\"options\\";a:1:{i:0;s:20:\\"--disable=cleanupIDs\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:4:\\"svgo\\";}i:4;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Gifsicle\\":5:{s:7:\\"options\\";a:2:{i:0;s:2:\\"-b\\";i:1;s:3:\\"-O3\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"gifsicle\\";}i:5;O:38:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Cwebp\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m 6\\";i:1;s:8:\\"-pass 10\\";i:2;s:3:\\"-mt\\";i:3;s:5:\\"-q 90\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:5:\\"cwebp\\";}i:6;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Avifenc\\":6:{s:7:\\"options\\";a:8:{i:0;s:14:\\"-a cq-level=23\\";i:1;s:6:\\"-j all\\";i:2;s:7:\\"--min 0\\";i:3;s:8:\\"--max 63\\";i:4;s:12:\\"--minalpha 0\\";i:5;s:13:\\"--maxalpha 63\\";i:6;s:14:\\"-a end-usage=q\\";i:7;s:12:\\"-a tune=ssim\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"avifenc\\";s:16:\\"decodeBinaryName\\";s:7:\\"avifdec\\";}}s:9:\\"\\u0000*\\u0000logger\\";O:33:\\"Spatie\\\\ImageOptimizer\\\\DummyLogger\\":0:{}s:10:\\"\\u0000*\\u0000timeout\\";i:60;}}s:6:\\"format\\";a:1:{i:0;s:3:\\"jpg\\";}s:3:\\"fit\\";a:3:{i:0;E:27:\\"Spatie\\\\Image\\\\Enums\\\\Fit:Crop\\";i:1;i:800;i:2;i:800;}}}s:23:\\"\\u0000*\\u0000performOnCollections\\";a:0:{}s:17:\\"\\u0000*\\u0000performOnQueue\\";b:1;s:26:\\"\\u0000*\\u0000keepOriginalImageFormat\\";b:0;s:27:\\"\\u0000*\\u0000generateResponsiveImages\\";b:0;s:18:\\"\\u0000*\\u0000widthCalculator\\";N;s:24:\\"\\u0000*\\u0000loadingAttributeValue\\";N;s:16:\\"\\u0000*\\u0000pdfPageNumber\\";i:1;s:7:\\"\\u0000*\\u0000name\\";s:5:\\"thumb\\";}i:1;O:42:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\":11:{s:12:\\"\\u0000*\\u0000fileNamer\\";O:54:\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\":0:{}s:28:\\"\\u0000*\\u0000extractVideoFrameAtSecond\\";d:0;s:16:\\"\\u0000*\\u0000manipulations\\";O:45:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Manipulations\\":1:{s:16:\\"\\u0000*\\u0000manipulations\\";a:3:{s:8:\\"optimize\\";a:1:{i:0;O:36:\\"Spatie\\\\ImageOptimizer\\\\OptimizerChain\\":3:{s:13:\\"\\u0000*\\u0000optimizers\\";a:7:{i:0;O:42:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Jpegoptim\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m85\\";i:1;s:7:\\"--force\\";i:2;s:11:\\"--strip-all\\";i:3;s:17:\\"--all-progressive\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:9:\\"jpegoptim\\";}i:1;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Pngquant\\":5:{s:7:\\"options\\";a:1:{i:0;s:7:\\"--force\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"pngquant\\";}i:2;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Optipng\\":5:{s:7:\\"options\\";a:3:{i:0;s:3:\\"-i0\\";i:1;s:3:\\"-o2\\";i:2;s:6:\\"-quiet\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"optipng\\";}i:3;O:37:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Svgo\\":5:{s:7:\\"options\\";a:1:{i:0;s:20:\\"--disable=cleanupIDs\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:4:\\"svgo\\";}i:4;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Gifsicle\\":5:{s:7:\\"options\\";a:2:{i:0;s:2:\\"-b\\";i:1;s:3:\\"-O3\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"gifsicle\\";}i:5;O:38:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Cwebp\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m 6\\";i:1;s:8:\\"-pass 10\\";i:2;s:3:\\"-mt\\";i:3;s:5:\\"-q 90\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:5:\\"cwebp\\";}i:6;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Avifenc\\":6:{s:7:\\"options\\";a:8:{i:0;s:14:\\"-a cq-level=23\\";i:1;s:6:\\"-j all\\";i:2;s:7:\\"--min 0\\";i:3;s:8:\\"--max 63\\";i:4;s:12:\\"--minalpha 0\\";i:5;s:13:\\"--maxalpha 63\\";i:6;s:14:\\"-a end-usage=q\\";i:7;s:12:\\"-a tune=ssim\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"avifenc\\";s:16:\\"decodeBinaryName\\";s:7:\\"avifdec\\";}}s:9:\\"\\u0000*\\u0000logger\\";O:33:\\"Spatie\\\\ImageOptimizer\\\\DummyLogger\\":0:{}s:10:\\"\\u0000*\\u0000timeout\\";i:60;}}s:6:\\"format\\";a:1:{i:0;s:3:\\"jpg\\";}s:3:\\"fit\\";a:3:{i:0;r:83;i:1;i:600;i:2;i:600;}}}s:23:\\"\\u0000*\\u0000performOnCollections\\";a:0:{}s:17:\\"\\u0000*\\u0000performOnQueue\\";b:1;s:26:\\"\\u0000*\\u0000keepOriginalImageFormat\\";b:0;s:27:\\"\\u0000*\\u0000generateResponsiveImages\\";b:0;s:18:\\"\\u0000*\\u0000widthCalculator\\";N;s:24:\\"\\u0000*\\u0000loadingAttributeValue\\";N;s:16:\\"\\u0000*\\u0000pdfPageNumber\\";i:1;s:7:\\"\\u0000*\\u0000name\\";s:4:\\"icon\\";}}s:28:\\"\\u0000*\\u0000escapeWhenCastingToString\\";b:0;}s:8:\\"\\u0000*\\u0000media\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":5:{s:5:\\"class\\";s:49:\\"Spatie\\\\MediaLibrary\\\\MediaCollections\\\\Models\\\\Media\\";s:2:\\"id\\";i:31;s:9:\\"relations\\";a:0:{}s:10:\\"connection\\";s:5:\\"pgsql\\";s:15:\\"collectionClass\\";N;}s:14:\\"\\u0000*\\u0000onlyMissing\\";b:0;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:0:\\"\\";}"}}	0	\N	1727078155	1727078155
32	default	{"uuid":"4c79d6c2-c1d0-4f93-8dd2-f58d0a73b5f7","displayName":"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob","command":"O:58:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\\":5:{s:14:\\"\\u0000*\\u0000conversions\\";O:52:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\ConversionCollection\\":2:{s:8:\\"\\u0000*\\u0000items\\";a:2:{i:0;O:42:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\":11:{s:12:\\"\\u0000*\\u0000fileNamer\\";O:54:\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\":0:{}s:28:\\"\\u0000*\\u0000extractVideoFrameAtSecond\\";d:0;s:16:\\"\\u0000*\\u0000manipulations\\";O:45:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Manipulations\\":1:{s:16:\\"\\u0000*\\u0000manipulations\\";a:3:{s:8:\\"optimize\\";a:1:{i:0;O:36:\\"Spatie\\\\ImageOptimizer\\\\OptimizerChain\\":3:{s:13:\\"\\u0000*\\u0000optimizers\\";a:7:{i:0;O:42:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Jpegoptim\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m85\\";i:1;s:7:\\"--force\\";i:2;s:11:\\"--strip-all\\";i:3;s:17:\\"--all-progressive\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:9:\\"jpegoptim\\";}i:1;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Pngquant\\":5:{s:7:\\"options\\";a:1:{i:0;s:7:\\"--force\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"pngquant\\";}i:2;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Optipng\\":5:{s:7:\\"options\\";a:3:{i:0;s:3:\\"-i0\\";i:1;s:3:\\"-o2\\";i:2;s:6:\\"-quiet\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"optipng\\";}i:3;O:37:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Svgo\\":5:{s:7:\\"options\\";a:1:{i:0;s:20:\\"--disable=cleanupIDs\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:4:\\"svgo\\";}i:4;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Gifsicle\\":5:{s:7:\\"options\\";a:2:{i:0;s:2:\\"-b\\";i:1;s:3:\\"-O3\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"gifsicle\\";}i:5;O:38:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Cwebp\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m 6\\";i:1;s:8:\\"-pass 10\\";i:2;s:3:\\"-mt\\";i:3;s:5:\\"-q 90\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:5:\\"cwebp\\";}i:6;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Avifenc\\":6:{s:7:\\"options\\";a:8:{i:0;s:14:\\"-a cq-level=23\\";i:1;s:6:\\"-j all\\";i:2;s:7:\\"--min 0\\";i:3;s:8:\\"--max 63\\";i:4;s:12:\\"--minalpha 0\\";i:5;s:13:\\"--maxalpha 63\\";i:6;s:14:\\"-a end-usage=q\\";i:7;s:12:\\"-a tune=ssim\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"avifenc\\";s:16:\\"decodeBinaryName\\";s:7:\\"avifdec\\";}}s:9:\\"\\u0000*\\u0000logger\\";O:33:\\"Spatie\\\\ImageOptimizer\\\\DummyLogger\\":0:{}s:10:\\"\\u0000*\\u0000timeout\\";i:60;}}s:6:\\"format\\";a:1:{i:0;s:3:\\"jpg\\";}s:3:\\"fit\\";a:3:{i:0;E:27:\\"Spatie\\\\Image\\\\Enums\\\\Fit:Crop\\";i:1;i:600;i:2;i:600;}}}s:23:\\"\\u0000*\\u0000performOnCollections\\";a:0:{}s:17:\\"\\u0000*\\u0000performOnQueue\\";b:1;s:26:\\"\\u0000*\\u0000keepOriginalImageFormat\\";b:0;s:27:\\"\\u0000*\\u0000generateResponsiveImages\\";b:0;s:18:\\"\\u0000*\\u0000widthCalculator\\";N;s:24:\\"\\u0000*\\u0000loadingAttributeValue\\";N;s:16:\\"\\u0000*\\u0000pdfPageNumber\\";i:1;s:7:\\"\\u0000*\\u0000name\\";s:5:\\"thumb\\";}i:1;O:42:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\":11:{s:12:\\"\\u0000*\\u0000fileNamer\\";O:54:\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\":0:{}s:28:\\"\\u0000*\\u0000extractVideoFrameAtSecond\\";d:0;s:16:\\"\\u0000*\\u0000manipulations\\";O:45:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Manipulations\\":1:{s:16:\\"\\u0000*\\u0000manipulations\\";a:3:{s:8:\\"optimize\\";a:1:{i:0;O:36:\\"Spatie\\\\ImageOptimizer\\\\OptimizerChain\\":3:{s:13:\\"\\u0000*\\u0000optimizers\\";a:7:{i:0;O:42:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Jpegoptim\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m85\\";i:1;s:7:\\"--force\\";i:2;s:11:\\"--strip-all\\";i:3;s:17:\\"--all-progressive\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:9:\\"jpegoptim\\";}i:1;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Pngquant\\":5:{s:7:\\"options\\";a:1:{i:0;s:7:\\"--force\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"pngquant\\";}i:2;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Optipng\\":5:{s:7:\\"options\\";a:3:{i:0;s:3:\\"-i0\\";i:1;s:3:\\"-o2\\";i:2;s:6:\\"-quiet\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"optipng\\";}i:3;O:37:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Svgo\\":5:{s:7:\\"options\\";a:1:{i:0;s:20:\\"--disable=cleanupIDs\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:4:\\"svgo\\";}i:4;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Gifsicle\\":5:{s:7:\\"options\\";a:2:{i:0;s:2:\\"-b\\";i:1;s:3:\\"-O3\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"gifsicle\\";}i:5;O:38:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Cwebp\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m 6\\";i:1;s:8:\\"-pass 10\\";i:2;s:3:\\"-mt\\";i:3;s:5:\\"-q 90\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:5:\\"cwebp\\";}i:6;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Avifenc\\":6:{s:7:\\"options\\";a:8:{i:0;s:14:\\"-a cq-level=23\\";i:1;s:6:\\"-j all\\";i:2;s:7:\\"--min 0\\";i:3;s:8:\\"--max 63\\";i:4;s:12:\\"--minalpha 0\\";i:5;s:13:\\"--maxalpha 63\\";i:6;s:14:\\"-a end-usage=q\\";i:7;s:12:\\"-a tune=ssim\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"avifenc\\";s:16:\\"decodeBinaryName\\";s:7:\\"avifdec\\";}}s:9:\\"\\u0000*\\u0000logger\\";O:33:\\"Spatie\\\\ImageOptimizer\\\\DummyLogger\\":0:{}s:10:\\"\\u0000*\\u0000timeout\\";i:60;}}s:6:\\"format\\";a:1:{i:0;s:3:\\"jpg\\";}s:3:\\"fit\\";a:3:{i:0;r:83;i:1;i:400;i:2;i:400;}}}s:23:\\"\\u0000*\\u0000performOnCollections\\";a:0:{}s:17:\\"\\u0000*\\u0000performOnQueue\\";b:1;s:26:\\"\\u0000*\\u0000keepOriginalImageFormat\\";b:0;s:27:\\"\\u0000*\\u0000generateResponsiveImages\\";b:0;s:18:\\"\\u0000*\\u0000widthCalculator\\";N;s:24:\\"\\u0000*\\u0000loadingAttributeValue\\";N;s:16:\\"\\u0000*\\u0000pdfPageNumber\\";i:1;s:7:\\"\\u0000*\\u0000name\\";s:4:\\"icon\\";}}s:28:\\"\\u0000*\\u0000escapeWhenCastingToString\\";b:0;}s:8:\\"\\u0000*\\u0000media\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":5:{s:5:\\"class\\";s:49:\\"Spatie\\\\MediaLibrary\\\\MediaCollections\\\\Models\\\\Media\\";s:2:\\"id\\";i:32;s:9:\\"relations\\";a:0:{}s:10:\\"connection\\";s:5:\\"pgsql\\";s:15:\\"collectionClass\\";N;}s:14:\\"\\u0000*\\u0000onlyMissing\\";b:0;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:0:\\"\\";}"}}	0	\N	1727431663	1727431663
34	default	{"uuid":"1b63eff6-9931-46d8-8b18-1e67696db21f","displayName":"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob","command":"O:58:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\\":5:{s:14:\\"\\u0000*\\u0000conversions\\";O:52:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\ConversionCollection\\":2:{s:8:\\"\\u0000*\\u0000items\\";a:2:{i:0;O:42:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\":11:{s:12:\\"\\u0000*\\u0000fileNamer\\";O:54:\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\":0:{}s:28:\\"\\u0000*\\u0000extractVideoFrameAtSecond\\";d:0;s:16:\\"\\u0000*\\u0000manipulations\\";O:45:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Manipulations\\":1:{s:16:\\"\\u0000*\\u0000manipulations\\";a:3:{s:8:\\"optimize\\";a:1:{i:0;O:36:\\"Spatie\\\\ImageOptimizer\\\\OptimizerChain\\":3:{s:13:\\"\\u0000*\\u0000optimizers\\";a:7:{i:0;O:42:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Jpegoptim\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m85\\";i:1;s:7:\\"--force\\";i:2;s:11:\\"--strip-all\\";i:3;s:17:\\"--all-progressive\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:9:\\"jpegoptim\\";}i:1;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Pngquant\\":5:{s:7:\\"options\\";a:1:{i:0;s:7:\\"--force\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"pngquant\\";}i:2;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Optipng\\":5:{s:7:\\"options\\";a:3:{i:0;s:3:\\"-i0\\";i:1;s:3:\\"-o2\\";i:2;s:6:\\"-quiet\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"optipng\\";}i:3;O:37:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Svgo\\":5:{s:7:\\"options\\";a:1:{i:0;s:20:\\"--disable=cleanupIDs\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:4:\\"svgo\\";}i:4;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Gifsicle\\":5:{s:7:\\"options\\";a:2:{i:0;s:2:\\"-b\\";i:1;s:3:\\"-O3\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"gifsicle\\";}i:5;O:38:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Cwebp\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m 6\\";i:1;s:8:\\"-pass 10\\";i:2;s:3:\\"-mt\\";i:3;s:5:\\"-q 90\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:5:\\"cwebp\\";}i:6;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Avifenc\\":6:{s:7:\\"options\\";a:8:{i:0;s:14:\\"-a cq-level=23\\";i:1;s:6:\\"-j all\\";i:2;s:7:\\"--min 0\\";i:3;s:8:\\"--max 63\\";i:4;s:12:\\"--minalpha 0\\";i:5;s:13:\\"--maxalpha 63\\";i:6;s:14:\\"-a end-usage=q\\";i:7;s:12:\\"-a tune=ssim\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"avifenc\\";s:16:\\"decodeBinaryName\\";s:7:\\"avifdec\\";}}s:9:\\"\\u0000*\\u0000logger\\";O:33:\\"Spatie\\\\ImageOptimizer\\\\DummyLogger\\":0:{}s:10:\\"\\u0000*\\u0000timeout\\";i:60;}}s:6:\\"format\\";a:1:{i:0;s:3:\\"jpg\\";}s:3:\\"fit\\";a:3:{i:0;E:27:\\"Spatie\\\\Image\\\\Enums\\\\Fit:Crop\\";i:1;i:600;i:2;i:600;}}}s:23:\\"\\u0000*\\u0000performOnCollections\\";a:0:{}s:17:\\"\\u0000*\\u0000performOnQueue\\";b:1;s:26:\\"\\u0000*\\u0000keepOriginalImageFormat\\";b:0;s:27:\\"\\u0000*\\u0000generateResponsiveImages\\";b:0;s:18:\\"\\u0000*\\u0000widthCalculator\\";N;s:24:\\"\\u0000*\\u0000loadingAttributeValue\\";N;s:16:\\"\\u0000*\\u0000pdfPageNumber\\";i:1;s:7:\\"\\u0000*\\u0000name\\";s:5:\\"thumb\\";}i:1;O:42:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\":11:{s:12:\\"\\u0000*\\u0000fileNamer\\";O:54:\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\":0:{}s:28:\\"\\u0000*\\u0000extractVideoFrameAtSecond\\";d:0;s:16:\\"\\u0000*\\u0000manipulations\\";O:45:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Manipulations\\":1:{s:16:\\"\\u0000*\\u0000manipulations\\";a:3:{s:8:\\"optimize\\";a:1:{i:0;O:36:\\"Spatie\\\\ImageOptimizer\\\\OptimizerChain\\":3:{s:13:\\"\\u0000*\\u0000optimizers\\";a:7:{i:0;O:42:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Jpegoptim\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m85\\";i:1;s:7:\\"--force\\";i:2;s:11:\\"--strip-all\\";i:3;s:17:\\"--all-progressive\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:9:\\"jpegoptim\\";}i:1;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Pngquant\\":5:{s:7:\\"options\\";a:1:{i:0;s:7:\\"--force\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"pngquant\\";}i:2;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Optipng\\":5:{s:7:\\"options\\";a:3:{i:0;s:3:\\"-i0\\";i:1;s:3:\\"-o2\\";i:2;s:6:\\"-quiet\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"optipng\\";}i:3;O:37:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Svgo\\":5:{s:7:\\"options\\";a:1:{i:0;s:20:\\"--disable=cleanupIDs\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:4:\\"svgo\\";}i:4;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Gifsicle\\":5:{s:7:\\"options\\";a:2:{i:0;s:2:\\"-b\\";i:1;s:3:\\"-O3\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"gifsicle\\";}i:5;O:38:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Cwebp\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m 6\\";i:1;s:8:\\"-pass 10\\";i:2;s:3:\\"-mt\\";i:3;s:5:\\"-q 90\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:5:\\"cwebp\\";}i:6;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Avifenc\\":6:{s:7:\\"options\\";a:8:{i:0;s:14:\\"-a cq-level=23\\";i:1;s:6:\\"-j all\\";i:2;s:7:\\"--min 0\\";i:3;s:8:\\"--max 63\\";i:4;s:12:\\"--minalpha 0\\";i:5;s:13:\\"--maxalpha 63\\";i:6;s:14:\\"-a end-usage=q\\";i:7;s:12:\\"-a tune=ssim\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"avifenc\\";s:16:\\"decodeBinaryName\\";s:7:\\"avifdec\\";}}s:9:\\"\\u0000*\\u0000logger\\";O:33:\\"Spatie\\\\ImageOptimizer\\\\DummyLogger\\":0:{}s:10:\\"\\u0000*\\u0000timeout\\";i:60;}}s:6:\\"format\\";a:1:{i:0;s:3:\\"jpg\\";}s:3:\\"fit\\";a:3:{i:0;r:83;i:1;i:400;i:2;i:400;}}}s:23:\\"\\u0000*\\u0000performOnCollections\\";a:0:{}s:17:\\"\\u0000*\\u0000performOnQueue\\";b:1;s:26:\\"\\u0000*\\u0000keepOriginalImageFormat\\";b:0;s:27:\\"\\u0000*\\u0000generateResponsiveImages\\";b:0;s:18:\\"\\u0000*\\u0000widthCalculator\\";N;s:24:\\"\\u0000*\\u0000loadingAttributeValue\\";N;s:16:\\"\\u0000*\\u0000pdfPageNumber\\";i:1;s:7:\\"\\u0000*\\u0000name\\";s:4:\\"icon\\";}}s:28:\\"\\u0000*\\u0000escapeWhenCastingToString\\";b:0;}s:8:\\"\\u0000*\\u0000media\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":5:{s:5:\\"class\\";s:49:\\"Spatie\\\\MediaLibrary\\\\MediaCollections\\\\Models\\\\Media\\";s:2:\\"id\\";i:34;s:9:\\"relations\\";a:0:{}s:10:\\"connection\\";s:5:\\"pgsql\\";s:15:\\"collectionClass\\";N;}s:14:\\"\\u0000*\\u0000onlyMissing\\";b:0;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:0:\\"\\";}"}}	0	\N	1727432231	1727432231
35	default	{"uuid":"53115574-dd9d-4c68-8bcd-77ee9704d93e","displayName":"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob","command":"O:58:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\\":5:{s:14:\\"\\u0000*\\u0000conversions\\";O:52:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\ConversionCollection\\":2:{s:8:\\"\\u0000*\\u0000items\\";a:2:{i:0;O:42:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\":11:{s:12:\\"\\u0000*\\u0000fileNamer\\";O:54:\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\":0:{}s:28:\\"\\u0000*\\u0000extractVideoFrameAtSecond\\";d:0;s:16:\\"\\u0000*\\u0000manipulations\\";O:45:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Manipulations\\":1:{s:16:\\"\\u0000*\\u0000manipulations\\";a:3:{s:8:\\"optimize\\";a:1:{i:0;O:36:\\"Spatie\\\\ImageOptimizer\\\\OptimizerChain\\":3:{s:13:\\"\\u0000*\\u0000optimizers\\";a:7:{i:0;O:42:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Jpegoptim\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m85\\";i:1;s:7:\\"--force\\";i:2;s:11:\\"--strip-all\\";i:3;s:17:\\"--all-progressive\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:9:\\"jpegoptim\\";}i:1;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Pngquant\\":5:{s:7:\\"options\\";a:1:{i:0;s:7:\\"--force\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"pngquant\\";}i:2;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Optipng\\":5:{s:7:\\"options\\";a:3:{i:0;s:3:\\"-i0\\";i:1;s:3:\\"-o2\\";i:2;s:6:\\"-quiet\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"optipng\\";}i:3;O:37:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Svgo\\":5:{s:7:\\"options\\";a:1:{i:0;s:20:\\"--disable=cleanupIDs\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:4:\\"svgo\\";}i:4;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Gifsicle\\":5:{s:7:\\"options\\";a:2:{i:0;s:2:\\"-b\\";i:1;s:3:\\"-O3\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"gifsicle\\";}i:5;O:38:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Cwebp\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m 6\\";i:1;s:8:\\"-pass 10\\";i:2;s:3:\\"-mt\\";i:3;s:5:\\"-q 90\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:5:\\"cwebp\\";}i:6;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Avifenc\\":6:{s:7:\\"options\\";a:8:{i:0;s:14:\\"-a cq-level=23\\";i:1;s:6:\\"-j all\\";i:2;s:7:\\"--min 0\\";i:3;s:8:\\"--max 63\\";i:4;s:12:\\"--minalpha 0\\";i:5;s:13:\\"--maxalpha 63\\";i:6;s:14:\\"-a end-usage=q\\";i:7;s:12:\\"-a tune=ssim\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"avifenc\\";s:16:\\"decodeBinaryName\\";s:7:\\"avifdec\\";}}s:9:\\"\\u0000*\\u0000logger\\";O:33:\\"Spatie\\\\ImageOptimizer\\\\DummyLogger\\":0:{}s:10:\\"\\u0000*\\u0000timeout\\";i:60;}}s:6:\\"format\\";a:1:{i:0;s:3:\\"jpg\\";}s:3:\\"fit\\";a:3:{i:0;E:27:\\"Spatie\\\\Image\\\\Enums\\\\Fit:Crop\\";i:1;i:600;i:2;i:600;}}}s:23:\\"\\u0000*\\u0000performOnCollections\\";a:0:{}s:17:\\"\\u0000*\\u0000performOnQueue\\";b:1;s:26:\\"\\u0000*\\u0000keepOriginalImageFormat\\";b:0;s:27:\\"\\u0000*\\u0000generateResponsiveImages\\";b:0;s:18:\\"\\u0000*\\u0000widthCalculator\\";N;s:24:\\"\\u0000*\\u0000loadingAttributeValue\\";N;s:16:\\"\\u0000*\\u0000pdfPageNumber\\";i:1;s:7:\\"\\u0000*\\u0000name\\";s:5:\\"thumb\\";}i:1;O:42:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\":11:{s:12:\\"\\u0000*\\u0000fileNamer\\";O:54:\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\":0:{}s:28:\\"\\u0000*\\u0000extractVideoFrameAtSecond\\";d:0;s:16:\\"\\u0000*\\u0000manipulations\\";O:45:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Manipulations\\":1:{s:16:\\"\\u0000*\\u0000manipulations\\";a:3:{s:8:\\"optimize\\";a:1:{i:0;O:36:\\"Spatie\\\\ImageOptimizer\\\\OptimizerChain\\":3:{s:13:\\"\\u0000*\\u0000optimizers\\";a:7:{i:0;O:42:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Jpegoptim\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m85\\";i:1;s:7:\\"--force\\";i:2;s:11:\\"--strip-all\\";i:3;s:17:\\"--all-progressive\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:9:\\"jpegoptim\\";}i:1;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Pngquant\\":5:{s:7:\\"options\\";a:1:{i:0;s:7:\\"--force\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"pngquant\\";}i:2;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Optipng\\":5:{s:7:\\"options\\";a:3:{i:0;s:3:\\"-i0\\";i:1;s:3:\\"-o2\\";i:2;s:6:\\"-quiet\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"optipng\\";}i:3;O:37:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Svgo\\":5:{s:7:\\"options\\";a:1:{i:0;s:20:\\"--disable=cleanupIDs\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:4:\\"svgo\\";}i:4;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Gifsicle\\":5:{s:7:\\"options\\";a:2:{i:0;s:2:\\"-b\\";i:1;s:3:\\"-O3\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"gifsicle\\";}i:5;O:38:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Cwebp\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m 6\\";i:1;s:8:\\"-pass 10\\";i:2;s:3:\\"-mt\\";i:3;s:5:\\"-q 90\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:5:\\"cwebp\\";}i:6;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Avifenc\\":6:{s:7:\\"options\\";a:8:{i:0;s:14:\\"-a cq-level=23\\";i:1;s:6:\\"-j all\\";i:2;s:7:\\"--min 0\\";i:3;s:8:\\"--max 63\\";i:4;s:12:\\"--minalpha 0\\";i:5;s:13:\\"--maxalpha 63\\";i:6;s:14:\\"-a end-usage=q\\";i:7;s:12:\\"-a tune=ssim\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"avifenc\\";s:16:\\"decodeBinaryName\\";s:7:\\"avifdec\\";}}s:9:\\"\\u0000*\\u0000logger\\";O:33:\\"Spatie\\\\ImageOptimizer\\\\DummyLogger\\":0:{}s:10:\\"\\u0000*\\u0000timeout\\";i:60;}}s:6:\\"format\\";a:1:{i:0;s:3:\\"jpg\\";}s:3:\\"fit\\";a:3:{i:0;r:83;i:1;i:400;i:2;i:400;}}}s:23:\\"\\u0000*\\u0000performOnCollections\\";a:0:{}s:17:\\"\\u0000*\\u0000performOnQueue\\";b:1;s:26:\\"\\u0000*\\u0000keepOriginalImageFormat\\";b:0;s:27:\\"\\u0000*\\u0000generateResponsiveImages\\";b:0;s:18:\\"\\u0000*\\u0000widthCalculator\\";N;s:24:\\"\\u0000*\\u0000loadingAttributeValue\\";N;s:16:\\"\\u0000*\\u0000pdfPageNumber\\";i:1;s:7:\\"\\u0000*\\u0000name\\";s:4:\\"icon\\";}}s:28:\\"\\u0000*\\u0000escapeWhenCastingToString\\";b:0;}s:8:\\"\\u0000*\\u0000media\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":5:{s:5:\\"class\\";s:49:\\"Spatie\\\\MediaLibrary\\\\MediaCollections\\\\Models\\\\Media\\";s:2:\\"id\\";i:35;s:9:\\"relations\\";a:0:{}s:10:\\"connection\\";s:5:\\"pgsql\\";s:15:\\"collectionClass\\";N;}s:14:\\"\\u0000*\\u0000onlyMissing\\";b:0;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:0:\\"\\";}"}}	0	\N	1727432231	1727432231
36	default	{"uuid":"78921069-bf52-48be-a5fd-c97089d03355","displayName":"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob","command":"O:58:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\\":5:{s:14:\\"\\u0000*\\u0000conversions\\";O:52:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\ConversionCollection\\":2:{s:8:\\"\\u0000*\\u0000items\\";a:2:{i:0;O:42:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\":11:{s:12:\\"\\u0000*\\u0000fileNamer\\";O:54:\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\":0:{}s:28:\\"\\u0000*\\u0000extractVideoFrameAtSecond\\";d:0;s:16:\\"\\u0000*\\u0000manipulations\\";O:45:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Manipulations\\":1:{s:16:\\"\\u0000*\\u0000manipulations\\";a:3:{s:8:\\"optimize\\";a:1:{i:0;O:36:\\"Spatie\\\\ImageOptimizer\\\\OptimizerChain\\":3:{s:13:\\"\\u0000*\\u0000optimizers\\";a:7:{i:0;O:42:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Jpegoptim\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m85\\";i:1;s:7:\\"--force\\";i:2;s:11:\\"--strip-all\\";i:3;s:17:\\"--all-progressive\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:9:\\"jpegoptim\\";}i:1;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Pngquant\\":5:{s:7:\\"options\\";a:1:{i:0;s:7:\\"--force\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"pngquant\\";}i:2;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Optipng\\":5:{s:7:\\"options\\";a:3:{i:0;s:3:\\"-i0\\";i:1;s:3:\\"-o2\\";i:2;s:6:\\"-quiet\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"optipng\\";}i:3;O:37:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Svgo\\":5:{s:7:\\"options\\";a:1:{i:0;s:20:\\"--disable=cleanupIDs\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:4:\\"svgo\\";}i:4;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Gifsicle\\":5:{s:7:\\"options\\";a:2:{i:0;s:2:\\"-b\\";i:1;s:3:\\"-O3\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"gifsicle\\";}i:5;O:38:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Cwebp\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m 6\\";i:1;s:8:\\"-pass 10\\";i:2;s:3:\\"-mt\\";i:3;s:5:\\"-q 90\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:5:\\"cwebp\\";}i:6;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Avifenc\\":6:{s:7:\\"options\\";a:8:{i:0;s:14:\\"-a cq-level=23\\";i:1;s:6:\\"-j all\\";i:2;s:7:\\"--min 0\\";i:3;s:8:\\"--max 63\\";i:4;s:12:\\"--minalpha 0\\";i:5;s:13:\\"--maxalpha 63\\";i:6;s:14:\\"-a end-usage=q\\";i:7;s:12:\\"-a tune=ssim\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"avifenc\\";s:16:\\"decodeBinaryName\\";s:7:\\"avifdec\\";}}s:9:\\"\\u0000*\\u0000logger\\";O:33:\\"Spatie\\\\ImageOptimizer\\\\DummyLogger\\":0:{}s:10:\\"\\u0000*\\u0000timeout\\";i:60;}}s:6:\\"format\\";a:1:{i:0;s:3:\\"jpg\\";}s:3:\\"fit\\";a:3:{i:0;E:27:\\"Spatie\\\\Image\\\\Enums\\\\Fit:Crop\\";i:1;i:600;i:2;i:600;}}}s:23:\\"\\u0000*\\u0000performOnCollections\\";a:0:{}s:17:\\"\\u0000*\\u0000performOnQueue\\";b:1;s:26:\\"\\u0000*\\u0000keepOriginalImageFormat\\";b:0;s:27:\\"\\u0000*\\u0000generateResponsiveImages\\";b:0;s:18:\\"\\u0000*\\u0000widthCalculator\\";N;s:24:\\"\\u0000*\\u0000loadingAttributeValue\\";N;s:16:\\"\\u0000*\\u0000pdfPageNumber\\";i:1;s:7:\\"\\u0000*\\u0000name\\";s:5:\\"thumb\\";}i:1;O:42:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\":11:{s:12:\\"\\u0000*\\u0000fileNamer\\";O:54:\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\":0:{}s:28:\\"\\u0000*\\u0000extractVideoFrameAtSecond\\";d:0;s:16:\\"\\u0000*\\u0000manipulations\\";O:45:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Manipulations\\":1:{s:16:\\"\\u0000*\\u0000manipulations\\";a:3:{s:8:\\"optimize\\";a:1:{i:0;O:36:\\"Spatie\\\\ImageOptimizer\\\\OptimizerChain\\":3:{s:13:\\"\\u0000*\\u0000optimizers\\";a:7:{i:0;O:42:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Jpegoptim\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m85\\";i:1;s:7:\\"--force\\";i:2;s:11:\\"--strip-all\\";i:3;s:17:\\"--all-progressive\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:9:\\"jpegoptim\\";}i:1;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Pngquant\\":5:{s:7:\\"options\\";a:1:{i:0;s:7:\\"--force\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"pngquant\\";}i:2;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Optipng\\":5:{s:7:\\"options\\";a:3:{i:0;s:3:\\"-i0\\";i:1;s:3:\\"-o2\\";i:2;s:6:\\"-quiet\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"optipng\\";}i:3;O:37:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Svgo\\":5:{s:7:\\"options\\";a:1:{i:0;s:20:\\"--disable=cleanupIDs\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:4:\\"svgo\\";}i:4;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Gifsicle\\":5:{s:7:\\"options\\";a:2:{i:0;s:2:\\"-b\\";i:1;s:3:\\"-O3\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"gifsicle\\";}i:5;O:38:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Cwebp\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m 6\\";i:1;s:8:\\"-pass 10\\";i:2;s:3:\\"-mt\\";i:3;s:5:\\"-q 90\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:5:\\"cwebp\\";}i:6;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Avifenc\\":6:{s:7:\\"options\\";a:8:{i:0;s:14:\\"-a cq-level=23\\";i:1;s:6:\\"-j all\\";i:2;s:7:\\"--min 0\\";i:3;s:8:\\"--max 63\\";i:4;s:12:\\"--minalpha 0\\";i:5;s:13:\\"--maxalpha 63\\";i:6;s:14:\\"-a end-usage=q\\";i:7;s:12:\\"-a tune=ssim\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"avifenc\\";s:16:\\"decodeBinaryName\\";s:7:\\"avifdec\\";}}s:9:\\"\\u0000*\\u0000logger\\";O:33:\\"Spatie\\\\ImageOptimizer\\\\DummyLogger\\":0:{}s:10:\\"\\u0000*\\u0000timeout\\";i:60;}}s:6:\\"format\\";a:1:{i:0;s:3:\\"jpg\\";}s:3:\\"fit\\";a:3:{i:0;r:83;i:1;i:400;i:2;i:400;}}}s:23:\\"\\u0000*\\u0000performOnCollections\\";a:0:{}s:17:\\"\\u0000*\\u0000performOnQueue\\";b:1;s:26:\\"\\u0000*\\u0000keepOriginalImageFormat\\";b:0;s:27:\\"\\u0000*\\u0000generateResponsiveImages\\";b:0;s:18:\\"\\u0000*\\u0000widthCalculator\\";N;s:24:\\"\\u0000*\\u0000loadingAttributeValue\\";N;s:16:\\"\\u0000*\\u0000pdfPageNumber\\";i:1;s:7:\\"\\u0000*\\u0000name\\";s:4:\\"icon\\";}}s:28:\\"\\u0000*\\u0000escapeWhenCastingToString\\";b:0;}s:8:\\"\\u0000*\\u0000media\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":5:{s:5:\\"class\\";s:49:\\"Spatie\\\\MediaLibrary\\\\MediaCollections\\\\Models\\\\Media\\";s:2:\\"id\\";i:36;s:9:\\"relations\\";a:0:{}s:10:\\"connection\\";s:5:\\"pgsql\\";s:15:\\"collectionClass\\";N;}s:14:\\"\\u0000*\\u0000onlyMissing\\";b:0;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:0:\\"\\";}"}}	0	\N	1727432572	1727432572
37	default	{"uuid":"61753836-11b8-4edb-9fe4-504c1862308c","displayName":"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob","command":"O:58:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\\":5:{s:14:\\"\\u0000*\\u0000conversions\\";O:52:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\ConversionCollection\\":2:{s:8:\\"\\u0000*\\u0000items\\";a:2:{i:0;O:42:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\":11:{s:12:\\"\\u0000*\\u0000fileNamer\\";O:54:\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\":0:{}s:28:\\"\\u0000*\\u0000extractVideoFrameAtSecond\\";d:0;s:16:\\"\\u0000*\\u0000manipulations\\";O:45:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Manipulations\\":1:{s:16:\\"\\u0000*\\u0000manipulations\\";a:3:{s:8:\\"optimize\\";a:1:{i:0;O:36:\\"Spatie\\\\ImageOptimizer\\\\OptimizerChain\\":3:{s:13:\\"\\u0000*\\u0000optimizers\\";a:7:{i:0;O:42:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Jpegoptim\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m85\\";i:1;s:7:\\"--force\\";i:2;s:11:\\"--strip-all\\";i:3;s:17:\\"--all-progressive\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:9:\\"jpegoptim\\";}i:1;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Pngquant\\":5:{s:7:\\"options\\";a:1:{i:0;s:7:\\"--force\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"pngquant\\";}i:2;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Optipng\\":5:{s:7:\\"options\\";a:3:{i:0;s:3:\\"-i0\\";i:1;s:3:\\"-o2\\";i:2;s:6:\\"-quiet\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"optipng\\";}i:3;O:37:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Svgo\\":5:{s:7:\\"options\\";a:1:{i:0;s:20:\\"--disable=cleanupIDs\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:4:\\"svgo\\";}i:4;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Gifsicle\\":5:{s:7:\\"options\\";a:2:{i:0;s:2:\\"-b\\";i:1;s:3:\\"-O3\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"gifsicle\\";}i:5;O:38:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Cwebp\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m 6\\";i:1;s:8:\\"-pass 10\\";i:2;s:3:\\"-mt\\";i:3;s:5:\\"-q 90\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:5:\\"cwebp\\";}i:6;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Avifenc\\":6:{s:7:\\"options\\";a:8:{i:0;s:14:\\"-a cq-level=23\\";i:1;s:6:\\"-j all\\";i:2;s:7:\\"--min 0\\";i:3;s:8:\\"--max 63\\";i:4;s:12:\\"--minalpha 0\\";i:5;s:13:\\"--maxalpha 63\\";i:6;s:14:\\"-a end-usage=q\\";i:7;s:12:\\"-a tune=ssim\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"avifenc\\";s:16:\\"decodeBinaryName\\";s:7:\\"avifdec\\";}}s:9:\\"\\u0000*\\u0000logger\\";O:33:\\"Spatie\\\\ImageOptimizer\\\\DummyLogger\\":0:{}s:10:\\"\\u0000*\\u0000timeout\\";i:60;}}s:6:\\"format\\";a:1:{i:0;s:3:\\"jpg\\";}s:3:\\"fit\\";a:3:{i:0;E:27:\\"Spatie\\\\Image\\\\Enums\\\\Fit:Crop\\";i:1;i:600;i:2;i:600;}}}s:23:\\"\\u0000*\\u0000performOnCollections\\";a:0:{}s:17:\\"\\u0000*\\u0000performOnQueue\\";b:1;s:26:\\"\\u0000*\\u0000keepOriginalImageFormat\\";b:0;s:27:\\"\\u0000*\\u0000generateResponsiveImages\\";b:0;s:18:\\"\\u0000*\\u0000widthCalculator\\";N;s:24:\\"\\u0000*\\u0000loadingAttributeValue\\";N;s:16:\\"\\u0000*\\u0000pdfPageNumber\\";i:1;s:7:\\"\\u0000*\\u0000name\\";s:5:\\"thumb\\";}i:1;O:42:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\":11:{s:12:\\"\\u0000*\\u0000fileNamer\\";O:54:\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\":0:{}s:28:\\"\\u0000*\\u0000extractVideoFrameAtSecond\\";d:0;s:16:\\"\\u0000*\\u0000manipulations\\";O:45:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Manipulations\\":1:{s:16:\\"\\u0000*\\u0000manipulations\\";a:3:{s:8:\\"optimize\\";a:1:{i:0;O:36:\\"Spatie\\\\ImageOptimizer\\\\OptimizerChain\\":3:{s:13:\\"\\u0000*\\u0000optimizers\\";a:7:{i:0;O:42:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Jpegoptim\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m85\\";i:1;s:7:\\"--force\\";i:2;s:11:\\"--strip-all\\";i:3;s:17:\\"--all-progressive\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:9:\\"jpegoptim\\";}i:1;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Pngquant\\":5:{s:7:\\"options\\";a:1:{i:0;s:7:\\"--force\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"pngquant\\";}i:2;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Optipng\\":5:{s:7:\\"options\\";a:3:{i:0;s:3:\\"-i0\\";i:1;s:3:\\"-o2\\";i:2;s:6:\\"-quiet\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"optipng\\";}i:3;O:37:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Svgo\\":5:{s:7:\\"options\\";a:1:{i:0;s:20:\\"--disable=cleanupIDs\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:4:\\"svgo\\";}i:4;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Gifsicle\\":5:{s:7:\\"options\\";a:2:{i:0;s:2:\\"-b\\";i:1;s:3:\\"-O3\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"gifsicle\\";}i:5;O:38:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Cwebp\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m 6\\";i:1;s:8:\\"-pass 10\\";i:2;s:3:\\"-mt\\";i:3;s:5:\\"-q 90\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:5:\\"cwebp\\";}i:6;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Avifenc\\":6:{s:7:\\"options\\";a:8:{i:0;s:14:\\"-a cq-level=23\\";i:1;s:6:\\"-j all\\";i:2;s:7:\\"--min 0\\";i:3;s:8:\\"--max 63\\";i:4;s:12:\\"--minalpha 0\\";i:5;s:13:\\"--maxalpha 63\\";i:6;s:14:\\"-a end-usage=q\\";i:7;s:12:\\"-a tune=ssim\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"avifenc\\";s:16:\\"decodeBinaryName\\";s:7:\\"avifdec\\";}}s:9:\\"\\u0000*\\u0000logger\\";O:33:\\"Spatie\\\\ImageOptimizer\\\\DummyLogger\\":0:{}s:10:\\"\\u0000*\\u0000timeout\\";i:60;}}s:6:\\"format\\";a:1:{i:0;s:3:\\"jpg\\";}s:3:\\"fit\\";a:3:{i:0;r:83;i:1;i:400;i:2;i:400;}}}s:23:\\"\\u0000*\\u0000performOnCollections\\";a:0:{}s:17:\\"\\u0000*\\u0000performOnQueue\\";b:1;s:26:\\"\\u0000*\\u0000keepOriginalImageFormat\\";b:0;s:27:\\"\\u0000*\\u0000generateResponsiveImages\\";b:0;s:18:\\"\\u0000*\\u0000widthCalculator\\";N;s:24:\\"\\u0000*\\u0000loadingAttributeValue\\";N;s:16:\\"\\u0000*\\u0000pdfPageNumber\\";i:1;s:7:\\"\\u0000*\\u0000name\\";s:4:\\"icon\\";}}s:28:\\"\\u0000*\\u0000escapeWhenCastingToString\\";b:0;}s:8:\\"\\u0000*\\u0000media\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":5:{s:5:\\"class\\";s:49:\\"Spatie\\\\MediaLibrary\\\\MediaCollections\\\\Models\\\\Media\\";s:2:\\"id\\";i:37;s:9:\\"relations\\";a:0:{}s:10:\\"connection\\";s:5:\\"pgsql\\";s:15:\\"collectionClass\\";N;}s:14:\\"\\u0000*\\u0000onlyMissing\\";b:0;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:0:\\"\\";}"}}	0	\N	1727432744	1727432744
38	default	{"uuid":"fa8197a3-5382-48e0-aaa5-2e39861b0d1b","displayName":"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob","command":"O:58:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\\":5:{s:14:\\"\\u0000*\\u0000conversions\\";O:52:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\ConversionCollection\\":2:{s:8:\\"\\u0000*\\u0000items\\";a:2:{i:0;O:42:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\":11:{s:12:\\"\\u0000*\\u0000fileNamer\\";O:54:\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\":0:{}s:28:\\"\\u0000*\\u0000extractVideoFrameAtSecond\\";d:0;s:16:\\"\\u0000*\\u0000manipulations\\";O:45:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Manipulations\\":1:{s:16:\\"\\u0000*\\u0000manipulations\\";a:3:{s:8:\\"optimize\\";a:1:{i:0;O:36:\\"Spatie\\\\ImageOptimizer\\\\OptimizerChain\\":3:{s:13:\\"\\u0000*\\u0000optimizers\\";a:7:{i:0;O:42:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Jpegoptim\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m85\\";i:1;s:7:\\"--force\\";i:2;s:11:\\"--strip-all\\";i:3;s:17:\\"--all-progressive\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:9:\\"jpegoptim\\";}i:1;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Pngquant\\":5:{s:7:\\"options\\";a:1:{i:0;s:7:\\"--force\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"pngquant\\";}i:2;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Optipng\\":5:{s:7:\\"options\\";a:3:{i:0;s:3:\\"-i0\\";i:1;s:3:\\"-o2\\";i:2;s:6:\\"-quiet\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"optipng\\";}i:3;O:37:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Svgo\\":5:{s:7:\\"options\\";a:1:{i:0;s:20:\\"--disable=cleanupIDs\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:4:\\"svgo\\";}i:4;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Gifsicle\\":5:{s:7:\\"options\\";a:2:{i:0;s:2:\\"-b\\";i:1;s:3:\\"-O3\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"gifsicle\\";}i:5;O:38:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Cwebp\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m 6\\";i:1;s:8:\\"-pass 10\\";i:2;s:3:\\"-mt\\";i:3;s:5:\\"-q 90\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:5:\\"cwebp\\";}i:6;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Avifenc\\":6:{s:7:\\"options\\";a:8:{i:0;s:14:\\"-a cq-level=23\\";i:1;s:6:\\"-j all\\";i:2;s:7:\\"--min 0\\";i:3;s:8:\\"--max 63\\";i:4;s:12:\\"--minalpha 0\\";i:5;s:13:\\"--maxalpha 63\\";i:6;s:14:\\"-a end-usage=q\\";i:7;s:12:\\"-a tune=ssim\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"avifenc\\";s:16:\\"decodeBinaryName\\";s:7:\\"avifdec\\";}}s:9:\\"\\u0000*\\u0000logger\\";O:33:\\"Spatie\\\\ImageOptimizer\\\\DummyLogger\\":0:{}s:10:\\"\\u0000*\\u0000timeout\\";i:60;}}s:6:\\"format\\";a:1:{i:0;s:3:\\"jpg\\";}s:3:\\"fit\\";a:3:{i:0;E:27:\\"Spatie\\\\Image\\\\Enums\\\\Fit:Crop\\";i:1;i:600;i:2;i:600;}}}s:23:\\"\\u0000*\\u0000performOnCollections\\";a:0:{}s:17:\\"\\u0000*\\u0000performOnQueue\\";b:1;s:26:\\"\\u0000*\\u0000keepOriginalImageFormat\\";b:0;s:27:\\"\\u0000*\\u0000generateResponsiveImages\\";b:0;s:18:\\"\\u0000*\\u0000widthCalculator\\";N;s:24:\\"\\u0000*\\u0000loadingAttributeValue\\";N;s:16:\\"\\u0000*\\u0000pdfPageNumber\\";i:1;s:7:\\"\\u0000*\\u0000name\\";s:5:\\"thumb\\";}i:1;O:42:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\":11:{s:12:\\"\\u0000*\\u0000fileNamer\\";O:54:\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\":0:{}s:28:\\"\\u0000*\\u0000extractVideoFrameAtSecond\\";d:0;s:16:\\"\\u0000*\\u0000manipulations\\";O:45:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Manipulations\\":1:{s:16:\\"\\u0000*\\u0000manipulations\\";a:3:{s:8:\\"optimize\\";a:1:{i:0;O:36:\\"Spatie\\\\ImageOptimizer\\\\OptimizerChain\\":3:{s:13:\\"\\u0000*\\u0000optimizers\\";a:7:{i:0;O:42:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Jpegoptim\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m85\\";i:1;s:7:\\"--force\\";i:2;s:11:\\"--strip-all\\";i:3;s:17:\\"--all-progressive\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:9:\\"jpegoptim\\";}i:1;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Pngquant\\":5:{s:7:\\"options\\";a:1:{i:0;s:7:\\"--force\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"pngquant\\";}i:2;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Optipng\\":5:{s:7:\\"options\\";a:3:{i:0;s:3:\\"-i0\\";i:1;s:3:\\"-o2\\";i:2;s:6:\\"-quiet\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"optipng\\";}i:3;O:37:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Svgo\\":5:{s:7:\\"options\\";a:1:{i:0;s:20:\\"--disable=cleanupIDs\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:4:\\"svgo\\";}i:4;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Gifsicle\\":5:{s:7:\\"options\\";a:2:{i:0;s:2:\\"-b\\";i:1;s:3:\\"-O3\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"gifsicle\\";}i:5;O:38:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Cwebp\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m 6\\";i:1;s:8:\\"-pass 10\\";i:2;s:3:\\"-mt\\";i:3;s:5:\\"-q 90\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:5:\\"cwebp\\";}i:6;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Avifenc\\":6:{s:7:\\"options\\";a:8:{i:0;s:14:\\"-a cq-level=23\\";i:1;s:6:\\"-j all\\";i:2;s:7:\\"--min 0\\";i:3;s:8:\\"--max 63\\";i:4;s:12:\\"--minalpha 0\\";i:5;s:13:\\"--maxalpha 63\\";i:6;s:14:\\"-a end-usage=q\\";i:7;s:12:\\"-a tune=ssim\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"avifenc\\";s:16:\\"decodeBinaryName\\";s:7:\\"avifdec\\";}}s:9:\\"\\u0000*\\u0000logger\\";O:33:\\"Spatie\\\\ImageOptimizer\\\\DummyLogger\\":0:{}s:10:\\"\\u0000*\\u0000timeout\\";i:60;}}s:6:\\"format\\";a:1:{i:0;s:3:\\"jpg\\";}s:3:\\"fit\\";a:3:{i:0;r:83;i:1;i:400;i:2;i:400;}}}s:23:\\"\\u0000*\\u0000performOnCollections\\";a:0:{}s:17:\\"\\u0000*\\u0000performOnQueue\\";b:1;s:26:\\"\\u0000*\\u0000keepOriginalImageFormat\\";b:0;s:27:\\"\\u0000*\\u0000generateResponsiveImages\\";b:0;s:18:\\"\\u0000*\\u0000widthCalculator\\";N;s:24:\\"\\u0000*\\u0000loadingAttributeValue\\";N;s:16:\\"\\u0000*\\u0000pdfPageNumber\\";i:1;s:7:\\"\\u0000*\\u0000name\\";s:4:\\"icon\\";}}s:28:\\"\\u0000*\\u0000escapeWhenCastingToString\\";b:0;}s:8:\\"\\u0000*\\u0000media\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":5:{s:5:\\"class\\";s:49:\\"Spatie\\\\MediaLibrary\\\\MediaCollections\\\\Models\\\\Media\\";s:2:\\"id\\";i:38;s:9:\\"relations\\";a:0:{}s:10:\\"connection\\";s:5:\\"pgsql\\";s:15:\\"collectionClass\\";N;}s:14:\\"\\u0000*\\u0000onlyMissing\\";b:0;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:0:\\"\\";}"}}	0	\N	1727432870	1727432870
39	default	{"uuid":"d9e3a676-82df-474f-80d9-acbd3bbb73d6","displayName":"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob","command":"O:58:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\\":5:{s:14:\\"\\u0000*\\u0000conversions\\";O:52:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\ConversionCollection\\":2:{s:8:\\"\\u0000*\\u0000items\\";a:2:{i:0;O:42:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\":11:{s:12:\\"\\u0000*\\u0000fileNamer\\";O:54:\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\":0:{}s:28:\\"\\u0000*\\u0000extractVideoFrameAtSecond\\";d:0;s:16:\\"\\u0000*\\u0000manipulations\\";O:45:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Manipulations\\":1:{s:16:\\"\\u0000*\\u0000manipulations\\";a:3:{s:8:\\"optimize\\";a:1:{i:0;O:36:\\"Spatie\\\\ImageOptimizer\\\\OptimizerChain\\":3:{s:13:\\"\\u0000*\\u0000optimizers\\";a:7:{i:0;O:42:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Jpegoptim\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m85\\";i:1;s:7:\\"--force\\";i:2;s:11:\\"--strip-all\\";i:3;s:17:\\"--all-progressive\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:9:\\"jpegoptim\\";}i:1;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Pngquant\\":5:{s:7:\\"options\\";a:1:{i:0;s:7:\\"--force\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"pngquant\\";}i:2;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Optipng\\":5:{s:7:\\"options\\";a:3:{i:0;s:3:\\"-i0\\";i:1;s:3:\\"-o2\\";i:2;s:6:\\"-quiet\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"optipng\\";}i:3;O:37:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Svgo\\":5:{s:7:\\"options\\";a:1:{i:0;s:20:\\"--disable=cleanupIDs\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:4:\\"svgo\\";}i:4;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Gifsicle\\":5:{s:7:\\"options\\";a:2:{i:0;s:2:\\"-b\\";i:1;s:3:\\"-O3\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"gifsicle\\";}i:5;O:38:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Cwebp\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m 6\\";i:1;s:8:\\"-pass 10\\";i:2;s:3:\\"-mt\\";i:3;s:5:\\"-q 90\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:5:\\"cwebp\\";}i:6;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Avifenc\\":6:{s:7:\\"options\\";a:8:{i:0;s:14:\\"-a cq-level=23\\";i:1;s:6:\\"-j all\\";i:2;s:7:\\"--min 0\\";i:3;s:8:\\"--max 63\\";i:4;s:12:\\"--minalpha 0\\";i:5;s:13:\\"--maxalpha 63\\";i:6;s:14:\\"-a end-usage=q\\";i:7;s:12:\\"-a tune=ssim\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"avifenc\\";s:16:\\"decodeBinaryName\\";s:7:\\"avifdec\\";}}s:9:\\"\\u0000*\\u0000logger\\";O:33:\\"Spatie\\\\ImageOptimizer\\\\DummyLogger\\":0:{}s:10:\\"\\u0000*\\u0000timeout\\";i:60;}}s:6:\\"format\\";a:1:{i:0;s:3:\\"jpg\\";}s:3:\\"fit\\";a:3:{i:0;E:27:\\"Spatie\\\\Image\\\\Enums\\\\Fit:Crop\\";i:1;i:600;i:2;i:600;}}}s:23:\\"\\u0000*\\u0000performOnCollections\\";a:0:{}s:17:\\"\\u0000*\\u0000performOnQueue\\";b:1;s:26:\\"\\u0000*\\u0000keepOriginalImageFormat\\";b:0;s:27:\\"\\u0000*\\u0000generateResponsiveImages\\";b:0;s:18:\\"\\u0000*\\u0000widthCalculator\\";N;s:24:\\"\\u0000*\\u0000loadingAttributeValue\\";N;s:16:\\"\\u0000*\\u0000pdfPageNumber\\";i:1;s:7:\\"\\u0000*\\u0000name\\";s:5:\\"thumb\\";}i:1;O:42:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\":11:{s:12:\\"\\u0000*\\u0000fileNamer\\";O:54:\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\":0:{}s:28:\\"\\u0000*\\u0000extractVideoFrameAtSecond\\";d:0;s:16:\\"\\u0000*\\u0000manipulations\\";O:45:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Manipulations\\":1:{s:16:\\"\\u0000*\\u0000manipulations\\";a:3:{s:8:\\"optimize\\";a:1:{i:0;O:36:\\"Spatie\\\\ImageOptimizer\\\\OptimizerChain\\":3:{s:13:\\"\\u0000*\\u0000optimizers\\";a:7:{i:0;O:42:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Jpegoptim\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m85\\";i:1;s:7:\\"--force\\";i:2;s:11:\\"--strip-all\\";i:3;s:17:\\"--all-progressive\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:9:\\"jpegoptim\\";}i:1;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Pngquant\\":5:{s:7:\\"options\\";a:1:{i:0;s:7:\\"--force\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"pngquant\\";}i:2;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Optipng\\":5:{s:7:\\"options\\";a:3:{i:0;s:3:\\"-i0\\";i:1;s:3:\\"-o2\\";i:2;s:6:\\"-quiet\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"optipng\\";}i:3;O:37:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Svgo\\":5:{s:7:\\"options\\";a:1:{i:0;s:20:\\"--disable=cleanupIDs\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:4:\\"svgo\\";}i:4;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Gifsicle\\":5:{s:7:\\"options\\";a:2:{i:0;s:2:\\"-b\\";i:1;s:3:\\"-O3\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"gifsicle\\";}i:5;O:38:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Cwebp\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m 6\\";i:1;s:8:\\"-pass 10\\";i:2;s:3:\\"-mt\\";i:3;s:5:\\"-q 90\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:5:\\"cwebp\\";}i:6;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Avifenc\\":6:{s:7:\\"options\\";a:8:{i:0;s:14:\\"-a cq-level=23\\";i:1;s:6:\\"-j all\\";i:2;s:7:\\"--min 0\\";i:3;s:8:\\"--max 63\\";i:4;s:12:\\"--minalpha 0\\";i:5;s:13:\\"--maxalpha 63\\";i:6;s:14:\\"-a end-usage=q\\";i:7;s:12:\\"-a tune=ssim\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"avifenc\\";s:16:\\"decodeBinaryName\\";s:7:\\"avifdec\\";}}s:9:\\"\\u0000*\\u0000logger\\";O:33:\\"Spatie\\\\ImageOptimizer\\\\DummyLogger\\":0:{}s:10:\\"\\u0000*\\u0000timeout\\";i:60;}}s:6:\\"format\\";a:1:{i:0;s:3:\\"jpg\\";}s:3:\\"fit\\";a:3:{i:0;r:83;i:1;i:400;i:2;i:400;}}}s:23:\\"\\u0000*\\u0000performOnCollections\\";a:0:{}s:17:\\"\\u0000*\\u0000performOnQueue\\";b:1;s:26:\\"\\u0000*\\u0000keepOriginalImageFormat\\";b:0;s:27:\\"\\u0000*\\u0000generateResponsiveImages\\";b:0;s:18:\\"\\u0000*\\u0000widthCalculator\\";N;s:24:\\"\\u0000*\\u0000loadingAttributeValue\\";N;s:16:\\"\\u0000*\\u0000pdfPageNumber\\";i:1;s:7:\\"\\u0000*\\u0000name\\";s:4:\\"icon\\";}}s:28:\\"\\u0000*\\u0000escapeWhenCastingToString\\";b:0;}s:8:\\"\\u0000*\\u0000media\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":5:{s:5:\\"class\\";s:49:\\"Spatie\\\\MediaLibrary\\\\MediaCollections\\\\Models\\\\Media\\";s:2:\\"id\\";i:39;s:9:\\"relations\\";a:0:{}s:10:\\"connection\\";s:5:\\"pgsql\\";s:15:\\"collectionClass\\";N;}s:14:\\"\\u0000*\\u0000onlyMissing\\";b:0;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:0:\\"\\";}"}}	0	\N	1727441374	1727441374
40	default	{"uuid":"df30c038-bff4-41c3-a124-08c9b1bce52f","displayName":"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob","command":"O:58:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\\":5:{s:14:\\"\\u0000*\\u0000conversions\\";O:52:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\ConversionCollection\\":2:{s:8:\\"\\u0000*\\u0000items\\";a:2:{i:0;O:42:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\":11:{s:12:\\"\\u0000*\\u0000fileNamer\\";O:54:\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\":0:{}s:28:\\"\\u0000*\\u0000extractVideoFrameAtSecond\\";d:0;s:16:\\"\\u0000*\\u0000manipulations\\";O:45:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Manipulations\\":1:{s:16:\\"\\u0000*\\u0000manipulations\\";a:3:{s:8:\\"optimize\\";a:1:{i:0;O:36:\\"Spatie\\\\ImageOptimizer\\\\OptimizerChain\\":3:{s:13:\\"\\u0000*\\u0000optimizers\\";a:7:{i:0;O:42:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Jpegoptim\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m85\\";i:1;s:7:\\"--force\\";i:2;s:11:\\"--strip-all\\";i:3;s:17:\\"--all-progressive\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:9:\\"jpegoptim\\";}i:1;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Pngquant\\":5:{s:7:\\"options\\";a:1:{i:0;s:7:\\"--force\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"pngquant\\";}i:2;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Optipng\\":5:{s:7:\\"options\\";a:3:{i:0;s:3:\\"-i0\\";i:1;s:3:\\"-o2\\";i:2;s:6:\\"-quiet\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"optipng\\";}i:3;O:37:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Svgo\\":5:{s:7:\\"options\\";a:1:{i:0;s:20:\\"--disable=cleanupIDs\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:4:\\"svgo\\";}i:4;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Gifsicle\\":5:{s:7:\\"options\\";a:2:{i:0;s:2:\\"-b\\";i:1;s:3:\\"-O3\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"gifsicle\\";}i:5;O:38:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Cwebp\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m 6\\";i:1;s:8:\\"-pass 10\\";i:2;s:3:\\"-mt\\";i:3;s:5:\\"-q 90\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:5:\\"cwebp\\";}i:6;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Avifenc\\":6:{s:7:\\"options\\";a:8:{i:0;s:14:\\"-a cq-level=23\\";i:1;s:6:\\"-j all\\";i:2;s:7:\\"--min 0\\";i:3;s:8:\\"--max 63\\";i:4;s:12:\\"--minalpha 0\\";i:5;s:13:\\"--maxalpha 63\\";i:6;s:14:\\"-a end-usage=q\\";i:7;s:12:\\"-a tune=ssim\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"avifenc\\";s:16:\\"decodeBinaryName\\";s:7:\\"avifdec\\";}}s:9:\\"\\u0000*\\u0000logger\\";O:33:\\"Spatie\\\\ImageOptimizer\\\\DummyLogger\\":0:{}s:10:\\"\\u0000*\\u0000timeout\\";i:60;}}s:6:\\"format\\";a:1:{i:0;s:3:\\"jpg\\";}s:3:\\"fit\\";a:3:{i:0;E:27:\\"Spatie\\\\Image\\\\Enums\\\\Fit:Crop\\";i:1;i:600;i:2;i:600;}}}s:23:\\"\\u0000*\\u0000performOnCollections\\";a:0:{}s:17:\\"\\u0000*\\u0000performOnQueue\\";b:1;s:26:\\"\\u0000*\\u0000keepOriginalImageFormat\\";b:0;s:27:\\"\\u0000*\\u0000generateResponsiveImages\\";b:0;s:18:\\"\\u0000*\\u0000widthCalculator\\";N;s:24:\\"\\u0000*\\u0000loadingAttributeValue\\";N;s:16:\\"\\u0000*\\u0000pdfPageNumber\\";i:1;s:7:\\"\\u0000*\\u0000name\\";s:5:\\"thumb\\";}i:1;O:42:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\":11:{s:12:\\"\\u0000*\\u0000fileNamer\\";O:54:\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\":0:{}s:28:\\"\\u0000*\\u0000extractVideoFrameAtSecond\\";d:0;s:16:\\"\\u0000*\\u0000manipulations\\";O:45:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Manipulations\\":1:{s:16:\\"\\u0000*\\u0000manipulations\\";a:3:{s:8:\\"optimize\\";a:1:{i:0;O:36:\\"Spatie\\\\ImageOptimizer\\\\OptimizerChain\\":3:{s:13:\\"\\u0000*\\u0000optimizers\\";a:7:{i:0;O:42:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Jpegoptim\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m85\\";i:1;s:7:\\"--force\\";i:2;s:11:\\"--strip-all\\";i:3;s:17:\\"--all-progressive\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:9:\\"jpegoptim\\";}i:1;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Pngquant\\":5:{s:7:\\"options\\";a:1:{i:0;s:7:\\"--force\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"pngquant\\";}i:2;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Optipng\\":5:{s:7:\\"options\\";a:3:{i:0;s:3:\\"-i0\\";i:1;s:3:\\"-o2\\";i:2;s:6:\\"-quiet\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"optipng\\";}i:3;O:37:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Svgo\\":5:{s:7:\\"options\\";a:1:{i:0;s:20:\\"--disable=cleanupIDs\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:4:\\"svgo\\";}i:4;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Gifsicle\\":5:{s:7:\\"options\\";a:2:{i:0;s:2:\\"-b\\";i:1;s:3:\\"-O3\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"gifsicle\\";}i:5;O:38:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Cwebp\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m 6\\";i:1;s:8:\\"-pass 10\\";i:2;s:3:\\"-mt\\";i:3;s:5:\\"-q 90\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:5:\\"cwebp\\";}i:6;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Avifenc\\":6:{s:7:\\"options\\";a:8:{i:0;s:14:\\"-a cq-level=23\\";i:1;s:6:\\"-j all\\";i:2;s:7:\\"--min 0\\";i:3;s:8:\\"--max 63\\";i:4;s:12:\\"--minalpha 0\\";i:5;s:13:\\"--maxalpha 63\\";i:6;s:14:\\"-a end-usage=q\\";i:7;s:12:\\"-a tune=ssim\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"avifenc\\";s:16:\\"decodeBinaryName\\";s:7:\\"avifdec\\";}}s:9:\\"\\u0000*\\u0000logger\\";O:33:\\"Spatie\\\\ImageOptimizer\\\\DummyLogger\\":0:{}s:10:\\"\\u0000*\\u0000timeout\\";i:60;}}s:6:\\"format\\";a:1:{i:0;s:3:\\"jpg\\";}s:3:\\"fit\\";a:3:{i:0;r:83;i:1;i:400;i:2;i:400;}}}s:23:\\"\\u0000*\\u0000performOnCollections\\";a:0:{}s:17:\\"\\u0000*\\u0000performOnQueue\\";b:1;s:26:\\"\\u0000*\\u0000keepOriginalImageFormat\\";b:0;s:27:\\"\\u0000*\\u0000generateResponsiveImages\\";b:0;s:18:\\"\\u0000*\\u0000widthCalculator\\";N;s:24:\\"\\u0000*\\u0000loadingAttributeValue\\";N;s:16:\\"\\u0000*\\u0000pdfPageNumber\\";i:1;s:7:\\"\\u0000*\\u0000name\\";s:4:\\"icon\\";}}s:28:\\"\\u0000*\\u0000escapeWhenCastingToString\\";b:0;}s:8:\\"\\u0000*\\u0000media\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":5:{s:5:\\"class\\";s:49:\\"Spatie\\\\MediaLibrary\\\\MediaCollections\\\\Models\\\\Media\\";s:2:\\"id\\";i:40;s:9:\\"relations\\";a:0:{}s:10:\\"connection\\";s:5:\\"pgsql\\";s:15:\\"collectionClass\\";N;}s:14:\\"\\u0000*\\u0000onlyMissing\\";b:0;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:0:\\"\\";}"}}	0	\N	1727441374	1727441374
41	default	{"uuid":"46e47ec2-5fb2-45d8-a845-ccb2c1fbd3e1","displayName":"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob","command":"O:58:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\\":5:{s:14:\\"\\u0000*\\u0000conversions\\";O:52:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\ConversionCollection\\":2:{s:8:\\"\\u0000*\\u0000items\\";a:2:{i:0;O:42:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\":11:{s:12:\\"\\u0000*\\u0000fileNamer\\";O:54:\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\":0:{}s:28:\\"\\u0000*\\u0000extractVideoFrameAtSecond\\";d:0;s:16:\\"\\u0000*\\u0000manipulations\\";O:45:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Manipulations\\":1:{s:16:\\"\\u0000*\\u0000manipulations\\";a:3:{s:8:\\"optimize\\";a:1:{i:0;O:36:\\"Spatie\\\\ImageOptimizer\\\\OptimizerChain\\":3:{s:13:\\"\\u0000*\\u0000optimizers\\";a:7:{i:0;O:42:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Jpegoptim\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m85\\";i:1;s:7:\\"--force\\";i:2;s:11:\\"--strip-all\\";i:3;s:17:\\"--all-progressive\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:9:\\"jpegoptim\\";}i:1;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Pngquant\\":5:{s:7:\\"options\\";a:1:{i:0;s:7:\\"--force\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"pngquant\\";}i:2;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Optipng\\":5:{s:7:\\"options\\";a:3:{i:0;s:3:\\"-i0\\";i:1;s:3:\\"-o2\\";i:2;s:6:\\"-quiet\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"optipng\\";}i:3;O:37:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Svgo\\":5:{s:7:\\"options\\";a:1:{i:0;s:20:\\"--disable=cleanupIDs\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:4:\\"svgo\\";}i:4;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Gifsicle\\":5:{s:7:\\"options\\";a:2:{i:0;s:2:\\"-b\\";i:1;s:3:\\"-O3\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"gifsicle\\";}i:5;O:38:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Cwebp\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m 6\\";i:1;s:8:\\"-pass 10\\";i:2;s:3:\\"-mt\\";i:3;s:5:\\"-q 90\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:5:\\"cwebp\\";}i:6;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Avifenc\\":6:{s:7:\\"options\\";a:8:{i:0;s:14:\\"-a cq-level=23\\";i:1;s:6:\\"-j all\\";i:2;s:7:\\"--min 0\\";i:3;s:8:\\"--max 63\\";i:4;s:12:\\"--minalpha 0\\";i:5;s:13:\\"--maxalpha 63\\";i:6;s:14:\\"-a end-usage=q\\";i:7;s:12:\\"-a tune=ssim\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"avifenc\\";s:16:\\"decodeBinaryName\\";s:7:\\"avifdec\\";}}s:9:\\"\\u0000*\\u0000logger\\";O:33:\\"Spatie\\\\ImageOptimizer\\\\DummyLogger\\":0:{}s:10:\\"\\u0000*\\u0000timeout\\";i:60;}}s:6:\\"format\\";a:1:{i:0;s:3:\\"jpg\\";}s:3:\\"fit\\";a:3:{i:0;E:27:\\"Spatie\\\\Image\\\\Enums\\\\Fit:Crop\\";i:1;i:600;i:2;i:600;}}}s:23:\\"\\u0000*\\u0000performOnCollections\\";a:0:{}s:17:\\"\\u0000*\\u0000performOnQueue\\";b:1;s:26:\\"\\u0000*\\u0000keepOriginalImageFormat\\";b:0;s:27:\\"\\u0000*\\u0000generateResponsiveImages\\";b:0;s:18:\\"\\u0000*\\u0000widthCalculator\\";N;s:24:\\"\\u0000*\\u0000loadingAttributeValue\\";N;s:16:\\"\\u0000*\\u0000pdfPageNumber\\";i:1;s:7:\\"\\u0000*\\u0000name\\";s:5:\\"thumb\\";}i:1;O:42:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\":11:{s:12:\\"\\u0000*\\u0000fileNamer\\";O:54:\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\":0:{}s:28:\\"\\u0000*\\u0000extractVideoFrameAtSecond\\";d:0;s:16:\\"\\u0000*\\u0000manipulations\\";O:45:\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Manipulations\\":1:{s:16:\\"\\u0000*\\u0000manipulations\\";a:3:{s:8:\\"optimize\\";a:1:{i:0;O:36:\\"Spatie\\\\ImageOptimizer\\\\OptimizerChain\\":3:{s:13:\\"\\u0000*\\u0000optimizers\\";a:7:{i:0;O:42:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Jpegoptim\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m85\\";i:1;s:7:\\"--force\\";i:2;s:11:\\"--strip-all\\";i:3;s:17:\\"--all-progressive\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:9:\\"jpegoptim\\";}i:1;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Pngquant\\":5:{s:7:\\"options\\";a:1:{i:0;s:7:\\"--force\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"pngquant\\";}i:2;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Optipng\\":5:{s:7:\\"options\\";a:3:{i:0;s:3:\\"-i0\\";i:1;s:3:\\"-o2\\";i:2;s:6:\\"-quiet\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"optipng\\";}i:3;O:37:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Svgo\\":5:{s:7:\\"options\\";a:1:{i:0;s:20:\\"--disable=cleanupIDs\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:4:\\"svgo\\";}i:4;O:41:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Gifsicle\\":5:{s:7:\\"options\\";a:2:{i:0;s:2:\\"-b\\";i:1;s:3:\\"-O3\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:8:\\"gifsicle\\";}i:5;O:38:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Cwebp\\":5:{s:7:\\"options\\";a:4:{i:0;s:4:\\"-m 6\\";i:1;s:8:\\"-pass 10\\";i:2;s:3:\\"-mt\\";i:3;s:5:\\"-q 90\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:5:\\"cwebp\\";}i:6;O:40:\\"Spatie\\\\ImageOptimizer\\\\Optimizers\\\\Avifenc\\":6:{s:7:\\"options\\";a:8:{i:0;s:14:\\"-a cq-level=23\\";i:1;s:6:\\"-j all\\";i:2;s:7:\\"--min 0\\";i:3;s:8:\\"--max 63\\";i:4;s:12:\\"--minalpha 0\\";i:5;s:13:\\"--maxalpha 63\\";i:6;s:14:\\"-a end-usage=q\\";i:7;s:12:\\"-a tune=ssim\\";}s:9:\\"imagePath\\";s:0:\\"\\";s:10:\\"binaryPath\\";s:0:\\"\\";s:7:\\"tmpPath\\";N;s:10:\\"binaryName\\";s:7:\\"avifenc\\";s:16:\\"decodeBinaryName\\";s:7:\\"avifdec\\";}}s:9:\\"\\u0000*\\u0000logger\\";O:33:\\"Spatie\\\\ImageOptimizer\\\\DummyLogger\\":0:{}s:10:\\"\\u0000*\\u0000timeout\\";i:60;}}s:6:\\"format\\";a:1:{i:0;s:3:\\"jpg\\";}s:3:\\"fit\\";a:3:{i:0;r:83;i:1;i:400;i:2;i:400;}}}s:23:\\"\\u0000*\\u0000performOnCollections\\";a:0:{}s:17:\\"\\u0000*\\u0000performOnQueue\\";b:1;s:26:\\"\\u0000*\\u0000keepOriginalImageFormat\\";b:0;s:27:\\"\\u0000*\\u0000generateResponsiveImages\\";b:0;s:18:\\"\\u0000*\\u0000widthCalculator\\";N;s:24:\\"\\u0000*\\u0000loadingAttributeValue\\";N;s:16:\\"\\u0000*\\u0000pdfPageNumber\\";i:1;s:7:\\"\\u0000*\\u0000name\\";s:4:\\"icon\\";}}s:28:\\"\\u0000*\\u0000escapeWhenCastingToString\\";b:0;}s:8:\\"\\u0000*\\u0000media\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":5:{s:5:\\"class\\";s:49:\\"Spatie\\\\MediaLibrary\\\\MediaCollections\\\\Models\\\\Media\\";s:2:\\"id\\";i:41;s:9:\\"relations\\";a:0:{}s:10:\\"connection\\";s:5:\\"pgsql\\";s:15:\\"collectionClass\\";N;}s:14:\\"\\u0000*\\u0000onlyMissing\\";b:0;s:10:\\"connection\\";s:8:\\"database\\";s:5:\\"queue\\";s:0:\\"\\";}"}}	0	\N	1727441374	1727441374
\.


--
-- Data for Name: locations; Type: TABLE DATA; Schema: public; Owner: kim
--

COPY public.locations (id, latitude, longitude, name, country_name, province_name, area_name, locality_name, street_name, created_at, updated_at) FROM stdin;
1	45.0241440000	39.0696540000	Краснодарский край муниципальное образование Краснодар Краснодар 	Россия	Краснодарский край	муниципальное образование Краснодар	Краснодар		2024-07-28 12:46:52	2024-07-28 12:46:52
2	45.0285780000	39.0674980000	Краснодарский край муниципальное образование Краснодар Краснодар 	Россия	Краснодарский край	муниципальное образование Краснодар	Краснодар		2024-07-28 12:46:52	2024-07-28 12:46:52
3	45.0314320000	39.0751970000	Краснодарский край муниципальное образование Краснодар Краснодар 	Россия	Краснодарский край	муниципальное образование Краснодар	Краснодар		2024-07-28 12:46:52	2024-07-28 12:46:52
4	45.0307500000	39.0850690000	Краснодарский край муниципальное образование Краснодар Краснодар 	Россия	Краснодарский край	муниципальное образование Краснодар	Краснодар		2024-07-28 12:46:52	2024-07-28 12:46:52
5	45.0354700000	38.9753130000	Краснодарский край муниципальное образование Краснодар Краснодар 	Россия	Краснодарский край	муниципальное образование Краснодар	Краснодар		2024-07-28 12:46:52	2024-07-28 12:46:52
6	45.0711920000	39.0483370000	Краснодарский край муниципальное образование Краснодар  	Россия	Краснодарский край	муниципальное образование Краснодар			2024-07-28 12:46:52	2024-07-28 12:46:52
7	45.5449100000	39.6104220000	Краснодарский край   	Россия	Краснодарский край				2024-07-28 12:46:52	2024-07-28 12:46:52
8	43.0148150000	43.7492120000	   						2024-07-28 12:46:52	2024-07-28 12:46:52
9	48.6225640000	43.1661600000	   	Россия					2024-07-28 12:46:53	2024-07-28 12:46:53
10	45.0274440000	39.0689530000	Краснодарский край муниципальное образование Краснодар Краснодар 	Россия	Краснодарский край	муниципальное образование Краснодар	Краснодар		2024-07-28 12:48:14	2024-07-28 12:48:14
11	45.0276860000	39.0699950000	Краснодарский край муниципальное образование Краснодар Краснодар 	Россия	Краснодарский край	муниципальное образование Краснодар	Краснодар		2024-07-28 12:48:14	2024-07-28 12:48:14
12	45.0260680000	39.0682440000	Краснодарский край муниципальное образование Краснодар Краснодар 	Россия	Краснодарский край	муниципальное образование Краснодар	Краснодар		2024-07-28 12:49:53	2024-07-28 12:49:53
13	45.0268970000	39.0695100000	Краснодарский край муниципальное образование Краснодар Краснодар 	Россия	Краснодарский край	муниципальное образование Краснодар	Краснодар		2024-07-28 12:56:24	2024-07-28 12:56:24
\.


--
-- Data for Name: measurements; Type: TABLE DATA; Schema: public; Owner: kim
--

COPY public.measurements (id, name, created_at, updated_at) FROM stdin;
1	кг	2024-07-09 11:04:18	2024-07-09 11:04:18
2	г	2024-07-09 11:04:18	2024-07-09 11:04:18
3	л	2024-07-09 11:04:18	2024-07-09 11:04:18
4	шт	2024-07-09 11:04:18	2024-07-09 11:04:18
5	см	2024-07-09 11:04:18	2024-07-09 11:04:18
\.


--
-- Data for Name: media; Type: TABLE DATA; Schema: public; Owner: kim
--

COPY public.media (id, model_type, model_id, uuid, collection_name, name, file_name, mime_type, disk, conversions_disk, size, manipulations, custom_properties, generated_conversions, responsive_images, order_column, created_at, updated_at) FROM stdin;
1	App\\Models\\Dish\\Menu	1	97d29c35-ccb6-4697-8a85-f6859211c14d	menu	МАЦАХИРО	zeSJBJV6AJo2k6bU5IQX.jpg	image/jpeg	public	public	2762934	[]	[]	[]	[]	1	2024-07-10 06:56:10	2024-07-10 06:56:10
2	App\\Models\\Dish\\Menu	2	781be383-a459-4d42-b5d3-6174dc55b685	menu	ОЙШИ	Qc7yrjfxp9gTQ36Dpe4Y.jpg	image/jpeg	public	public	2742562	[]	[]	[]	[]	1	2024-07-10 06:57:17	2024-07-10 06:57:17
3	App\\Models\\Dish\\Menu	3	4a81c15c-2f55-4d5e-8b1b-74b4214432b2	menu	ПИКАССО	aj0NsqZgNjW11BsQ9PES.jpg	image/jpeg	public	public	3297293	[]	[]	[]	[]	1	2024-07-10 06:58:13	2024-07-10 06:58:13
5	App\\Models\\Dish\\Menu	4	d3d90b8a-b07b-4aa9-b06a-858337dc1913	menu	МОНЕ	UBKy1ICmUdGvlUUKY15i.jpg	image/jpeg	public	public	2655278	[]	[]	[]	[]	1	2024-07-10 07:36:23	2024-07-10 07:36:23
6	App\\Models\\Dish\\Menu	5	3d8112bf-4b77-4c67-83af-0a13506dd423	menu	ФЕНИКС	o0Pt4VC5ExHbEgXR4Kxj.jpg	image/jpeg	public	public	2744955	[]	[]	[]	[]	1	2024-07-10 07:37:23	2024-07-10 07:37:23
7	App\\Models\\Dish\\Menu	6	13c21925-94da-430d-a06c-ac0bd5500194	menu	БАВАРИЯ	HMDv0dRSzxib8morStYO.jpg	image/jpeg	public	public	2568701	[]	[]	[]	[]	1	2024-07-10 07:48:47	2024-07-10 07:48:47
8	App\\Models\\Dish\\Menu	7	38694455-0881-4ed9-bf92-92e8c3ae1b9e	menu	САХАЛИН (1)	mxqo1p9z7IPQUEbhtsgl.jpg	image/jpeg	public	public	2991546	[]	[]	[]	[]	1	2024-07-10 07:50:04	2024-07-10 07:50:04
9	App\\Models\\Dish\\Menu	8	b5f741e5-6870-414f-8b9f-314106d4e78c	menu	КИМУЛЯ	xjBdtkrAXKshAuyOFTcg.jpg	image/jpeg	public	public	2587706	[]	[]	[]	[]	1	2024-07-10 07:57:48	2024-07-10 07:57:48
10	App\\Models\\Dish\\Menu	9	d6745504-2249-46c7-8530-bad903b7b7cf	menu	МЕХИКО	AYE1VgXi2vyfYuK75kb4.jpg	image/jpeg	public	public	2857992	[]	[]	[]	[]	1	2024-07-10 07:58:43	2024-07-10 07:58:43
11	App\\Models\\Dish\\Menu	10	78cb174a-d999-456a-93e3-2e2c6d4763e8	menu	ЦЕЗАРЬ ТЕМПУРА (1)	mRg5R5hjE37tZIeYtdwz.jpg	image/jpeg	public	public	1647748	[]	[]	[]	[]	1	2024-07-10 10:06:31	2024-07-10 10:06:31
12	App\\Models\\Dish\\Menu	11	f9890d8a-385f-43aa-9a16-4e37ec8dbf9d	menu	КАЛИФОРОНИЯ ТЕМПУРА	8GIcYjkasTBaml76e7cx.jpg	image/jpeg	public	public	1772893	[]	[]	[]	[]	1	2024-07-10 10:08:03	2024-07-10 10:08:03
13	App\\Models\\Dish\\Menu	12	ae71c7a5-3b4a-400f-a775-2f0caa0c8d61	menu	ХАМАНИШИ ТЕМПУРА	LpEranRP31zXfqDzqWJR.jpg	image/jpeg	public	public	1607287	[]	[]	[]	[]	1	2024-07-10 10:09:27	2024-07-10 10:09:27
14	App\\Models\\Dish\\Menu	13	ebf4de09-1b14-4e72-9eaa-d444be595397	menu	ФИЛ КАЛИФОРНИЙСКИЙ	8VkOyUJFoUqFkrheA4Yr.jpg	image/jpeg	public	public	5477754	[]	[]	[]	[]	1	2024-07-10 10:12:01	2024-07-10 10:12:01
15	App\\Models\\Dish\\Menu	14	4c09794e-5933-4cb8-8ae6-bd2826e19c3f	menu	МИКС	v1ck03KT6RvupUU1A6CD.jpg	image/jpeg	public	public	5478204	[]	[]	[]	[]	1	2024-07-10 10:12:58	2024-07-10 10:12:58
16	App\\Models\\Dish\\Menu	15	771fb306-606b-407a-bc19-6b5c8d506277	menu	ДУЭТ	prtpbNl6gydOS5tvl8f4.jpg	image/jpeg	public	public	4954441	[]	[]	[]	[]	1	2024-07-10 10:14:06	2024-07-10 10:14:06
17	App\\Models\\Dish\\Menu	16	7ae03432-1a47-41cc-be5b-3f6988aa9536	menu	МАЛО ПОЛОВИН	DwA3qIttKryTAQyTu5bI.jpg	image/jpeg	public	public	5442724	[]	[]	[]	[]	1	2024-07-10 10:15:17	2024-07-10 10:15:17
18	App\\Models\\Other\\Onboarding	1	a1fe80e2-bed6-4d66-a666-f08a2b21d664	onboarding	Photo (1)	xWuhsIzDaYfReqrHmLrJ.png	image/png	public	public	292188	[]	[]	[]	[]	1	2024-07-11 14:39:29	2024-07-11 14:39:29
20	App\\Models\\Other\\Onboarding	3	5721ed7e-b470-4823-8569-abe92183acc7	onboarding	Photo 3	WcIxvaVx4uyfekBaiV6x.png	image/png	public	public	1022731	[]	[]	[]	[]	1	2024-07-11 14:40:02	2024-07-11 14:40:02
21	App\\Models\\Other\\Onboarding	4	d18ee6e2-94cd-43a8-85b5-e2835339b695	onboarding	Photo 2	nJcCo8fM5fVfZEQXaBtt.png	image/png	public	public	1641694	[]	[]	[]	[]	1	2024-07-11 14:40:33	2024-07-11 14:40:33
22	App\\Models\\Dish\\Additive	1	da851af2-67ed-4bbe-9c1a-efbb19b1edf9	additive	БАВАРИЯ	G5dwVEQ8Tg8efc0JKyrh.jpg	image/jpeg	public	public	2568701	[]	[]	[]	[]	1	2024-07-11 14:42:11	2024-07-11 14:42:11
23	App\\Models\\Dish\\Device	1	6db32495-726f-4626-934a-1c3bdbd85292	device	ДУЭТ	XlACX1bHrbUc4P9ODKzF.jpg	image/jpeg	public	public	4954441	[]	[]	[]	[]	1	2024-07-11 14:42:32	2024-07-11 14:42:32
24	App\\Models\\Dish\\Menu	16	0e43ff0d-94c7-45e4-ab0e-048ee6424836	menu	ПИКАССО	18uCNEfIq19DtkY4hOjd.jpg	image/jpeg	public	public	3297293	[]	[]	[]	[]	2	2024-07-12 13:39:41	2024-07-12 13:39:41
25	App\\Models\\Dish\\Menu	17	93e0223a-ac3a-4cff-a958-ae5d518ff707	menu	pasted image 0	7lBTiSwU4SrsYT1Noe6O.png	image/png	public	public	849091	[]	[]	[]	[]	1	2024-07-24 12:12:27	2024-07-24 12:12:27
26	App\\Models\\Other\\StoryCategory	1	9934a5af-c1fe-42f5-99af-b814ee1737bc	story_category	Oneboarding 2	Ghgb7GYrESIgUKcQMqQi.png	image/png	public	public	479700	[]	[]	[]	[]	1	2024-09-23 10:50:57	2024-09-23 10:50:57
27	App\\Models\\Other\\Story	1	8aea72cd-8343-4603-93a0-b263c90cdc6e	story	Oneboarding 2	vFkrQEUC8u1vuUerW3QB.png	image/png	public	public	479700	[]	[]	[]	[]	1	2024-09-23 10:51:12	2024-09-23 10:51:12
28	App\\Models\\Other\\StoryCategory	2	a444b9e3-d1b6-495d-9cd1-87455775e4fb	story_category	Story	HfO7Ccc2I4Nq4USFtEaI.png	image/png	public	public	169689	[]	[]	[]	[]	1	2024-09-23 10:54:00	2024-09-23 10:54:00
29	App\\Models\\Other\\Story	2	5eaed9a2-0155-4150-a62d-ad8c7007dbe1	story	Story	Pw7YQYl052dlvX3GjFhL.png	image/png	public	public	169689	[]	[]	[]	[]	1	2024-09-23 10:54:27	2024-09-23 10:54:27
30	App\\Models\\Other\\Story	3	37faacda-4192-4809-b866-b128042d39c6	story	Oneboarding 3 (1)	AtTQHoiT32LI6TDiMLK1.png	image/png	public	public	331434	[]	[]	[]	[]	1	2024-09-23 10:55:19	2024-09-23 10:55:19
31	App\\Models\\Other\\Story	4	aa82af31-3114-4eaa-ac9b-dd03fec449ac	story	Oneboarding 2	taYkwviwzEIrcE2bWPqK.png	image/png	public	public	479700	[]	[]	[]	[]	1	2024-09-23 10:55:55	2024-09-23 10:55:55
34	App\\Models\\Dish\\Menu	17	71c39a33-310f-4bd6-a088-a56ab857868b	menu	50ac61f2c34c096938d7efa99a9c3277	4VN9Ux8cYDgalqm2OkvK.jpg	image/jpeg	public	public	2560259	[]	[]	[]	[]	2	2024-09-27 13:17:11	2024-09-27 13:17:11
35	App\\Models\\Dish\\Menu	17	aec2128d-5684-4a34-9fbf-2ad1f96c9009	menu	3b5fd113252343437cc443787a4aa935	JJ96kS2TE1C6QLdhfLn6.png	image/png	public	public	2039861	[]	[]	[]	[]	3	2024-09-27 13:17:11	2024-09-27 13:17:11
36	App\\Models\\Dish\\Additive	3	f11c3a8c-0518-484d-8c0e-4cc10961ecb8	additive	7d756c20973abbea864911fc96a2ffe3	ec3HjTKDlqx1XfVwO4En.png	image/png	public	public	3309338	[]	[]	[]	[]	1	2024-09-27 13:22:52	2024-09-27 13:22:52
37	App\\Models\\Dish\\Additive	2	874114c2-b232-4de7-8b4d-b77dd5a41695	additive	823bb8fcac15f2569f918a52dc6a4a6d	jBZA7ICNDOjRRJYUowjg.png	image/png	public	public	6875036	[]	[]	[]	[]	1	2024-09-27 13:25:44	2024-09-27 13:25:44
38	App\\Models\\Dish\\Additive	4	3db2188a-c27d-421b-b0b9-fbee72f1469a	additive	fa891ed030bfa259207d0b078a9e7daf	nCTtmREBbibZqN0Ca1GR.jpg	image/jpeg	public	public	41730	[]	[]	[]	[]	1	2024-09-27 13:27:50	2024-09-27 13:27:50
39	App\\Models\\Dish\\Menu	18	c198d47e-252b-49eb-a9f3-eeb2d55d8420	menu	823bb8fcac15f2569f918a52dc6a4a6d	3JZuzcgeFB9CIb5DXjb5.png	image/png	public	public	6875036	[]	[]	[]	[]	1	2024-09-27 15:49:34	2024-09-27 15:49:34
40	App\\Models\\Dish\\Menu	18	135c6716-e8c8-4a0d-8cd1-745730803ba7	menu	50ac61f2c34c096938d7efa99a9c3277	YYE6lNSZEYGC73CrvK9q.jpg	image/jpeg	public	public	2560259	[]	[]	[]	[]	2	2024-09-27 15:49:34	2024-09-27 15:49:34
41	App\\Models\\Dish\\Menu	18	f10c74c6-ba7d-4dea-93fc-3981be4042a4	menu	3b5fd113252343437cc443787a4aa935	7KHJPb96y3BfK7kCtflw.png	image/png	public	public	2039861	[]	[]	[]	[]	3	2024-09-27 15:49:34	2024-09-27 15:49:34
\.


--
-- Data for Name: menu_additive; Type: TABLE DATA; Schema: public; Owner: kim
--

COPY public.menu_additive (id, menu_id, additive_id) FROM stdin;
1	15	1
2	16	1
3	17	2
4	17	3
5	17	4
6	18	4
7	18	3
8	18	2
\.


--
-- Data for Name: menu_category; Type: TABLE DATA; Schema: public; Owner: kim
--

COPY public.menu_category (id, menu_id, category_id) FROM stdin;
1	1	8
2	2	8
3	3	8
4	4	8
5	5	8
6	8	8
7	9	8
8	10	6
9	11	6
10	12	6
11	13	12
12	14	12
13	15	12
14	16	12
15	17	11
19	18	3
\.


--
-- Data for Name: menu_device; Type: TABLE DATA; Schema: public; Owner: kim
--

COPY public.menu_device (id, menu_id, device_id) FROM stdin;
\.


--
-- Data for Name: menu_ingredient; Type: TABLE DATA; Schema: public; Owner: kim
--

COPY public.menu_ingredient (id, menu_id, ingredient_id, value) FROM stdin;
1	1	32	\N
2	1	12	\N
3	16	2	\N
4	16	5	\N
5	16	1	\N
6	15	2	\N
7	15	6	\N
8	15	13	\N
9	14	22	\N
10	14	16	\N
11	14	18	\N
12	13	26	\N
13	13	27	\N
14	13	30	\N
15	11	32	\N
16	11	20	\N
17	7	2	\N
18	7	20	\N
19	7	31	\N
20	17	25	4
21	17	19	10
22	17	18	8
23	17	30	16
25	18	2	23
24	18	6	12.4
\.


--
-- Data for Name: menu_sizes; Type: TABLE DATA; Schema: public; Owner: kim
--

COPY public.menu_sizes (id, price, size, weight, count, measurement_id, menu_id, created_at, updated_at) FROM stdin;
2	350	50	300	1	2	17	2024-09-27 09:59:35	2024-09-27 09:59:35
3	208	33	200	1	5	17	2024-09-27 13:09:54	2024-09-27 13:09:54
1	256	45	250	1	2	17	2024-09-27 09:59:18	2024-09-27 16:28:42
5	234	23	23	2	2	1	2024-09-27 16:47:54	2024-09-27 16:47:54
6	456	45	54	45	2	1	2024-09-27 16:49:46	2024-09-27 16:49:46
4	231	35	234	23	5	18	2024-09-27 15:55:30	2024-09-28 16:26:13
7	200	24	205	34	5	18	2024-09-28 16:20:49	2024-09-30 13:30:33
\.


--
-- Data for Name: menu_tags; Type: TABLE DATA; Schema: public; Owner: kim
--

COPY public.menu_tags (id, menu_id, tag_id) FROM stdin;
1	17	1
2	17	2
3	18	1
4	18	2
\.


--
-- Data for Name: menus; Type: TABLE DATA; Schema: public; Owner: kim
--

COPY public.menus (id, name, price, weight, count, measurement_id, "order", created_at, updated_at, nutritional_value_per, calorie_content, proteins, fat, carbohydrate, description) FROM stdin;
1	Мацахиро	299	250	8	4	1	2024-07-10 06:56:10	2024-07-10 06:56:10	\N	\N	\N	\N	\N	\N
2	Ойши	309	230	8	\N	1	2024-07-10 06:57:17	2024-07-10 06:57:17	\N	\N	\N	\N	\N	\N
3	Пикассо	329	230	8	2	1	2024-07-10 06:58:13	2024-07-10 06:58:13	\N	\N	\N	\N	\N	\N
4	Моне	299	200	8	2	1	2024-07-10 07:36:23	2024-07-10 07:36:23	\N	\N	\N	\N	\N	\N
5	Феникс	289	220	8	2	1	2024-07-10 07:37:23	2024-07-10 07:37:23	\N	\N	\N	\N	\N	\N
6	Бавария	289	220	8	2	1	2024-07-10 07:48:47	2024-07-10 07:48:47	\N	\N	\N	\N	\N	\N
7	Сахалин	319	230	8	2	1	2024-07-10 07:50:04	2024-07-10 07:50:04	\N	\N	\N	\N	\N	\N
8	Кимуля	289	190	8	2	1	2024-07-10 07:57:48	2024-07-10 07:57:48	\N	\N	\N	\N	\N	\N
9	Мехико	299	230	8	2	1	2024-07-10 07:58:43	2024-07-10 07:58:43	\N	\N	\N	\N	\N	\N
10	Феникс темпура	339	220	8	2	1	2024-07-10 10:06:30	2024-07-10 10:06:30	\N	\N	\N	\N	\N	\N
11	Танто темпура	349	230	8	2	1	2024-07-10 10:08:03	2024-07-10 10:08:03	\N	\N	\N	\N	\N	\N
12	Айкидо темпура	309	220	8	2	1	2024-07-10 10:09:27	2024-07-10 10:09:27	\N	\N	\N	\N	\N	\N
13	Сет Филкалифорнийский	569	440	16	2	1	2024-07-10 10:12:01	2024-07-10 10:12:01	\N	\N	\N	\N	\N	\N
14	Сет Микс	565	430	16	2	1	2024-07-10 10:12:58	2024-07-10 10:12:58	\N	\N	\N	\N	\N	\N
15	Сет Дуэт	549	460	16	2	1	2024-07-10 10:14:06	2024-07-10 10:14:06	\N	\N	\N	\N	\N	\N
17	Пицца Маргарита	309	200	1	2	1	2024-07-24 12:12:27	2024-09-27 13:17:54	\N	213	5	11	21	Копченый угорь, тигровая креветка, авокадо, сыр чеддер, огурец, унаги соус, тайский чили соус
16	Сет малополовин	569	450	16	2	1	2024-07-10 10:15:17	2024-09-27 13:18:56	\N	79	12	23	34	\N
18	тест	45.5	22.5	12.5	2	1	2024-09-27 15:49:34	2024-09-27 17:39:39	\N	23.3	23.4	23.4	23.4	Test Test Test Test Test
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: kim
--

COPY public.migrations (id, migration, batch) FROM stdin;
20	0001_01_01_000000_create_users_table	1
21	0001_01_01_000001_create_cache_table	1
22	0001_01_01_000002_create_jobs_table	1
23	2024_05_30_082930_create_media_table	1
24	2024_05_30_083153_create_permission_tables	1
25	2024_05_30_083402_create_audits_table	1
26	2024_06_01_131951_create_restaurants_table	1
27	2024_06_01_133030_restaurant_user_migration	1
28	2024_06_11_114458_create_two_factor_auths_table	1
29	2024_06_11_114506_create_two_factor_auth_telegrams_table	1
30	2024_06_13_051124_create_onboardings_table	1
31	2024_06_19_093445_create_categories_table	1
32	2024_06_20_065056_create_ingredients_table	1
33	2024_06_20_144838_create_ingredient_categories_table	1
34	2024_06_20_145033_create_measurements_table	1
35	2024_06_21_045208_add_coumns_ingredient_migration	1
36	2024_06_21_055206_create_tags_table	1
37	2024_06_23_145321_create_menus_table	1
38	2024_06_23_150516_create_menu_sizes_table	1
39	2024_06_23_150845_menu_tags_migration	1
40	2024_06_24_171815_menu_category_migration	1
41	2024_06_27_120612_add_columns_menu_migration	1
42	2024_06_29_125954_menu_ingredient_migration	1
43	2024_06_30_172250_create_additives_table	1
44	2024_06_30_173724_create_devices_table	1
45	2024_07_01_062851_menu_additive_migration	1
46	2024_07_01_062909_cateegory_additive_migration	1
47	2024_07_01_075605_menu_device_migration	1
48	2024_07_01_075633_category_device_migration	1
49	2024_07_05_193414_create_areas_table	1
50	2024_07_09_144029_restaurant_menu_prices_migration	2
51	2024_07_11_134833_recommendation_by_category_migration	3
52	2024_07_11_140528_create_story_categories_table	3
53	2024_07_11_140537_create_stories_table	3
54	2024_07_11_141725_create_regions_table	3
55	2024_07_11_162729_add_region_column_restaurant_table_migration	3
56	2024_07_16_163316_add_column_restaurant_migration	4
57	2024_07_18_105758_add_columns_region_migration	4
58	2024_07_18_185044_create_locations_table	4
59	2024_07_19_114700_create_user_points_table	5
60	2024_07_25_124608_add_column_menu_migration	6
61	2024_08_01_074134_create_promo_codes_table	7
62	2024_08_01_080352_create_user_statuses_table	7
63	2024_08_01_080711_promo_code_user_status_migration	7
64	2024_08_01_080907_promo_code_category_migration	7
65	2024_08_01_081022_promo_code_menu_migration	7
66	2024_08_01_081218_promo_code_user_migration	7
67	2024_08_01_081317_promo_code_restaurant_migration	7
68	2024_08_01_082913_create_presents_table	7
69	2024_08_01_083152_presents_restaurant_migration	7
70	2024_08_01_084014_create_bonuses_table	7
71	2024_08_01_084217_bonus_user_status_migration	7
72	2024_08_01_084243_bonus_category_migration	7
73	2024_08_01_084311_bonus_menu_migration	7
74	2024_08_01_084333_bonus_restaurant_migration	7
75	2024_08_01_085849_create_promotions_table	7
76	2024_08_01_090103_promotion_category_migration	7
77	2024_08_01_090117_promotion_menu_migration	7
78	2024_08_01_090157_promotion_restaurant_migration	7
79	2024_09_09_074852_two_factor_telegram_add_column_migration	8
80	2024_09_26_133853_create_notifications_table	9
\.


--
-- Data for Name: model_has_permissions; Type: TABLE DATA; Schema: public; Owner: kim
--

COPY public.model_has_permissions (permission_id, model_type, model_id) FROM stdin;
\.


--
-- Data for Name: model_has_roles; Type: TABLE DATA; Schema: public; Owner: kim
--

COPY public.model_has_roles (role_id, model_type, model_id) FROM stdin;
1	App\\Models\\User	1
\.


--
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: kim
--

COPY public.notifications (id, type, notifiable_type, notifiable_id, data, read_at, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: onboardings; Type: TABLE DATA; Schema: public; Owner: kim
--

COPY public.onboardings (id, title, text, "order", created_at, updated_at) FROM stdin;
1	Акция	Закажи суши с быстрой доставкой	1	2024-07-11 14:39:29	2024-07-11 14:39:29
3	Зарегистрируйся и получи скидку	Получи первую скидку	2	2024-07-11 14:40:02	2024-07-11 14:40:02
4	Вкусная пицца	У нас быстрая доставка	3	2024-07-11 14:40:33	2024-07-11 14:40:33
\.


--
-- Data for Name: password_reset_tokens; Type: TABLE DATA; Schema: public; Owner: kim
--

COPY public.password_reset_tokens (email, token, created_at) FROM stdin;
\.


--
-- Data for Name: permissions; Type: TABLE DATA; Schema: public; Owner: kim
--

COPY public.permissions (id, name, guard_name, display_name, parent_id, created_at, updated_at) FROM stdin;
1	user_management	web	Управление пользователями	0	2024-07-09 11:04:17	2024-07-09 11:04:17
2	show_user	web	Просмотр	1	2024-07-09 11:04:17	2024-07-09 11:04:17
3	create_user	web	Добавлять	1	2024-07-09 11:04:17	2024-07-09 11:04:17
4	edit_user	web	Редактировать	1	2024-07-09 11:04:17	2024-07-09 11:04:17
5	delete_user	web	Удалить	1	2024-07-09 11:04:17	2024-07-09 11:04:17
6	role_management	web	Управление ролями	0	2024-07-09 11:04:17	2024-07-09 11:04:17
7	show_role	web	Просмотр	6	2024-07-09 11:04:17	2024-07-09 11:04:17
8	create_role	web	Добавлять	6	2024-07-09 11:04:17	2024-07-09 11:04:17
9	edit_role	web	Редактировать	6	2024-07-09 11:04:17	2024-07-09 11:04:17
10	delete_role	web	Удалить	6	2024-07-09 11:04:17	2024-07-09 11:04:17
11	restaurant_management	web	Управление рестораном	0	2024-07-09 11:04:17	2024-07-09 11:04:17
12	show_restaurant	web	Просмотр	11	2024-07-09 11:04:17	2024-07-09 11:04:17
13	create_restaurant	web	Добавлять	11	2024-07-09 11:04:17	2024-07-09 11:04:17
14	edit_restaurant	web	Редактировать	11	2024-07-09 11:04:17	2024-07-09 11:04:17
15	delete_restaurant	web	Удалить	11	2024-07-09 11:04:17	2024-07-09 11:04:17
16	notification_management	web	Управление уведомлениями	0	2024-07-09 11:04:17	2024-07-09 11:04:17
17	show_notification	web	Просмотр	16	2024-07-09 11:04:17	2024-07-09 11:04:17
18	create_notification	web	Добавлять	16	2024-07-09 11:04:17	2024-07-09 11:04:17
19	edit_notification	web	Редактировать	16	2024-07-09 11:04:17	2024-07-09 11:04:17
20	delete_notification	web	Удалить	16	2024-07-09 11:04:17	2024-07-09 11:04:17
21	order_management	web	Управление заказами	0	2024-07-09 11:04:17	2024-07-09 11:04:17
22	show_order	web	Просмотр	21	2024-07-09 11:04:17	2024-07-09 11:04:17
23	edit_order	web	Редактировать	21	2024-07-09 11:04:17	2024-07-09 11:04:17
24	delete_order	web	Удалить	21	2024-07-09 11:04:17	2024-07-09 11:04:17
25	discount_management	web	Управление скидками	0	2024-07-09 11:04:17	2024-07-09 11:04:17
26	show_discount	web	Просмотр	25	2024-07-09 11:04:17	2024-07-09 11:04:17
27	create_discount	web	Добавлять	25	2024-07-09 11:04:17	2024-07-09 11:04:17
28	edit_discount	web	Редактировать	25	2024-07-09 11:04:17	2024-07-09 11:04:17
29	delete_discount	web	Удалить	25	2024-07-09 11:04:17	2024-07-09 11:04:17
30	onboarding_management	web	Управление онбординг	0	2024-07-09 11:04:17	2024-07-09 11:04:17
31	show_onboarding	web	Просмотр	30	2024-07-09 11:04:17	2024-07-09 11:04:17
32	create_onboarding	web	Добавлять	30	2024-07-09 11:04:17	2024-07-09 11:04:17
33	edit_onboarding	web	Редактировать	30	2024-07-09 11:04:17	2024-07-09 11:04:17
34	delete_onboarding	web	Удалить	30	2024-07-09 11:04:17	2024-07-09 11:04:17
35	dish_category_management	web	Управление категориями	0	2024-07-09 11:04:18	2024-07-09 11:04:18
36	show_dish_category	web	Просмотр	35	2024-07-09 11:04:18	2024-07-09 11:04:18
37	create_dish_category	web	Добавлять	35	2024-07-09 11:04:18	2024-07-09 11:04:18
38	edit_dish_category	web	Редактировать	35	2024-07-09 11:04:18	2024-07-09 11:04:18
39	delete_dish_category	web	Удалить	35	2024-07-09 11:04:18	2024-07-09 11:04:18
40	ingredient_management	web	Управление ингридиентами	0	2024-07-09 11:04:18	2024-07-09 11:04:18
41	show_ingredient	web	Просмотр	40	2024-07-09 11:04:18	2024-07-09 11:04:18
42	create_ingredient	web	Добавлять	40	2024-07-09 11:04:18	2024-07-09 11:04:18
43	edit_ingredient	web	Редактировать	40	2024-07-09 11:04:18	2024-07-09 11:04:18
44	delete_ingredient	web	Удалить	40	2024-07-09 11:04:18	2024-07-09 11:04:18
45	menu_management	web	Управление меню	0	2024-07-09 11:04:18	2024-07-09 11:04:18
46	show_menu	web	Просмотр	45	2024-07-09 11:04:18	2024-07-09 11:04:18
47	create_menu	web	Добавлять	45	2024-07-09 11:04:18	2024-07-09 11:04:18
48	edit_menu	web	Редактировать	45	2024-07-09 11:04:18	2024-07-09 11:04:18
49	delete_menu	web	Удалить	45	2024-07-09 11:04:18	2024-07-09 11:04:18
50	menu_restaurant_management	web	Управление меню в заведениях	0	2024-07-09 11:04:18	2024-07-09 11:04:18
51	management_restaurant_menu	web	Управление	50	2024-07-09 11:04:18	2024-07-09 11:04:18
52	story_management	web	Управление сторисами	0	2024-07-18 19:10:10	2024-07-18 19:10:10
53	show_story	web	Просмотр	52	2024-07-18 19:10:10	2024-07-18 19:10:10
54	create_story	web	Добавлять	52	2024-07-18 19:10:10	2024-07-18 19:10:10
55	edit_story	web	Редактировать	52	2024-07-18 19:10:10	2024-07-18 19:10:10
56	delete_story	web	Удалить	52	2024-07-18 19:10:10	2024-07-18 19:10:10
57	bonus_management	web	Управление бонусами	0	2024-08-28 12:18:38	2024-08-28 12:18:38
58	show_bonus	web	Просмотр	57	2024-08-28 12:18:38	2024-08-28 12:18:38
59	create_bonus	web	Добавлять	57	2024-08-28 12:18:38	2024-08-28 12:18:38
60	edit_bonus	web	Редактировать	57	2024-08-28 12:18:38	2024-08-28 12:18:38
61	delete_bonus	web	Удалить	57	2024-08-28 12:18:38	2024-08-28 12:18:38
62	promotion_management	web	Управление скидками	0	2024-08-28 12:18:38	2024-08-28 12:18:38
63	show_promotion	web	Просмотр	62	2024-08-28 12:18:38	2024-08-28 12:18:38
64	create_promotion	web	Добавлять	62	2024-08-28 12:18:38	2024-08-28 12:18:38
65	edit_promotion	web	Редактировать	62	2024-08-28 12:18:38	2024-08-28 12:18:38
66	delete_promotion	web	Удалить	62	2024-08-28 12:18:38	2024-08-28 12:18:38
67	present_management	web	Управление подарками	0	2024-08-28 12:18:38	2024-08-28 12:18:38
68	show_present	web	Просмотр	67	2024-08-28 12:18:38	2024-08-28 12:18:38
69	create_present	web	Добавлять	67	2024-08-28 12:18:38	2024-08-28 12:18:38
70	edit_present	web	Редактировать	67	2024-08-28 12:18:38	2024-08-28 12:18:38
71	delete_present	web	Удалить	67	2024-08-28 12:18:38	2024-08-28 12:18:38
72	promo_code_management	web	Управление промокодами	0	2024-08-28 12:18:38	2024-08-28 12:18:38
73	show_promo_code	web	Просмотр	72	2024-08-28 12:18:38	2024-08-28 12:18:38
74	create_promo_code	web	Добавлять	72	2024-08-28 12:18:38	2024-08-28 12:18:38
75	edit_promo_code	web	Редактировать	72	2024-08-28 12:18:38	2024-08-28 12:18:38
76	delete_promo_code	web	Удалить	72	2024-08-28 12:18:38	2024-08-28 12:18:38
77	user_status_management	web	Управление статусами пользователей	0	2024-08-28 12:18:38	2024-08-28 12:18:38
78	show_user_status	web	Просмотр	77	2024-08-28 12:18:38	2024-08-28 12:18:38
79	create_user_status	web	Добавлять	77	2024-08-28 12:18:38	2024-08-28 12:18:38
80	edit_user_status	web	Редактировать	77	2024-08-28 12:18:38	2024-08-28 12:18:38
81	delete_user_status	web	Удалить	77	2024-08-28 12:18:38	2024-08-28 12:18:38
\.


--
-- Data for Name: present_restaurant; Type: TABLE DATA; Schema: public; Owner: kim
--

COPY public.present_restaurant (id, restaurant_id, present_id) FROM stdin;
\.


--
-- Data for Name: presents; Type: TABLE DATA; Schema: public; Owner: kim
--

COPY public.presents (id, name, is_birthday_present, menu_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: promo_code_category; Type: TABLE DATA; Schema: public; Owner: kim
--

COPY public.promo_code_category (id, category_id, promo_code_id) FROM stdin;
\.


--
-- Data for Name: promo_code_menu; Type: TABLE DATA; Schema: public; Owner: kim
--

COPY public.promo_code_menu (id, menu_id, promo_code_id) FROM stdin;
\.


--
-- Data for Name: promo_code_restaurant; Type: TABLE DATA; Schema: public; Owner: kim
--

COPY public.promo_code_restaurant (id, restaurant_id, promo_code_id) FROM stdin;
\.


--
-- Data for Name: promo_code_user; Type: TABLE DATA; Schema: public; Owner: kim
--

COPY public.promo_code_user (id, user_id, promo_code_id) FROM stdin;
\.


--
-- Data for Name: promo_code_user_status; Type: TABLE DATA; Schema: public; Owner: kim
--

COPY public.promo_code_user_status (id, user_status_id, promo_code_id) FROM stdin;
\.


--
-- Data for Name: promo_codes; Type: TABLE DATA; Schema: public; Owner: kim
--

COPY public.promo_codes (id, code, name, value, is_percentage, start_date, end_date, starting_amount_activated, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: promotion_category; Type: TABLE DATA; Schema: public; Owner: kim
--

COPY public.promotion_category (id, category_id, promotion_id) FROM stdin;
1	2	1
2	2	2
3	5	2
4	3	3
\.


--
-- Data for Name: promotion_menu; Type: TABLE DATA; Schema: public; Owner: kim
--

COPY public.promotion_menu (id, menu_id, promotion_id) FROM stdin;
1	17	1
2	17	2
3	18	3
\.


--
-- Data for Name: promotion_restaurant; Type: TABLE DATA; Schema: public; Owner: kim
--

COPY public.promotion_restaurant (id, restaurant_id, promotion_id, is_percentage, value, created_at, updated_at) FROM stdin;
1	3	1	t	20	2024-08-29 16:43:59	2024-08-29 16:43:59
2	2	1	t	10	2024-08-29 16:43:59	2024-08-29 16:43:59
3	3	2	t	20	2024-08-30 11:33:54	2024-08-30 11:33:54
4	2	2	f	100	2024-08-30 11:33:54	2024-08-30 11:33:54
5	8	3	f	34	2024-09-28 16:29:17	2024-09-28 16:29:17
\.


--
-- Data for Name: promotions; Type: TABLE DATA; Schema: public; Owner: kim
--

COPY public.promotions (id, name, created_at, updated_at) FROM stdin;
1	Скидка на пиццу	2024-08-29 16:43:59	2024-08-29 16:43:59
2	Пицца к 1 сентябрю	2024-08-30 11:33:54	2024-08-30 11:33:54
3	test	2024-09-28 16:29:17	2024-09-28 16:29:17
\.


--
-- Data for Name: recommendation_by_category; Type: TABLE DATA; Schema: public; Owner: kim
--

COPY public.recommendation_by_category (id, menu_id, category_id) FROM stdin;
\.


--
-- Data for Name: regions; Type: TABLE DATA; Schema: public; Owner: kim
--

COPY public.regions (id, name, map_keys, created_at, updated_at, kladr_id) FROM stdin;
22	Пластуновская	2b2a2b8b-a033-46a2-838c-83623cc63779	2024-07-11 16:44:39	2024-09-16 09:44:03	2301000003300
23	Староминская	2b2a2b8b-a033-46a2-838c-83623cc63779	2024-07-11 16:44:39	2024-09-16 09:44:03	2303100000100
25	Тбилисская	2b2a2b8b-a033-46a2-838c-83623cc63779	2024-07-11 16:44:39	2024-09-16 09:44:03	2303200000100
26	Тихорецк	2b2a2b8b-a033-46a2-838c-83623cc63779	2024-07-11 16:44:39	2024-09-16 09:44:03	2303500100000
27	Усть-Лабинск	2b2a2b8b-a033-46a2-838c-83623cc63779	2024-07-11 16:44:39	2024-09-16 09:44:03	2303800100000
20	Новошахтинск	2b2a2b8b-a033-46a2-838c-83623cc63779	2024-07-11 16:44:39	2024-09-16 09:44:03	\N
24	Таганрог	2b2a2b8b-a033-46a2-838c-83623cc63779	2024-07-11 16:44:39	2024-09-16 09:44:03	\N
28	Яблоновский	2b2a2b8b-a033-46a2-838c-83623cc63779	2024-07-11 16:44:39	2024-09-16 09:44:03	\N
1	Анапа	2b2a2b8b-a033-46a2-838c-83623cc63779	2024-07-11 16:44:39	2024-09-16 09:44:03	2300300100000
2	Апшеронск	2b2a2b8b-a033-46a2-838c-83623cc63779	2024-07-11 16:44:39	2024-09-16 09:44:03	2300400100000
3	Белореченск	2b2a2b8b-a033-46a2-838c-83623cc63779	2024-07-11 16:44:39	2024-09-16 09:44:03	2300600100000
4	Варениковская	2b2a2b8b-a033-46a2-838c-83623cc63779	2024-07-11 16:44:39	2024-09-16 09:44:03	2301800001200
5	Васюринская	2b2a2b8b-a033-46a2-838c-83623cc63779	2024-07-11 16:44:39	2024-09-16 09:44:03	2301000004100
6	Выселки	2b2a2b8b-a033-46a2-838c-83623cc63779	2024-07-11 16:44:39	2024-09-16 09:44:03	2300800000100
7	Георгиевск	2b2a2b8b-a033-46a2-838c-83623cc63779	2024-07-11 16:44:39	2024-09-16 09:44:03	2303600001400
8	Динская	2b2a2b8b-a033-46a2-838c-83623cc63779	2024-07-11 16:44:39	2024-09-16 09:44:03	2301000000100
9	Каневская	2b2a2b8b-a033-46a2-838c-83623cc63779	2024-07-11 16:44:39	2024-09-16 09:44:03	2301400000100
10	Кореновск	2b2a2b8b-a033-46a2-838c-83623cc63779	2024-07-11 16:44:39	2024-09-16 09:44:03	2301500100000
11	Краснодар	2b2a2b8b-a033-46a2-838c-83623cc63779	2024-07-11 16:44:39	2024-09-16 09:44:03	2300000100000
12	Ладожская	2b2a2b8b-a033-46a2-838c-83623cc63779	2024-07-11 16:44:39	2024-09-16 09:44:03	2303800002000
13	Ленинградская	2b2a2b8b-a033-46a2-838c-83623cc63779	2024-07-11 16:44:39	2024-09-16 09:44:03	2302200000100
14	Майкоп	2b2a2b8b-a033-46a2-838c-83623cc63779	2024-07-11 16:44:39	2024-09-16 09:44:03	2300900007700
15	Михайловск	2b2a2b8b-a033-46a2-838c-83623cc63779	2024-07-11 16:44:39	2024-09-16 09:44:03	2302900003000
16	Нововеличковская	2b2a2b8b-a033-46a2-838c-83623cc63779	2024-07-11 16:44:39	2024-09-16 09:44:03	2301000002600
17	Новокубанск	2b2a2b8b-a033-46a2-838c-83623cc63779	2024-07-11 16:44:39	2024-09-16 09:44:03	2302400100000
18	Новопокровская	2b2a2b8b-a033-46a2-838c-83623cc63779	2024-07-11 16:44:39	2024-09-16 09:44:03	2302500000100
19	Новотитаровская	2b2a2b8b-a033-46a2-838c-83623cc63779	2024-07-11 16:44:39	2024-09-16 09:44:03	2301000002700
21	Павловская	2b2a2b8b-a033-46a2-838c-83623cc63779	2024-07-11 16:44:39	2024-09-16 09:44:03	2302700000100
\.


--
-- Data for Name: restaurant_menu_prices; Type: TABLE DATA; Schema: public; Owner: kim
--

COPY public.restaurant_menu_prices (id, restaurant_id, menu_id, menu_size_id, price, created_at, updated_at) FROM stdin;
1	3	1	\N	299	2024-07-29 09:57:32	2024-07-29 09:57:32
2	3	2	\N	309	2024-07-29 09:57:32	2024-07-29 09:57:32
3	3	3	\N	329	2024-07-29 09:57:32	2024-07-29 09:57:32
4	3	4	\N	299	2024-07-29 09:57:32	2024-07-29 09:57:32
5	3	5	\N	289	2024-07-29 09:57:32	2024-07-29 09:57:32
6	3	6	\N	289	2024-07-29 09:57:32	2024-07-29 09:57:32
7	3	7	\N	319	2024-07-29 09:57:32	2024-07-29 09:57:32
8	3	8	\N	289	2024-07-29 09:57:32	2024-07-29 09:57:32
9	3	9	\N	299	2024-07-29 09:57:32	2024-07-29 09:57:32
10	3	10	\N	339	2024-07-29 09:57:32	2024-07-29 09:57:32
11	3	11	\N	349	2024-07-29 09:57:32	2024-07-29 09:57:32
12	3	12	\N	309	2024-07-29 09:57:32	2024-07-29 09:57:32
13	3	13	\N	569	2024-07-29 09:57:32	2024-07-29 09:57:32
14	3	14	\N	565	2024-07-29 09:57:32	2024-07-29 09:57:32
15	3	15	\N	549	2024-07-29 09:57:32	2024-07-29 09:57:32
16	3	16	\N	569	2024-07-29 09:57:32	2024-07-29 09:57:32
17	3	17	\N	309	2024-07-29 09:57:32	2024-07-29 09:57:32
18	2	1	\N	300	2024-07-29 09:57:45	2024-07-29 09:57:45
19	2	2	\N	309	2024-07-29 09:57:45	2024-07-29 09:57:45
20	2	3	\N	329	2024-07-29 09:57:45	2024-07-29 09:57:45
21	2	4	\N	299	2024-07-29 09:57:45	2024-07-29 09:57:45
22	2	5	\N	289	2024-07-29 09:57:45	2024-07-29 09:57:45
23	2	6	\N	289	2024-07-29 09:57:45	2024-07-29 09:57:45
24	2	7	\N	319	2024-07-29 09:57:45	2024-07-29 09:57:45
25	2	8	\N	289	2024-07-29 09:57:45	2024-07-29 09:57:45
26	2	9	\N	299	2024-07-29 09:57:45	2024-07-29 09:57:45
27	2	10	\N	339	2024-07-29 09:57:45	2024-07-29 09:57:45
28	2	11	\N	349	2024-07-29 09:57:45	2024-07-29 09:57:45
29	2	12	\N	309	2024-07-29 09:57:45	2024-07-29 09:57:45
30	2	13	\N	569	2024-07-29 09:57:45	2024-07-29 09:57:45
31	2	14	\N	565	2024-07-29 09:57:45	2024-07-29 09:57:45
32	2	15	\N	549	2024-07-29 09:57:45	2024-07-29 09:57:45
33	2	16	\N	569	2024-07-29 09:57:45	2024-07-29 09:57:45
34	2	17	\N	309	2024-07-29 09:57:45	2024-07-29 09:57:45
35	1	1	\N	299	2024-07-31 13:48:00	2024-07-31 13:48:00
36	1	2	\N	309	2024-07-31 13:48:00	2024-07-31 13:48:00
37	1	3	\N	329	2024-07-31 13:48:00	2024-07-31 13:48:00
38	1	4	\N	299	2024-07-31 13:48:00	2024-07-31 13:48:00
39	1	5	\N	289	2024-07-31 13:48:00	2024-07-31 13:48:00
40	1	6	\N	289	2024-07-31 13:48:00	2024-07-31 13:48:00
41	1	7	\N	319	2024-07-31 13:48:00	2024-07-31 13:48:00
42	1	8	\N	289	2024-07-31 13:48:00	2024-07-31 13:48:00
43	1	9	\N	299	2024-07-31 13:48:00	2024-07-31 13:48:00
44	1	10	\N	339	2024-07-31 13:48:00	2024-07-31 13:48:00
45	1	11	\N	349	2024-07-31 13:48:00	2024-07-31 13:48:00
46	1	12	\N	309	2024-07-31 13:48:00	2024-07-31 13:48:00
47	1	13	\N	569	2024-07-31 13:48:00	2024-07-31 13:48:00
48	1	14	\N	565	2024-07-31 13:48:00	2024-07-31 13:48:00
49	1	15	\N	549	2024-07-31 13:48:00	2024-07-31 13:48:00
50	1	16	\N	569	2024-07-31 13:48:00	2024-07-31 13:48:00
51	1	17	\N	309	2024-07-31 13:48:00	2024-07-31 13:48:00
52	4	1	\N	299	2024-07-31 13:48:04	2024-07-31 13:48:04
53	4	2	\N	309	2024-07-31 13:48:04	2024-07-31 13:48:04
54	4	3	\N	329	2024-07-31 13:48:04	2024-07-31 13:48:04
55	4	4	\N	299	2024-07-31 13:48:04	2024-07-31 13:48:04
56	4	5	\N	289	2024-07-31 13:48:04	2024-07-31 13:48:04
57	4	6	\N	289	2024-07-31 13:48:04	2024-07-31 13:48:04
58	4	7	\N	319	2024-07-31 13:48:04	2024-07-31 13:48:04
59	4	8	\N	289	2024-07-31 13:48:04	2024-07-31 13:48:04
60	4	9	\N	299	2024-07-31 13:48:04	2024-07-31 13:48:04
61	4	10	\N	339	2024-07-31 13:48:04	2024-07-31 13:48:04
62	4	11	\N	349	2024-07-31 13:48:04	2024-07-31 13:48:04
63	4	12	\N	309	2024-07-31 13:48:04	2024-07-31 13:48:04
64	4	13	\N	569	2024-07-31 13:48:04	2024-07-31 13:48:04
65	4	14	\N	565	2024-07-31 13:48:04	2024-07-31 13:48:04
66	4	15	\N	549	2024-07-31 13:48:04	2024-07-31 13:48:04
67	4	16	\N	569	2024-07-31 13:48:04	2024-07-31 13:48:04
68	4	17	\N	309	2024-07-31 13:48:04	2024-07-31 13:48:04
69	5	1	\N	299	2024-07-31 13:48:08	2024-07-31 13:48:08
70	5	2	\N	309	2024-07-31 13:48:08	2024-07-31 13:48:08
71	5	3	\N	329	2024-07-31 13:48:08	2024-07-31 13:48:08
72	5	4	\N	299	2024-07-31 13:48:08	2024-07-31 13:48:08
73	5	5	\N	289	2024-07-31 13:48:08	2024-07-31 13:48:08
74	5	6	\N	289	2024-07-31 13:48:08	2024-07-31 13:48:08
75	5	7	\N	319	2024-07-31 13:48:08	2024-07-31 13:48:08
76	5	8	\N	289	2024-07-31 13:48:08	2024-07-31 13:48:08
77	5	9	\N	299	2024-07-31 13:48:08	2024-07-31 13:48:08
78	5	10	\N	339	2024-07-31 13:48:08	2024-07-31 13:48:08
79	5	11	\N	349	2024-07-31 13:48:08	2024-07-31 13:48:08
80	5	12	\N	309	2024-07-31 13:48:08	2024-07-31 13:48:08
81	5	13	\N	569	2024-07-31 13:48:08	2024-07-31 13:48:08
82	5	14	\N	565	2024-07-31 13:48:08	2024-07-31 13:48:08
83	5	15	\N	549	2024-07-31 13:48:08	2024-07-31 13:48:08
84	5	16	\N	569	2024-07-31 13:48:08	2024-07-31 13:48:08
85	5	17	\N	309	2024-07-31 13:48:08	2024-07-31 13:48:08
86	6	1	\N	299	2024-07-31 13:48:12	2024-07-31 13:48:12
87	6	2	\N	309	2024-07-31 13:48:12	2024-07-31 13:48:12
88	6	3	\N	329	2024-07-31 13:48:12	2024-07-31 13:48:12
89	6	4	\N	299	2024-07-31 13:48:12	2024-07-31 13:48:12
90	6	5	\N	289	2024-07-31 13:48:12	2024-07-31 13:48:12
91	6	6	\N	289	2024-07-31 13:48:12	2024-07-31 13:48:12
92	6	7	\N	319	2024-07-31 13:48:12	2024-07-31 13:48:12
93	6	8	\N	289	2024-07-31 13:48:12	2024-07-31 13:48:12
94	6	9	\N	299	2024-07-31 13:48:12	2024-07-31 13:48:12
95	6	10	\N	339	2024-07-31 13:48:12	2024-07-31 13:48:12
96	6	11	\N	349	2024-07-31 13:48:12	2024-07-31 13:48:12
97	6	12	\N	309	2024-07-31 13:48:12	2024-07-31 13:48:12
98	6	13	\N	569	2024-07-31 13:48:12	2024-07-31 13:48:12
99	6	14	\N	565	2024-07-31 13:48:12	2024-07-31 13:48:12
100	6	15	\N	549	2024-07-31 13:48:12	2024-07-31 13:48:12
101	6	16	\N	569	2024-07-31 13:48:12	2024-07-31 13:48:12
102	6	17	\N	309	2024-07-31 13:48:12	2024-07-31 13:48:12
103	7	1	\N	299	2024-07-31 13:48:16	2024-07-31 13:48:16
104	7	2	\N	309	2024-07-31 13:48:16	2024-07-31 13:48:16
105	7	3	\N	329	2024-07-31 13:48:16	2024-07-31 13:48:16
106	7	4	\N	299	2024-07-31 13:48:16	2024-07-31 13:48:16
107	7	5	\N	289	2024-07-31 13:48:16	2024-07-31 13:48:16
108	7	6	\N	289	2024-07-31 13:48:16	2024-07-31 13:48:16
109	7	7	\N	319	2024-07-31 13:48:16	2024-07-31 13:48:16
110	7	8	\N	289	2024-07-31 13:48:16	2024-07-31 13:48:16
111	7	9	\N	299	2024-07-31 13:48:16	2024-07-31 13:48:16
112	7	10	\N	339	2024-07-31 13:48:16	2024-07-31 13:48:16
113	7	11	\N	349	2024-07-31 13:48:16	2024-07-31 13:48:16
114	7	12	\N	309	2024-07-31 13:48:16	2024-07-31 13:48:16
115	7	13	\N	569	2024-07-31 13:48:16	2024-07-31 13:48:16
116	7	14	\N	565	2024-07-31 13:48:16	2024-07-31 13:48:16
117	7	15	\N	549	2024-07-31 13:48:16	2024-07-31 13:48:16
118	7	16	\N	569	2024-07-31 13:48:16	2024-07-31 13:48:16
119	7	17	\N	309	2024-07-31 13:48:16	2024-07-31 13:48:16
120	8	1	\N	299	2024-07-31 13:48:20	2024-07-31 13:48:20
121	8	2	\N	309	2024-07-31 13:48:20	2024-07-31 13:48:20
122	8	3	\N	329	2024-07-31 13:48:20	2024-07-31 13:48:20
123	8	4	\N	299	2024-07-31 13:48:20	2024-07-31 13:48:20
124	8	5	\N	289	2024-07-31 13:48:20	2024-07-31 13:48:20
125	8	6	\N	289	2024-07-31 13:48:20	2024-07-31 13:48:20
126	8	7	\N	319	2024-07-31 13:48:20	2024-07-31 13:48:20
127	8	8	\N	289	2024-07-31 13:48:20	2024-07-31 13:48:20
128	8	9	\N	299	2024-07-31 13:48:20	2024-07-31 13:48:20
129	8	10	\N	339	2024-07-31 13:48:20	2024-07-31 13:48:20
130	8	11	\N	349	2024-07-31 13:48:20	2024-07-31 13:48:20
131	8	12	\N	309	2024-07-31 13:48:20	2024-07-31 13:48:20
132	8	13	\N	569	2024-07-31 13:48:20	2024-07-31 13:48:20
133	8	14	\N	565	2024-07-31 13:48:20	2024-07-31 13:48:20
134	8	15	\N	549	2024-07-31 13:48:20	2024-07-31 13:48:20
135	8	16	\N	569	2024-07-31 13:48:20	2024-07-31 13:48:20
136	8	17	\N	309	2024-07-31 13:48:20	2024-07-31 13:48:20
138	1	17	2	350	2024-09-27 09:59:48	2024-09-27 09:59:48
139	2	17	1	256	2024-09-27 09:59:55	2024-09-27 09:59:55
140	2	17	2	350	2024-09-27 09:59:55	2024-09-27 09:59:55
141	3	17	1	256	2024-09-27 10:00:01	2024-09-27 10:00:01
142	3	17	2	350	2024-09-27 10:00:01	2024-09-27 10:00:01
143	4	17	1	256	2024-09-27 10:00:09	2024-09-27 10:00:09
144	4	17	2	350	2024-09-27 10:00:09	2024-09-27 10:00:09
145	5	17	1	256	2024-09-27 10:00:18	2024-09-27 10:00:18
146	5	17	2	350	2024-09-27 10:00:18	2024-09-27 10:00:18
147	6	17	1	256	2024-09-27 10:00:27	2024-09-27 10:00:27
148	6	17	2	350	2024-09-27 10:00:27	2024-09-27 10:00:27
149	7	17	1	256	2024-09-27 10:00:32	2024-09-27 10:00:32
150	7	17	2	350	2024-09-27 10:00:32	2024-09-27 10:00:32
151	8	17	1	256	2024-09-27 10:00:37	2024-09-27 10:00:37
152	8	17	2	350	2024-09-27 10:00:37	2024-09-27 10:00:37
153	1	17	3	208	2024-09-27 16:19:03	2024-09-27 16:19:03
154	1	18	\N	11.11	2024-09-27 16:19:03	2024-09-27 16:19:03
155	1	18	4	231.4	2024-09-27 16:19:03	2024-09-27 16:19:03
137	1	17	1	256	2024-09-27 09:59:48	2024-09-27 16:22:00
156	1	1	5	234	2024-09-27 16:53:53	2024-09-27 16:53:53
157	1	1	6	456	2024-09-27 16:53:53	2024-09-27 16:53:53
158	2	1	5	234	2024-09-27 16:55:37	2024-09-27 16:55:37
159	2	1	6	456	2024-09-27 16:55:37	2024-09-27 16:55:37
160	2	17	3	208	2024-09-27 16:55:37	2024-09-27 16:55:37
161	2	18	\N	11.11	2024-09-27 16:55:37	2024-09-27 16:55:37
162	2	18	4	231.4	2024-09-27 16:55:37	2024-09-27 16:55:37
163	4	1	5	234	2024-09-27 16:55:44	2024-09-27 16:55:44
164	4	1	6	456	2024-09-27 16:55:44	2024-09-27 16:55:44
165	4	17	3	208	2024-09-27 16:55:44	2024-09-27 16:55:44
166	4	18	\N	11.11	2024-09-27 16:55:44	2024-09-27 16:55:44
167	4	18	4	231.4	2024-09-27 16:55:44	2024-09-27 16:55:44
168	8	1	5	234	2024-09-27 16:57:28	2024-09-27 16:57:28
169	8	1	6	456	2024-09-27 16:57:28	2024-09-27 16:57:28
170	8	17	3	208	2024-09-27 16:57:28	2024-09-27 16:57:28
171	8	18	\N	11.11	2024-09-27 16:57:28	2024-09-27 16:57:28
172	8	18	4	231.4	2024-09-27 16:57:28	2024-09-27 16:57:28
173	7	1	5	234	2024-09-27 16:57:32	2024-09-27 16:57:32
174	7	1	6	456	2024-09-27 16:57:32	2024-09-27 16:57:32
175	7	17	3	208	2024-09-27 16:57:32	2024-09-27 16:57:32
176	7	18	\N	11.11	2024-09-27 16:57:32	2024-09-27 16:57:32
177	7	18	4	231.4	2024-09-27 16:57:32	2024-09-27 16:57:32
178	6	1	5	234	2024-09-27 16:57:36	2024-09-27 16:57:36
179	6	1	6	456	2024-09-27 16:57:36	2024-09-27 16:57:36
180	6	17	3	208	2024-09-27 16:57:36	2024-09-27 16:57:36
181	6	18	\N	11.11	2024-09-27 16:57:36	2024-09-27 16:57:36
182	6	18	4	231.4	2024-09-27 16:57:36	2024-09-27 16:57:36
183	5	1	5	234	2024-09-27 16:57:41	2024-09-27 16:57:41
184	5	1	6	456	2024-09-27 16:57:41	2024-09-27 16:57:41
185	5	17	3	208	2024-09-27 16:57:41	2024-09-27 16:57:41
186	5	18	\N	11.11	2024-09-27 16:57:41	2024-09-27 16:57:41
187	5	18	4	231.4	2024-09-27 16:57:41	2024-09-27 16:57:41
188	3	1	5	234	2024-09-27 16:58:03	2024-09-27 16:58:03
189	3	1	6	456	2024-09-27 16:58:03	2024-09-27 16:58:03
190	3	17	3	208	2024-09-27 16:58:03	2024-09-27 16:58:03
191	3	18	\N	11.11	2024-09-27 16:58:03	2024-09-27 16:58:03
192	3	18	4	231.4	2024-09-27 16:58:03	2024-09-27 16:58:03
\.


--
-- Data for Name: restaurant_user; Type: TABLE DATA; Schema: public; Owner: kim
--

COPY public.restaurant_user (id, restaurant_id, user_id) FROM stdin;
\.


--
-- Data for Name: restaurants; Type: TABLE DATA; Schema: public; Owner: kim
--

COPY public.restaurants (id, name, description, address, latitude, longitude, created_at, updated_at, region_id, phone, work_hours) FROM stdin;
8	Суши Ким/Покрышкина	\N	ул. Покрышкина 2/2	45.102559000000	38.970238000000	2024-07-24 11:47:01	2024-09-16 12:34:56	11	\N	"{\\"monday\\":[],\\"tuesday\\":[],\\"wednesday\\":[],\\"thursday\\":[],\\"friday\\":[],\\"saturday\\":[],\\"sunday\\":[]}"
7	Суши Ким/Новокубанск	\N	ул. Лермонтова 65/1	45.100758000000	41.050251000000	2024-07-24 11:45:05	2024-09-16 12:35:00	17	\N	"{\\"monday\\":[],\\"tuesday\\":[],\\"wednesday\\":[],\\"thursday\\":[],\\"friday\\":[],\\"saturday\\":[],\\"sunday\\":[]}"
6	Суши Ким/Павловская	\N	ул. Ленина 18а	46.135376000000	39.783563000000	2024-07-24 11:41:00	2024-09-16 12:35:05	21	\N	"{\\"monday\\":[],\\"tuesday\\":[],\\"wednesday\\":[],\\"thursday\\":[],\\"friday\\":[],\\"saturday\\":[],\\"sunday\\":[]}"
5	Суши Ким/Ленинградская	\N	ул. Кооперации 92а	46.326341000000	39.390820000000	2024-07-24 11:39:49	2024-09-16 12:35:10	13	\N	"{\\"monday\\":[],\\"tuesday\\":[],\\"wednesday\\":[],\\"thursday\\":[],\\"friday\\":[],\\"saturday\\":[],\\"sunday\\":[]}"
4	Суши Ким/Краснодар	\N	ул. Российская 267/3к1	45.092290000000	39.008407000000	2024-07-24 11:38:06	2024-09-16 12:35:19	11	\N	"{\\"monday\\":[],\\"tuesday\\":[],\\"wednesday\\":[],\\"thursday\\":[],\\"friday\\":[],\\"saturday\\":[],\\"sunday\\":[]}"
3	Суши Ким/Белореченск	\N	ул. 40 лет ВЛКСМ 79а	44.755259000000	39.874895000000	2024-07-24 11:36:44	2024-09-16 12:35:23	3	\N	"{\\"monday\\":[],\\"tuesday\\":[],\\"wednesday\\":[],\\"thursday\\":[],\\"friday\\":[],\\"saturday\\":[],\\"sunday\\":[]}"
2	Суши Ким/Краснодар	\N	Российская 267/3к1	45.092290000000	39.008407000000	2024-07-12 13:32:13	2024-09-16 12:35:31	11	\N	"{\\"monday\\":[],\\"tuesday\\":[],\\"wednesday\\":[],\\"thursday\\":[],\\"friday\\":[],\\"saturday\\":[],\\"sunday\\":[]}"
1	Суши Ким /Краснодар	\N	Ставропольская 218/1	45.019347000000	39.027236000000	2024-07-11 07:05:40	2024-09-16 12:35:35	11	\N	"{\\"monday\\":[],\\"tuesday\\":[],\\"wednesday\\":[],\\"thursday\\":[],\\"friday\\":[],\\"saturday\\":[],\\"sunday\\":[]}"
\.


--
-- Data for Name: role_has_permissions; Type: TABLE DATA; Schema: public; Owner: kim
--

COPY public.role_has_permissions (permission_id, role_id) FROM stdin;
1	1
2	1
3	1
4	1
5	1
6	1
7	1
8	1
9	1
10	1
11	1
12	1
13	1
14	1
15	1
16	1
17	1
18	1
19	1
20	1
21	1
22	1
23	1
24	1
25	1
26	1
27	1
28	1
29	1
30	1
31	1
32	1
33	1
34	1
35	1
36	1
37	1
38	1
39	1
40	1
41	1
42	1
43	1
44	1
45	1
46	1
47	1
48	1
49	1
50	1
51	1
52	1
53	1
54	1
55	1
56	1
57	1
58	1
59	1
60	1
61	1
62	1
63	1
64	1
65	1
66	1
67	1
68	1
69	1
70	1
71	1
72	1
73	1
74	1
75	1
76	1
77	1
78	1
79	1
80	1
81	1
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: kim
--

COPY public.roles (id, name, guard_name, created_at, updated_at) FROM stdin;
1	super-admin	web	2024-07-09 11:04:17	2024-07-09 11:04:17
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: kim
--

COPY public.sessions (id, user_id, ip_address, user_agent, payload, last_activity) FROM stdin;
ELmj3RpdKVmEqwKfnrUie2B8NpjXc5He1akCMbaK	\N	185.12.124.78	Mozilla/5.0 (compatible; BackupLand/1.0; https://go.backupland.com/; Domain check for viruses;)	YTozOntzOjY6Il90b2tlbiI7czo0MDoiM01RdHJZeTBjbnhtQkY5RTdBZmw0ZHc1bUNuMmJzcTFrSTNqMEMwUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTk6Imh0dHBzOi8vYWRtaW5raW0ucnUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1728032688
Vch2ueoLjrPvjFvSMvkF6DnETC05ZKFI8Dz6tmxM	\N	117.186.238.82	Custom-AsyncHttpClient	YTozOntzOjY6Il90b2tlbiI7czo0MDoiRWExT2x6Z09ZekVxVjBLVHF5eWVEeEJSVkc4ellEcHdYaWxvVXZ2cCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTQ3OiJodHRwczovLzc5LjE3NC45My4yMTMvaW5kZXgucGhwP2Z1bmN0aW9uPWNhbGxfdXNlcl9mdW5jX2FycmF5JnM9JTJGaW5kZXglMkYlNUN0aGluayU1Q2FwcCUyRmludm9rZWZ1bmN0aW9uJnZhcnMlNUIwJTVEPW1kNSZ2YXJzJTVCMSU1RCU1QjAlNUQ9SGVsbG8iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1728035851
lqt3dRYgsSW249Po7Mi5fMZSFXjNnesGJNsxVlZO	\N	157.119.40.19	Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoib2hEcE9wQzlFR1JxenhMbVpIVmhScE80aHRONjU0RUpGajBITUFWYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTk6Imh0dHBzOi8vYWRtaW5raW0ucnUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1728035962
zWFHmKkSI2N4WOTfYmxTXU6GD1cIiqpWcQU5etjC	\N	172.121.58.127	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiRG9oRmE0alBIbVd6M05Db2I5ZWFSYkZKTW9oNGFLdEhoZlVIS3FsZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTk6Imh0dHBzOi8vYWRtaW5raW0ucnUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1728040484
tJrmSii9ZddjYeJ8HxGOZTyh5Z33xNWoiv0fCKNQ	\N	138.68.180.18	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiMUhZTng4S3ZUYlZ4OGJPUG15OHdxemFaQU9wbjRQSjRicjlDY2VUciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTk6Imh0dHBzOi8vYWRtaW5raW0ucnUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1728043836
jvFQpl9yOyVdSdHLmtI7AusX4s9JaMtjND2BqyW2	\N	205.169.39.30	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.5938.132 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoia3o0WkJFOE1MUW5xWE1SdnJjQ0ZvZFNCRGZaTm5WMjdqelY0a3IwdCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vNzkuMTc0LjkzLjIxMyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1728045080
ewKJh6a0hBKXqyyEdwh9xUM3EqdwUKrCmok729se	\N	47.84.79.4	Custom-AsyncHttpClient	YTozOntzOjY6Il90b2tlbiI7czo0MDoiUURtVTJLZFp1NjBEZWVhNzluYVU3OEh2YW9tT0NEd0J0Z1BTMXJBQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTQ3OiJodHRwczovLzc5LjE3NC45My4yMTMvaW5kZXgucGhwP2Z1bmN0aW9uPWNhbGxfdXNlcl9mdW5jX2FycmF5JnM9JTJGaW5kZXglMkYlNUN0aGluayU1Q2FwcCUyRmludm9rZWZ1bmN0aW9uJnZhcnMlNUIwJTVEPW1kNSZ2YXJzJTVCMSU1RCU1QjAlNUQ9SGVsbG8iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1728054551
RPF3tOnOCbrXh1hkv7BE9kuq3dCPfOSjx5Agblyj	\N	40.118.210.19	Mozilla/5.0 zgrab/0.x	YTozOntzOjY6Il90b2tlbiI7czo0MDoiRUxCWFdFMURmdWN0QVB3MG8zNG1ZNzJrYksxWkhvN3pNUWY0cXZKUSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vNzkuMTc0LjkzLjIxMyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1728062084
9zlLMlzJTn5RZT5fj0MnVSKN5paG7HdA3cL1gm1j	\N	157.119.40.8	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.2 Safari/605.1.1517.2 Ddg/17.2	YTozOntzOjY6Il90b2tlbiI7czo0MDoiYVVlenhnTnYyZzdMMEFZOGlwMnVWU2ZlTmVYYWlZQmRmc25VUFEwcCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTk6Imh0dHBzOi8vYWRtaW5raW0ucnUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1728069591
DrXzy4b5IBWoY2JevBcUKsnrNJEfLaRqA8MUnZEp	\N	66.132.153.53		YTozOntzOjY6Il90b2tlbiI7czo0MDoib1JwSktlNTZzaUtlVzFDTUwzaGJoWmhISzBtWFQzRk1CVUZIOGtvaSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vNzkuMTc0LjkzLjIxMyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1728077032
JEm7qOungUnfwCCsxVJ0AB7JFsIgXhNEm3FwLJtE	\N	109.74.194.236	Mozilla/5.0 (Windows NT 6.1; WOW64; rv:8.0) Gecko/20100101 Firefox/8.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiWExRVXhuREc2TXFQQXgzc3JrR09DZXNmNWh4RnQwS0owZWdlSGFveCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vNzkuMTc0LjkzLjIxMyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1728030326
x9EcK9smh7WYmT0y72EkWjXIICjhUiTwX3FaVtot	\N	147.139.241.127	Custom-AsyncHttpClient	YTozOntzOjY6Il90b2tlbiI7czo0MDoiblFIOWZuQk9rTHpkd1pZNHE0NXFxd2dJYnNvTWx5NUVuR1RjdkRwRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTQ3OiJodHRwczovLzc5LjE3NC45My4yMTMvaW5kZXgucGhwP2Z1bmN0aW9uPWNhbGxfdXNlcl9mdW5jX2FycmF5JnM9JTJGaW5kZXglMkYlNUN0aGluayU1Q2FwcCUyRmludm9rZWZ1bmN0aW9uJnZhcnMlNUIwJTVEPW1kNSZ2YXJzJTVCMSU1RCU1QjAlNUQ9SGVsbG8iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1728035283
8QLpY5LnZ9cXKNnGYQJGkJPu7mklGUjXdEpDCVWV	\N	117.186.238.82	Custom-AsyncHttpClient	YTozOntzOjY6Il90b2tlbiI7czo0MDoiN3lKb1BZaHVudlVsandaaWFjR3kwdGw0OVBYc2VyVjN0Ymh4S1ZEWiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjAwOiJodHRwczovLzc5LjE3NC45My4yMTMvaW5kZXgucGhwPyUyRiUzQyUzRmVjaG8lMjhtZDUlMjglMjJoaSUyMiUyOSUyOSUzQiUzRiUzRSUyMCUyRnRtcCUyRmluZGV4MS5waHA9JmNvbmZpZy1jcmVhdGUlMjAlMkY9Jmxhbmc9Li4lMkYuLiUyRi4uJTJGLi4lMkYuLiUyRi4uJTJGLi4lMkYuLiUyRnVzciUyRmxvY2FsJTJGbGliJTJGcGhwJTJGcGVhcmNtZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1728035852
4UCKifPTvxIz9mObOaNTUoq8I8r0BI8Pqs35aP00	\N	110.172.98.2	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoibjV5ZGxzZ1dMUkdOYldlWktYeVpScDN5czlYOU1nRkFJSjIyOTZYYSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTk6Imh0dHBzOi8vYWRtaW5raW0ucnUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1728042124
OqORsIPiJQ7xUobKj1kxg9c2t7YyJ7QMyc53wvdd	\N	138.68.180.18	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiNWNabnZpQ2p1d2pma1FMQzdOa1lzdmdKc0pwUzliY0VTaDJmZFlyaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjU6Imh0dHBzOi8vYWRtaW5raW0ucnUvbG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1728043836
uVBygVzzOvAF35kbQ8SToVahxlCYo0xIk2b0I6Xn	\N	77.74.177.114	Mozilla/5.0 (Linux; arm_64; Android 12; CPH2205) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 YaBrowser/23.3.3.86.00 SA/3 Mobile Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoicEJ1MFBhckpsUm9xMGR3TTlFZVc4enZZS2lmdW5Gd1F2TW5MWjNSTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTk6Imh0dHBzOi8vYWRtaW5raW0ucnUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1728046943
wRCZWlAq1HDbrCc9GIpRHGTtBdToIb1QYAux86T6	\N	47.84.79.4	Custom-AsyncHttpClient	YTozOntzOjY6Il90b2tlbiI7czo0MDoiRWtsOGFlbkkzeXRBRXZ3STlrc1ZUTW1JNzlMbjQ2M240cHFTSGdTSSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjAwOiJodHRwczovLzc5LjE3NC45My4yMTMvaW5kZXgucGhwPyUyRiUzQyUzRmVjaG8lMjhtZDUlMjglMjJoaSUyMiUyOSUyOSUzQiUzRiUzRSUyMCUyRnRtcCUyRmluZGV4MS5waHA9JmNvbmZpZy1jcmVhdGUlMjAlMkY9Jmxhbmc9Li4lMkYuLiUyRi4uJTJGLi4lMkYuLiUyRi4uJTJGLi4lMkYuLiUyRnVzciUyRmxvY2FsJTJGbGliJTJGcGhwJTJGcGVhcmNtZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1728054553
jBFBT0W0JsLyDrt8XeBxLL3R1H2UZlzqbqtDrJAh	\N	47.74.35.211	Custom-AsyncHttpClient	YTozOntzOjY6Il90b2tlbiI7czo0MDoicFNkM0U1eXU4c1RSazVkNVRDb2RoVkdJVnVlTXFmZE9SR3daYUtuSiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTQ3OiJodHRwczovLzc5LjE3NC45My4yMTMvaW5kZXgucGhwP2Z1bmN0aW9uPWNhbGxfdXNlcl9mdW5jX2FycmF5JnM9JTJGaW5kZXglMkYlNUN0aGluayU1Q2FwcCUyRmludm9rZWZ1bmN0aW9uJnZhcnMlNUIwJTVEPW1kNSZ2YXJzJTVCMSU1RCU1QjAlNUQ9SGVsbG8iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1728062831
eWJeaWAtv8VXk5AMFg5Hewf9FwWnACMbaGbhEMN2	\N	157.119.40.8	Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiaTNkNDdveEhJVWF2bmJwY1NsRFc2ZTdLR3oxNnFrbmNrZXRwREhWcSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTk6Imh0dHBzOi8vYWRtaW5raW0ucnUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1728069592
eAHmjecLuzi9h4WuEmqXYMtDoDmfiLEVSGOMXd8H	\N	66.132.153.53	Mozilla/5.0 (compatible; CensysInspect/1.1; +https://about.censys.io/)	YTozOntzOjY6Il90b2tlbiI7czo0MDoieHNGc3N3Q2VpOFhsWm1QSUpiY1BNbkJrZHA5ck1YUHdHWHVuVVgzZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vNzkuMTc0LjkzLjIxMyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1728077035
3v0hTG15cnJu3QFOJbD0KTKG4xiOMtSYn4ZpakhH	\N	81.29.131.142	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/531.2 (KHTML, like Gecko) Chrome/53.0.820.0 Safari/531.2	YTozOntzOjY6Il90b2tlbiI7czo0MDoiclVxbmZXWmc1eUtNbnRSeUJtZU02d2dZekZxbEdheW51cDlQUTIwNCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTk6Imh0dHBzOi8vYWRtaW5raW0ucnUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1728030346
nnCW8QGXNYSBzqxt6sVWWAtHudKr1K2GkKeUc6QM	\N	147.139.241.127	Custom-AsyncHttpClient	YTozOntzOjY6Il90b2tlbiI7czo0MDoiWXo2QTZINWR6eUszTWM3SzVBeXQ4clhvbHlIV3J0NDRrNnhrU0NadyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjAwOiJodHRwczovLzc5LjE3NC45My4yMTMvaW5kZXgucGhwPyUyRiUzQyUzRmVjaG8lMjhtZDUlMjglMjJoaSUyMiUyOSUyOSUzQiUzRiUzRSUyMCUyRnRtcCUyRmluZGV4MS5waHA9JmNvbmZpZy1jcmVhdGUlMjAlMkY9Jmxhbmc9Li4lMkYuLiUyRi4uJTJGLi4lMkYuLiUyRi4uJTJGLi4lMkYuLiUyRnVzciUyRmxvY2FsJTJGbGliJTJGcGhwJTJGcGVhcmNtZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1728035284
UypBNx73A1TddgqQug4e22yDOmOnRx3HEbodeFIf	\N	117.186.238.82	Custom-AsyncHttpClient	YTozOntzOjY6Il90b2tlbiI7czo0MDoiWnBXVGJ2NmptT1dic2M4cFRCYThseFo1Sk11V0pWMUpJZXlDQTF1dSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODk6Imh0dHBzOi8vNzkuMTc0LjkzLjIxMy9pbmRleC5waHA/bGFuZz0uLiUyRi4uJTJGLi4lMkYuLiUyRi4uJTJGLi4lMkYuLiUyRi4uJTJGdG1wJTJGaW5kZXgxIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==	1728035853
SZ4dqe0Le2lkEPY0SQ8HwGYCLhZSjxqnCpUw4ynp	\N	34.31.4.246	Go-http-client/1.1	YTozOntzOjY6Il90b2tlbiI7czo0MDoieVVBM1RHNEpwVUh0RzI0ZnZBSDNoOTNUWUdsRkNwY1BvbGNLM2pkWSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTk6Imh0dHBzOi8vYWRtaW5raW0ucnUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1728032082
Yr4ZkF83dV6TsABDvtekN2ri9cLzM8glZUKJP8A2	1	85.174.199.56	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36	YTo1OntzOjY6Il90b2tlbiI7czo0MDoiYTZBNHB4YjhmVlkzRkRYOXR2MFBRRWJseVBJTVBTY0NMZnhtQmlZSyI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjQwOiJodHRwczovL2FkbWlua2ltLnJ1L2FkbWluX3BhbmVsL3ByZXNlbnRzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTt9	1728041778
VXtkQH7hD3d8TZFGMYmBZ9LcwnPBVIvcjy4DZcQW	\N	31.134.204.36	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiWWx1V25TS2Zta3pONzR5WkRmNzNrc3Q4c1Y2Sks0ZXdqSW9adHBIbyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vNzkuMTc0LjkzLjIxMyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1728043601
3u86qkJhKyFgIMk8yJ3SKGMJ7yfGlnwui28jtqZM	\N	34.122.147.229	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/92.0.4515.159 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiaFlHTnlRTWJOYXdhdU11Tm9sZFRjOEt3cTF0ZWw5dkpKYzdCUTM5ZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vNzkuMTc0LjkzLjIxMyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1728044907
uHHK5QCbNX2DW36eZacm1BFzEPVDHZdAguSHb3D2	\N	212.33.255.53	Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:109.0) Gecko/20100101 Firefox/113.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiRE9mN0FBMGxHSnF2MTNJVXp2WExHcFl2OHNnR1FLbTJPNjdwUnpjTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTk6Imh0dHBzOi8vYWRtaW5raW0ucnUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1728048245
JEAwLvrVbEUwvZU9GDk7B821EV12Mp8VgWyMI3Gp	\N	47.84.79.4	Custom-AsyncHttpClient	YTozOntzOjY6Il90b2tlbiI7czo0MDoiWnppMGRET0p6b0hqVnRLVHlGUE5QRVRwRmpFUzQwRzlNY1lMcWUyYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODk6Imh0dHBzOi8vNzkuMTc0LjkzLjIxMy9pbmRleC5waHA/bGFuZz0uLiUyRi4uJTJGLi4lMkYuLiUyRi4uJTJGLi4lMkYuLiUyRi4uJTJGdG1wJTJGaW5kZXgxIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==	1728054555
HTCH42WWxV86g0IxeNdTxtzqpHnrj9PLTecCw87x	\N	47.74.35.211	Custom-AsyncHttpClient	YTozOntzOjY6Il90b2tlbiI7czo0MDoidWRHZ09xSncyR0VZTUZzTjM5eE9BZVZtU0N4eG9jV1p6elNnN1JhbSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjAwOiJodHRwczovLzc5LjE3NC45My4yMTMvaW5kZXgucGhwPyUyRiUzQyUzRmVjaG8lMjhtZDUlMjglMjJoaSUyMiUyOSUyOSUzQiUzRiUzRSUyMCUyRnRtcCUyRmluZGV4MS5waHA9JmNvbmZpZy1jcmVhdGUlMjAlMkY9Jmxhbmc9Li4lMkYuLiUyRi4uJTJGLi4lMkYuLiUyRi4uJTJGLi4lMkYuLiUyRnVzciUyRmxvY2FsJTJGbGliJTJGcGhwJTJGcGVhcmNtZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1728062832
L5aY5cBlBweSkmr39WbNGiXIXuzSmAg4AgHwOFHV	\N	185.146.112.45	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoid1NvdEVzbExRMTZDR0FGNE5IQnJVSzBDOHBEQkhwZjQzNFF2ZnIxWiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjU6Imh0dHBzOi8vYWRtaW5raW0ucnUvbG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1728071344
lbk1nn5xH4kXL3LqGWWbwAoorh0y9u4KYdg09oCa	\N	147.139.241.127	Custom-AsyncHttpClient	YTozOntzOjY6Il90b2tlbiI7czo0MDoiNW4welZiYTl5NTIzQnBtY0VjdHBSenFQQlN1b1A3QThVUEdGYTNTcSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODk6Imh0dHBzOi8vNzkuMTc0LjkzLjIxMy9pbmRleC5waHA/bGFuZz0uLiUyRi4uJTJGLi4lMkYuLiUyRi4uJTJGLi4lMkYuLiUyRi4uJTJGdG1wJTJGaW5kZXgxIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==	1728035285
COiHiIgdLGxygl7IUZp9lyoUbbGVMiAi53ie3aL5	\N	157.119.40.19	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_2) AppleWebKit/606.1.36 (KHTML, like Gecko) Version/9.1.2 Safari/606.1.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiY1pnTXAxNzhkbjBBRUNHMTVBNWVHU2M5Y2Y0aHNRQ2RuVU8wWHFBTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTk6Imh0dHBzOi8vYWRtaW5raW0ucnUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1728035961
2eIAV1OrPSDklWrQVCeym5UCF3IoMWCz8qcboeY4	\N	185.27.192.167	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoic1RFYmJrZFJ0a1NlcTZ4THc2SUhORENyblplN0F4VEp2SDRRcEtmcCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTk6Imh0dHBzOi8vYWRtaW5raW0ucnUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1728038283
bUL0Wq7qCAsuYFiUbnsPF1Bg2Yg3GjKBWorL3ejF	\N	185.27.192.167	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoibTZ2NTV6dUp0MDFDSVJndEZ1d1IxWGxnSlo1QjlrYlVLdWIzZXpMViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTk6Imh0dHBzOi8vYWRtaW5raW0ucnUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1728043822
rKrBLiw0JCE4XKpjnpsxi7sIcuVD4wRTRmVjPjjz	\N	45.84.89.2	Mozilla/6.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Inspici (www.inspici.com)	YTozOntzOjY6Il90b2tlbiI7czo0MDoia1JyUnBHUWwxVVlCb09UUWV3OXU1ZGg0dlRVYmwxalp5ekhVMUhjUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vNzkuMTc0LjkzLjIxMyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1728053957
Im12egK5uCswmbjrP2J3wK4fh31AO4ii35ssCoIC	\N	54.87.240.241	python-requests/2.32.3	YTozOntzOjY6Il90b2tlbiI7czo0MDoiRG51THZLSkxhdDg0ZUpsRk0ySzBVS0dDVDRZWWhrQ21QclllYVJ1NSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTk6Imh0dHBzOi8vYWRtaW5raW0ucnUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1728056215
ctObNQNWlXPLoNsUdzHuEEHNevfHh5r4XCiTDDt4	\N	47.74.35.211	Custom-AsyncHttpClient	YTozOntzOjY6Il90b2tlbiI7czo0MDoiUGVsZms3MU9uUHVIY2lDRG5Uc09tZGVpTzJRNDBZNTI2ZnM2N2JiWiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODk6Imh0dHBzOi8vNzkuMTc0LjkzLjIxMy9pbmRleC5waHA/bGFuZz0uLiUyRi4uJTJGLi4lMkYuLiUyRi4uJTJGLi4lMkYuLiUyRi4uJTJGdG1wJTJGaW5kZXgxIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==	1728062833
4ynTDURPFszp4Jl3CLiEu6lIHI1Qlcmlgmet4tDD	\N	3.80.161.175	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiQUJvd05uZElxbkJQU3NIWmxPVEx1VGM0QzdmVzRnQ0NoTzhEWjgzTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTk6Imh0dHBzOi8vYWRtaW5raW0ucnUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1728075764
at0sIdTMh4fJwAzkTvVqavRN29K6Zs2xgql6oDJ2	\N	124.220.161.119	Mozilla/5.0 (Linux; Android 10; LIO-AN00 Build/HUAWEILIO-AN00; wv) MicroMessenger Weixin QQ AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/78.0.3904.62 XWEB/2692 MMWEBSDK/200901 Mobile Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiSkpaeGlGZXUyTWNXREhBSG5LSmt2UmVJbk92V3lQV3lSeUZPRVMyciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTk6Imh0dHBzOi8vYWRtaW5raW0ucnUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1728029348
\.


--
-- Data for Name: stories; Type: TABLE DATA; Schema: public; Owner: kim
--

COPY public.stories (id, button_text, storyable_type, storyable_type_id, story_category_id, tag, created_at, updated_at) FROM stdin;
1	На пиццу	App\\Models\\Dish\\Menu	17	1	Скидка 20%	2024-09-23 10:51:12	2024-09-23 10:51:12
2	На ролы	App\\Models\\Dish\\Menu	13	2	Скидка 20%	2024-09-23 10:54:27	2024-09-23 10:54:27
3	Сет	App\\Models\\Dish\\Menu	14	2	Скидка 20%	2024-09-23 10:55:19	2024-09-23 10:55:19
4	Напиток	App\\Models\\Dish\\Menu	2	1	Скидка 20%	2024-09-23 10:55:55	2024-09-23 10:55:55
\.


--
-- Data for Name: story_categories; Type: TABLE DATA; Schema: public; Owner: kim
--

COPY public.story_categories (id, name, tag, "order", created_at, updated_at) FROM stdin;
1	Пицца	Скидка 20%	1	2024-09-23 10:50:57	2024-09-23 10:50:57
2	Суши	Скидка 20%	2	2024-09-23 10:54:00	2024-09-23 10:54:00
\.


--
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: kim
--

COPY public.tags (id, name, color, "position", icon, created_at, updated_at) FROM stdin;
1	Хит	#FF0000	top_start	\N	2024-07-09 11:04:18	2024-07-09 11:04:18
2	Острый	#FF0000	bottom_end	https://adminkim.ru/Icon_Pepper.png	2024-07-09 11:04:18	2024-07-23 19:56:48
\.


--
-- Data for Name: two_factor_auth_telegrams; Type: TABLE DATA; Schema: public; Owner: kim
--

COPY public.two_factor_auth_telegrams (id, username, first_name, code, chat_id, update_id, created_at, updated_at, uuid) FROM stdin;
9cf73fad-b88f-424e-9879-ea8e9dcf3799	suleyman_g	Solomon	7141	885434922	97603959	2024-09-09 07:49:52	2024-09-09 07:49:52	2cfb7a94-f67a-48db-b82b-b19b42e865cf
9cf742b0-b1e2-4c0c-af9a-01e45c14ff80	suleyman_g	Solomon	9347	885434922	97603960	2024-09-09 07:58:17	2024-09-09 07:58:17	56d8dc0a-cf59-41ae-837a-45c908ed28a9
9d201f90-c53b-467a-99b3-b96e546b387b	farid_023	Farid	5806	863756819	97603971	2024-09-29 15:29:00	2024-09-29 15:29:00	782907d6-fcf2-4ba1-972b-c18fe5de8238
9cfdb9b9-3bb7-42b9-8b1a-4cc6120e81a5	farid_023	Farid	2304	863756819	97603968	2024-09-12 13:06:05	2024-09-12 13:06:05	20254b2d-909c-46c6-98de-887b6ada2221
9d0a988c-ae16-405c-b58b-b89aa61e496b	farid_023	Farid	7937	863756819	97603970	2024-09-18 22:39:05	2024-09-18 22:39:05	3284b9e4-c418-41d1-96e2-7976520a457a
9cfa175b-ebb4-4b93-92c2-37529269fc26	farid_023	Farid	7674	863756819	97603967	2024-09-10 17:44:36	2024-09-10 17:44:36	fb39db2f-d1b9-4e9c-9bb5-224379ec5bfe
9cf777f0-6e3b-4c44-97a8-916e3b12c038	farid_023	Farid	7943	863756819	97603961	2024-09-09 10:27:11	2024-09-09 10:27:11	1fbfaf74-d577-4a83-b3f0-aaf931d8e3ff
9cf89ec6-a0c5-4396-9b2b-e30fea9e1e8d	farid_023	Farid	8083	863756819	97603963	2024-09-10 00:11:36	2024-09-10 00:11:36	8da49864-aad6-4a6c-a34e-ab1f0479d4c3
9cf7a2c4-e110-47d7-b788-f4d83d634e32	farid_023	Farid	6858	863756819	97603962	2024-09-09 12:26:56	2024-09-09 12:26:56	388a20a4-8901-47c2-a1a1-6f78717135f8
9cf8ace6-55c2-4c84-9fa3-2088eb07bb3d	farid_023	Farid	1390	863756819	97603966	2024-09-10 00:51:05	2024-09-10 00:51:05	7b31f13b-b347-464c-a2d0-e4d41b84b55c
9cf89ef3-b772-42b2-be95-e8c936f0a280	farid_023	Farid	5106	863756819	97603964	2024-09-10 00:12:05	2024-09-10 00:12:05	33eb6128-50e7-4ced-a6e4-c453300d42bb
9cf89f76-43ef-4861-b43c-a7fd1e94e67b	farid_023	Farid	3406	863756819	97603965	2024-09-10 00:13:31	2024-09-10 00:13:31	b2d5d0f3-f7cb-4ba9-a344-67137faa4024
\.


--
-- Data for Name: two_factor_auths; Type: TABLE DATA; Schema: public; Owner: kim
--

COPY public.two_factor_auths (id, phone_number, code, created_at, updated_at) FROM stdin;
9c88e1b3-733a-4840-8c72-8fea7912b017	+7xxxxxxxxxx	7208	2024-07-16 08:06:01	2024-07-16 08:06:01
9c88f74d-58d9-431d-ac1c-5d484f340f3c	7+	9089	2024-07-16 09:06:25	2024-07-16 09:06:25
9c8bc78b-f05a-45ad-84b8-bc8e66a26ea3	+79991246212	1543	2024-07-17 18:40:22	2024-07-17 18:40:22
9c955aa7-0b74-47fb-948d-2b48fe25fa89	+70000000000	1111	2024-07-22 12:54:09	2024-07-22 12:54:09
9c99ee0c-6312-438a-8249-77420f217987	+70000000000	1111	2024-07-24 22:29:37	2024-07-24 22:29:37
9c9a3e04-3e58-4faa-af70-8d29c109a6db	+70000000000	1111	2024-07-25 02:13:13	2024-07-25 02:13:13
9cd5d43d-88d3-4415-9f39-6b5d47b75b61	+79513938907	9117	2024-08-23 17:07:07	2024-08-23 17:07:07
9cdb8a8b-d24f-4a6e-83f6-28fcc1dc2120	+79215756572	1850	2024-08-26 13:16:01	2024-08-26 13:16:01
9ce9b2e6-3b61-4a55-95ed-e06d0a7961a8	+7xxxxxxxxxx	8987	2024-09-02 14:10:27	2024-09-02 14:10:27
9cefe9c8-44fe-4e64-98ce-393c3cd94898	+70000000000	1111	2024-09-05 16:18:53	2024-09-05 16:18:53
9cf41b1c-cc03-43af-adae-31f29039202f	+7xxxxxxxxxx	4557	2024-09-07 18:20:08	2024-09-07 18:20:08
9cf41b78-99bd-47fa-ae9b-92c1f8fc68fb	+994504635533	2341	2024-09-07 18:21:08	2024-09-07 18:21:08
9cf42cca-aa3c-458c-a8b4-23c5bf7bb89b	+994504635533	6513	2024-09-07 19:09:34	2024-09-07 19:09:34
9d28908f-9437-48f6-b6f5-c343617e2722	+71111111111	8031	2024-10-03 20:11:35	2024-10-03 20:11:35
9cf4507e-f188-4254-8be6-67aa3e2fcb05	+74444444444	2018	2024-09-07 20:49:24	2024-09-07 20:49:24
9cf5ef92-6c6f-4b69-af4a-bb8e022630d3	+70000000000	1111	2024-09-08 16:10:02	2024-09-08 16:10:02
9cf7cd4f-9185-4c68-bfdd-aa0a0a454a7a	+75555555555	3049	2024-09-09 14:25:53	2024-09-09 14:25:53
9d28be88-a29e-4b93-ab91-159723032ca6	+7xxxxxxxxxx	9446	2024-10-03 22:20:08	2024-10-03 22:20:08
9cf820de-5ad8-4e90-9330-4d010f31f60c	+79999999999	4727	2024-09-09 18:19:32	2024-09-09 18:19:32
9cf82393-5bc9-4c1e-ad64-19f9fbc0dce7	+71111111111	5003	2024-09-09 18:27:06	2024-09-09 18:27:06
9cf82487-d54a-4384-8940-720331427426	+71111111112	2658	2024-09-09 18:29:47	2024-09-09 18:29:47
9cf825c3-ad1a-4bed-93a7-59414dc16f5a	+994504635533	2913	2024-09-09 18:33:14	2024-09-09 18:33:14
9cf82ace-39a8-4d2f-ab7d-e74c5f953add	+71111111113	5444	2024-09-09 18:47:19	2024-09-09 18:47:19
9cf82d87-33a2-43c0-9fa6-f05ae73c37fb	+70000000000	1111	2024-09-09 18:54:56	2024-09-09 18:54:56
9cf83403-0333-4efe-aab8-57a4c38b631c	+994504635533	5867	2024-09-09 19:13:04	2024-09-09 19:13:04
9cf83ec5-8f7d-4c73-9b45-63dc6bc8c3af	+79999999999	6360	2024-09-09 19:43:09	2024-09-09 19:43:09
9cf87303-4fa0-455d-9376-b988d3ff29f6	+70000000000	1111	2024-09-09 22:09:14	2024-09-09 22:09:14
9cf89c52-bea9-4f85-b322-896a6bf5dabb	+79999999999	4594	2024-09-10 00:04:44	2024-09-10 00:04:44
9cf89eaf-36b3-4d98-885d-2238cde385ce	+70000000000	1111	2024-09-10 00:11:21	2024-09-10 00:11:21
9cf8ac77-d36f-49a8-a71b-90d3dd9d00df	+70000000000	1111	2024-09-10 00:49:53	2024-09-10 00:49:53
9cf94305-c5dd-4d2e-bbed-f7217c6ce107	+70000000000	1111	2024-09-10 07:50:52	2024-09-10 07:50:52
9cf9e05c-3839-47a4-b394-08c4cc28cf27	+79999999999	1742	2024-09-10 15:10:49	2024-09-10 15:10:49
9cf9ea36-0ad3-4bca-9505-49aef3560fbe	+78888888888	8773	2024-09-10 15:38:22	2024-09-10 15:38:22
9cf9ee6d-378e-4077-9b75-433e68a062fa	+70000000000	1111	2024-09-10 15:50:09	2024-09-10 15:50:09
9cf9eea8-48a9-4813-9d39-3785cd21f974	+70000000001	1111	2024-09-10 15:50:47	2024-09-10 15:50:47
9cf9f099-c192-47a6-8bd9-a5a3ba9483a1	+74444444444	4261	2024-09-10 15:56:13	2024-09-10 15:56:13
9cf9f5e9-e3c0-46d1-9fb2-921e99d217b3	+71111111111	8788	2024-09-10 16:11:05	2024-09-10 16:11:05
9cfa1735-e7ac-4d9e-b993-399176c37314	+70000000000	1111	2024-09-10 17:44:11	2024-09-10 17:44:11
9cfc28d2-ddb9-4e19-9737-38e71a5735b5	+71111111111	8020	2024-09-11 18:25:05	2024-09-11 18:25:05
9cfc2a63-37ac-4b22-ac14-7e30fc874957	+70000000000	1111	2024-09-11 18:29:28	2024-09-11 18:29:28
9cfc2a79-77bf-43ba-a078-86c0bc034c62	+70000000003	7412	2024-09-11 18:29:42	2024-09-11 18:29:42
\.


--
-- Data for Name: user_points; Type: TABLE DATA; Schema: public; Owner: kim
--

COPY public.user_points (id, user_id, latitude, longitude, name, entrance, floor, apartment, door_code, comment, type, area_id, created_at, updated_at) FROM stdin;
1	\N	45.0268970000	39.0695100000	Краснодарский край муниципальное образование Краснодар Краснодар 	\N	\N	\N	\N	\N	main	1	2024-07-28 13:08:18	2024-07-28 13:08:18
2	\N	45.0268970000	39.0695100000	Краснодарский край муниципальное образование Краснодар Краснодар 	\N	\N	\N	\N	\N	main	1	2024-07-28 13:08:22	2024-07-28 13:08:22
3	\N	45.0274440000	39.0689530000	Краснодарский край муниципальное образование Краснодар Краснодар 	\N	\N	\N	\N	\N	main	1	2024-07-28 13:09:24	2024-07-28 13:09:24
4	\N	45.0274440000	39.0689530000	Краснодарский край муниципальное образование Краснодар Краснодар 	\N	\N	\N	\N	\N	main	1	2024-07-28 13:09:47	2024-07-28 13:09:47
5	\N	45.0274440000	39.0689530000	Краснодарский край муниципальное образование Краснодар Краснодар 	\N	\N	\N	\N	\N	main	1	2024-07-28 13:10:28	2024-07-28 13:10:28
6	\N	45.0268970000	39.0695100000	Краснодарский край муниципальное образование Краснодар Краснодар 	\N	\N	\N	\N	\N	main	1	2024-07-31 13:41:27	2024-07-31 13:41:27
7	\N	45.0260680000	39.0682440000	Краснодарский край муниципальное образование Краснодар Краснодар 	1	1	1	2	Позвоните перед приездом	main	1	2024-09-09 07:29:49	2024-09-09 07:29:49
8	\N	45.0272530000	39.0684590000	Краснодарский край муниципальное образование Краснодар Краснодар 	\N	\N	\N	\N	\N	main	1	2024-09-17 14:50:38	2024-09-17 14:50:38
9	\N	45.0251960000	39.0697620000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-17 14:53:39	2024-09-17 14:53:39
10	\N	45.0251960000	39.0697620000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-17 14:57:46	2024-09-17 14:57:46
11	\N	45.0251960000	39.0697620000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-17 14:58:01	2024-09-17 14:58:01
12	\N	45.0251960000	39.0697620000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-17 15:15:21	2024-09-17 15:15:21
13	\N	45.0251960000	39.0697620000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-17 15:16:59	2024-09-17 15:16:59
14	\N	45.0251960000	39.0697620000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-17 15:17:14	2024-09-17 15:17:14
15	\N	45.0251960000	39.0697620000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-17 15:17:51	2024-09-17 15:17:51
16	\N	45.0251960000	39.0697620000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-17 15:18:07	2024-09-17 15:18:07
17	\N	45.0251960000	39.0697620000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-17 15:19:20	2024-09-17 15:19:20
18	\N	45.0251960000	39.0697620000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-17 15:19:42	2024-09-17 15:19:42
19	\N	45.0251960000	39.0697620000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-17 15:37:01	2024-09-17 15:37:01
20	\N	45.0251960000	39.0697620000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-17 15:41:07	2024-09-17 15:41:07
21	\N	45.0251960000	39.0697620000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-17 15:43:10	2024-09-17 15:43:10
22	\N	45.0251960000	39.0697620000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-17 15:48:22	2024-09-17 15:48:22
23	\N	45.0251960000	39.0697620000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-17 17:04:46	2024-09-17 17:04:46
24	\N	45.0251960000	39.0697620000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-17 17:07:08	2024-09-17 17:07:08
25	\N	45.0251960000	39.0697620000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-17 17:12:28	2024-09-17 17:12:28
26	\N	45.0251960000	39.0697620000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-17 17:20:29	2024-09-17 17:20:29
27	\N	45.0251960000	39.0697620000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-17 17:23:53	2024-09-17 17:23:53
28	\N	45.0251960000	39.0697620000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-17 17:28:33	2024-09-17 17:28:33
29	\N	45.0251960000	39.0697620000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-17 17:34:50	2024-09-17 17:34:50
30	\N	45.0251960000	39.0697620000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-17 19:01:46	2024-09-17 19:01:46
31	\N	45.0251960000	39.0697620000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-17 19:03:03	2024-09-17 19:03:03
32	\N	45.0251960000	39.0697620000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-17 20:27:12	2024-09-17 20:27:12
33	\N	45.0251960000	39.0697620000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-17 20:37:42	2024-09-17 20:37:42
34	\N	45.0251960000	39.0697620000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-17 20:44:45	2024-09-17 20:44:45
35	\N	45.0251960000	39.0697620000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-17 21:53:55	2024-09-17 21:53:55
36	\N	45.0251960000	39.0697620000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-17 21:54:30	2024-09-17 21:54:30
37	\N	45.0251960000	39.0697620000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-17 21:55:14	2024-09-17 21:55:14
38	\N	45.0251960000	39.0697620000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-17 21:56:18	2024-09-17 21:56:18
39	\N	45.0251960000	39.0697620000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-17 22:30:22	2024-09-17 22:30:22
40	\N	45.0251960000	39.0697620000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-17 22:30:52	2024-09-17 22:30:52
41	\N	45.0251960000	39.0697620000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-17 22:37:15	2024-09-17 22:37:15
42	\N	45.0251960000	39.0697620000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-17 22:38:36	2024-09-17 22:38:36
43	\N	45.0251960000	39.0697620000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-17 22:57:46	2024-09-17 22:57:46
44	\N	45.0251960000	39.0697620000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-17 22:58:35	2024-09-17 22:58:35
45	\N	45.0251960000	39.0697620000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-17 22:59:38	2024-09-17 22:59:38
46	\N	45.0251960000	39.0697620000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-17 23:00:30	2024-09-17 23:00:30
47	\N	45.0251960000	39.0697620000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-17 23:01:06	2024-09-17 23:01:06
48	\N	45.0251960000	39.0697620000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-17 23:01:20	2024-09-17 23:01:20
49	\N	45.0251960000	39.0697620000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-17 23:02:52	2024-09-17 23:02:52
50	\N	45.0251960000	39.0697620000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-17 23:03:33	2024-09-17 23:03:33
51	\N	45.0251960000	39.0697620000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-17 23:06:57	2024-09-17 23:06:57
52	\N	45.0251960000	39.0697620000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-17 23:09:36	2024-09-17 23:09:36
53	\N	45.0251960000	39.0697620000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-17 23:09:54	2024-09-17 23:09:54
54	\N	45.0251960000	39.0697620000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-17 23:12:52	2024-09-17 23:12:52
55	\N	45.0251960000	39.0697620000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-17 23:17:34	2024-09-17 23:17:34
56	\N	45.0251960000	39.0697620000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-17 23:18:27	2024-09-17 23:18:27
57	\N	45.0251960000	39.0697620000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-18 09:45:27	2024-09-18 09:45:27
58	\N	45.0251960000	39.0697620000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-18 09:54:25	2024-09-18 09:54:25
59	\N	45.0251960000	39.0697620000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-18 10:13:10	2024-09-18 10:13:10
60	\N	45.0251960000	39.0697620000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-18 10:20:59	2024-09-18 10:20:59
61	\N	45.0251960000	39.0697620000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-18 10:40:35	2024-09-18 10:40:35
62	\N	45.0251960000	39.0697620000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-18 10:41:56	2024-09-18 10:41:56
63	\N	45.0251960000	39.0697620000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-18 10:42:36	2024-09-18 10:42:36
64	\N	45.0251960000	39.0697620000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-18 10:45:29	2024-09-18 10:45:29
65	\N	45.0251960000	39.0697620000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-18 10:46:31	2024-09-18 10:46:31
66	\N	45.0251960000	39.0697620000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-18 10:49:11	2024-09-18 10:49:11
67	\N	45.0251960000	39.0697620000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-18 10:50:16	2024-09-18 10:50:16
68	\N	45.0251960000	39.0697620000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-18 10:54:27	2024-09-18 10:54:27
69	\N	45.0251960000	39.0697620000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-18 10:55:30	2024-09-18 10:55:30
70	\N	45.0251960000	39.0697620000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-18 10:56:41	2024-09-18 10:56:41
71	\N	45.0251960000	39.0697620000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-18 11:00:33	2024-09-18 11:00:33
72	\N	45.0251960000	39.0697620000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	1	1	1	1111111111	Test	main	1	2024-09-18 11:00:39	2024-09-18 11:00:39
73	\N	45.0251960000	39.0697620000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	1	1	1	1111111111	Test	main	1	2024-09-18 11:13:17	2024-09-18 11:13:17
74	\N	45.0251960000	39.0697620000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-18 11:21:09	2024-09-18 11:21:09
75	\N	45.0251960000	39.0697620000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-18 11:22:35	2024-09-18 11:22:35
76	\N	45.0251960000	39.0697620000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-18 11:22:40	2024-09-18 11:22:40
77	\N	45.0251960000	39.0697620000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-18 11:23:11	2024-09-18 11:23:11
78	\N	45.0251960000	39.0697620000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-18 11:23:55	2024-09-18 11:23:55
79	\N	45.0251960000	39.0697620000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-18 11:24:22	2024-09-18 11:24:22
80	\N	45.0251960000	39.0697620000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-18 11:24:51	2024-09-18 11:24:51
81	\N	45.0251960000	39.0697620000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-18 11:34:08	2024-09-18 11:34:08
82	\N	45.0251960000	39.0697620000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-18 11:34:19	2024-09-18 11:34:19
83	\N	45.0251960000	39.0697620000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-18 11:35:30	2024-09-18 11:35:30
84	\N	45.0251960000	39.0697620000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-18 11:35:46	2024-09-18 11:35:46
85	\N	45.0251960000	39.0697620000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-18 11:37:06	2024-09-18 11:37:06
86	\N	45.0251960000	39.0697620000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-18 11:37:17	2024-09-18 11:37:17
87	\N	45.0251960000	39.0697620000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-18 11:40:54	2024-09-18 11:40:54
88	\N	45.0251960000	39.0697620000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-18 11:41:53	2024-09-18 11:41:53
89	\N	45.0251960000	39.0697620000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-18 11:42:57	2024-09-18 11:42:57
90	\N	45.0251960000	39.0697620000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-18 12:35:10	2024-09-18 12:35:10
91	\N	45.0251960000	39.0697620000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-18 12:40:51	2024-09-18 12:40:51
92	3	45.0255400000	39.0706150000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	твов	554	8585	аттв	волалалалв	main	1	2024-09-18 12:41:29	2024-09-18 12:41:29
93	3	45.0255400000	39.0706150000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	тстьс	95989	8889	ичтчт	тчтчт	main	1	2024-09-18 12:43:16	2024-09-18 12:43:16
94	3	45.0255400000	39.0706150000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	bdbd	98989	9898	xbbx	xbbxbd	main	1	2024-09-18 12:49:09	2024-09-18 12:49:09
95	3	45.0255400000	39.0706150000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-19 15:27:32	2024-09-19 15:27:32
96	3	45.0255400000	39.0706150000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-19 15:29:55	2024-09-19 15:29:55
97	3	45.0255400000	39.0706150000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-19 15:43:04	2024-09-19 15:43:04
98	3	45.0255400000	39.0706150000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-19 15:49:01	2024-09-19 15:49:01
99	3	45.0255400000	39.0706150000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	3	7	129	5	тест коммент	main	1	2024-09-19 16:03:42	2024-09-19 16:03:42
100	3	45.0255400000	39.0706150000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-19 16:22:57	2024-09-19 16:22:57
101	3	45.0255400000	39.0706150000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-19 16:23:12	2024-09-19 16:23:12
102	3	45.0255400000	39.0706150000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-19 16:23:13	2024-09-19 16:23:13
103	3	45.0255400000	39.0706150000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-19 16:23:44	2024-09-19 16:23:44
104	3	45.0255400000	39.0706150000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-19 16:23:44	2024-09-19 16:23:44
105	3	45.0255400000	39.0706150000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-19 16:23:45	2024-09-19 16:23:45
106	3	45.0255400000	39.0706150000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-19 16:23:46	2024-09-19 16:23:46
107	3	45.0255400000	39.0706150000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-19 16:23:46	2024-09-19 16:23:46
108	3	45.0255400000	39.0706150000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-19 16:23:46	2024-09-19 16:23:46
109	3	45.0255400000	39.0706150000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-19 16:23:47	2024-09-19 16:23:47
110	3	45.0255400000	39.0706150000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-19 16:23:47	2024-09-19 16:23:47
111	3	45.0255400000	39.0706150000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-19 16:23:47	2024-09-19 16:23:47
112	3	45.0255400000	39.0706150000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-19 16:23:47	2024-09-19 16:23:47
113	3	45.0255400000	39.0706150000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-19 16:23:47	2024-09-19 16:23:47
114	3	45.0255400000	39.0706150000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-19 16:23:47	2024-09-19 16:23:47
115	3	45.0255400000	39.0706150000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-19 16:23:48	2024-09-19 16:23:48
116	3	45.0255400000	39.0706150000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-19 16:23:48	2024-09-19 16:23:48
117	3	45.0255400000	39.0706150000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-19 16:23:48	2024-09-19 16:23:48
118	3	45.0255400000	39.0706150000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-19 16:23:48	2024-09-19 16:23:48
119	3	45.0255400000	39.0706150000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-19 16:23:48	2024-09-19 16:23:48
120	3	45.0255400000	39.0706150000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-19 16:23:48	2024-09-19 16:23:48
121	3	45.0255400000	39.0706150000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-19 16:23:48	2024-09-19 16:23:48
122	3	45.0255400000	39.0706150000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-19 16:23:48	2024-09-19 16:23:48
123	3	45.0255400000	39.0706150000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-19 16:23:49	2024-09-19 16:23:49
124	\N	45.0251960000	39.0697620000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-20 12:04:42	2024-09-20 12:04:42
125	\N	45.0251960000	39.0697620000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-20 16:59:53	2024-09-20 16:59:53
126	\N	45.0251960000	39.0697620000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-20 17:00:40	2024-09-20 17:00:40
127	\N	45.0251960000	39.0697620000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-20 17:02:18	2024-09-20 17:02:18
128	\N	45.0251960000	39.0697620000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-20 17:02:30	2024-09-20 17:02:30
129	\N	45.0251960000	39.0697620000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-20 17:03:01	2024-09-20 17:03:01
130	\N	45.0251960000	39.0697620000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-20 17:03:27	2024-09-20 17:03:27
131	\N	45.0251960000	39.0697620000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-20 17:03:45	2024-09-20 17:03:45
132	\N	45.0251960000	39.0697620000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-20 17:21:22	2024-09-20 17:21:22
133	\N	45.0251960000	39.0697620000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-20 17:25:19	2024-09-20 17:25:19
134	\N	45.0251960000	39.0697620000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-20 17:33:20	2024-09-20 17:33:20
135	\N	45.0251960000	39.0697620000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-20 17:39:13	2024-09-20 17:39:13
136	\N	45.0251960000	39.0697620000	Краснодарский край муниципальное образование Краснодар Краснодар Сормовская улица	\N	\N	\N	\N	\N	main	1	2024-09-20 17:39:24	2024-09-20 17:39:24
\.


--
-- Data for Name: user_statuses; Type: TABLE DATA; Schema: public; Owner: kim
--

COPY public.user_statuses (id, name, "order", cashback_percentage, validity_day, created_at, updated_at) FROM stdin;
1	Бронза	1	1	30	2024-08-28 15:00:47	2024-08-28 15:00:47
2	Серебро	2	2	30	2024-08-29 18:33:57	2024-08-29 18:33:57
3	Золотой	3	3	90	2024-08-30 11:24:46	2024-08-30 11:24:46
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: kim
--

COPY public.users (id, name, phone_number, email, email_verified_at, password, birth_day, telegram_user_name, chat_id, push_notification, remember_token, created_at, updated_at) FROM stdin;
1	Admin	\N	admin@gmail.com	\N	$2y$12$RBrIlumUJyjjoQ0Zm9oeUe08jS7jAGzau9XTlpLyvlPrwuzRdO8d.	\N	\N	\N	t	YpNsGc1e6c9cQ8iUJ7Pv6z7osCH1sE0djRI7ScuGSPJG4BLjLGUs12Hs9VXa	2024-07-09 11:04:18	2024-07-09 11:04:18
2	\N	+7xxxxxxxxxx	\N	\N	$2y$12$uGTSAYJbj93o4r2KQMPFRe4OwSLgQ0Mgvjr.Pi79T10C5Jiwd.hG.	\N	\N	\N	t	\N	2024-07-16 08:06:01	2024-07-16 08:06:01
4	\N	7+	\N	\N	$2y$12$DXg2.M4FcVdnyp670AhEn.ZAv2xw.fc7Rl2q6wO6EWkRcSpJdWdUS	\N	\N	\N	t	\N	2024-07-16 09:06:25	2024-07-16 09:06:25
5	\N	+79991246212	\N	\N	$2y$12$eCnwlYohy5VVq.jk9kVz1OpJ6rnyEZ8znzheEo0e5qUK.xncltJHC	\N	\N	\N	t	\N	2024-07-17 18:40:22	2024-07-17 18:40:22
6	\N	+79513938907	\N	\N	$2y$12$lMOh7SHbaBtsbokbR788NeNxGGrFhF5vKJQCAaBGfiFc/xqCDLNUi	\N	\N	\N	t	\N	2024-08-23 17:07:07	2024-08-23 17:07:07
7	\N	+79215756572	\N	\N	$2y$12$gTOwTLVPVeikWdPtC8N5EuVgZJq7aZPxQdwnEz3AXpStu5BVJPmI2	\N	\N	\N	t	\N	2024-08-26 13:16:01	2024-08-26 13:16:01
8	\N	+994504635533	\N	\N	$2y$12$RWxnzc48J6F5Oc4GBW2YbOjmNhTE4tESTHGmiq2EFKBldiy1fUnCe	\N	\N	\N	t	\N	2024-09-07 18:21:08	2024-09-07 18:21:08
9	\N	+74444444444	\N	\N	$2y$12$6xoOCLVDg...ZgkZvJAc3.gtEdC/NFNI9IcC0OGIH79YJ/7LTmd4C	\N	\N	\N	t	\N	2024-09-07 20:48:24	2024-09-07 20:48:24
10	Solomon	\N	\N	\N	$2y$12$DshMxxa.pM9A42.vUI9NN..H2LamGxX3LKtqyklVQg9britCQzTMe	\N	suleyman_g	885434922	t	\N	2024-09-09 07:50:23	2024-09-09 07:50:23
11	\N	+75555555555	\N	\N	$2y$12$SP/YwhK.ULSQx6i5oV23h.oSio12zFlL3BCkPM1X1SqD7tvu/aelC	\N	\N	\N	t	\N	2024-09-09 14:25:53	2024-09-09 14:25:53
12	\N	+79999999999	\N	\N	$2y$12$67gQKnUzkhr97QTg5T2auew5wgtl4lZgOB2beSCMJSDfc/Nfnisv6	\N	\N	\N	t	\N	2024-09-09 18:08:03	2024-09-09 18:08:03
13	\N	+71111111111	\N	\N	$2y$12$BP6eO2u8jV8Nn0CkhdFwluAwvGJALLJFLAZKYDAHFQpIDDvvZymHm	\N	\N	\N	t	\N	2024-09-09 18:20:58	2024-09-09 18:20:58
14	\N	+71111111112	\N	\N	$2y$12$cbB5oAa1QqyZHbC3tzFVw.ajaKZH44W70.dh4opctL9pxoMbcrS7e	\N	\N	\N	t	\N	2024-09-09 18:27:14	2024-09-09 18:27:14
15	\N	+71111111113	\N	\N	$2y$12$LFpAOC41DCivdsvH1VAcSO7kFF2jcbL7m73OgCvRZWtlpe4ZkUPhG	\N	\N	\N	t	\N	2024-09-09 18:30:34	2024-09-09 18:30:34
17	\N	+78888888888	\N	\N	$2y$12$dT4WztDZ9HkIhZPA6r88WeBMMlDDCFjxGlx1TfEKAniqFEmzAeFQe	\N	\N	\N	t	\N	2024-09-10 15:38:21	2024-09-10 15:38:21
18	\N	+70000000001	\N	\N	$2y$12$fjzoKKIeq0jsGfOlTlS81uUoQqeHgYHmqpSwZRn/oJ6YOHKkOvAIu	\N	\N	\N	t	\N	2024-09-10 15:50:47	2024-09-10 15:50:47
19	\N	+70000000003	\N	\N	$2y$12$wZNfw9pce4HJdbhOBhh1P.Mi.6zD5N6G4sTD/9ESdOcOLDiU70YHS	\N	\N	\N	t	\N	2024-09-11 18:29:42	2024-09-11 18:29:42
16	аапрр	\N	\N	\N	$2y$12$rdhfKu4ygj2lYItxdoDTVuAMoSn5O2Okw91l7XhUfZheUkjtptNCO	1988-12-29 15:29:14	farid_023	863756819	t	\N	2024-09-10 00:12:42	2024-09-29 15:29:14
3	Farid Gurbanov	+70000000000	\N	\N	$2y$12$mb2KD9/mMyow21k6VYxBp.3dC0aeGm1fH7y0nX2YOPpK/Qfx1Lozq	1997-06-22 23:38:25	\N	\N	t	\N	2024-07-16 09:05:58	2024-10-04 23:38:25
\.


--
-- Name: additives_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kim
--

SELECT pg_catalog.setval('public.additives_id_seq', 4, true);


--
-- Name: areas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kim
--

SELECT pg_catalog.setval('public.areas_id_seq', 2, true);


--
-- Name: audits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kim
--

SELECT pg_catalog.setval('public.audits_id_seq', 1, false);


--
-- Name: bonus_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kim
--

SELECT pg_catalog.setval('public.bonus_category_id_seq', 5, true);


--
-- Name: bonus_menu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kim
--

SELECT pg_catalog.setval('public.bonus_menu_id_seq', 4, true);


--
-- Name: bonus_restaurant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kim
--

SELECT pg_catalog.setval('public.bonus_restaurant_id_seq', 12, true);


--
-- Name: bonus_user_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kim
--

SELECT pg_catalog.setval('public.bonus_user_status_id_seq', 4, true);


--
-- Name: bonuses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kim
--

SELECT pg_catalog.setval('public.bonuses_id_seq', 3, true);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kim
--

SELECT pg_catalog.setval('public.categories_id_seq', 12, true);


--
-- Name: category_additive_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kim
--

SELECT pg_catalog.setval('public.category_additive_id_seq', 3, true);


--
-- Name: category_device_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kim
--

SELECT pg_catalog.setval('public.category_device_id_seq', 1, false);


--
-- Name: devices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kim
--

SELECT pg_catalog.setval('public.devices_id_seq', 1, true);


--
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kim
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- Name: ingredient_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kim
--

SELECT pg_catalog.setval('public.ingredient_categories_id_seq', 2, true);


--
-- Name: ingredients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kim
--

SELECT pg_catalog.setval('public.ingredients_id_seq', 32, true);


--
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kim
--

SELECT pg_catalog.setval('public.jobs_id_seq', 41, true);


--
-- Name: locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kim
--

SELECT pg_catalog.setval('public.locations_id_seq', 13, true);


--
-- Name: measurements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kim
--

SELECT pg_catalog.setval('public.measurements_id_seq', 5, true);


--
-- Name: media_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kim
--

SELECT pg_catalog.setval('public.media_id_seq', 41, true);


--
-- Name: menu_additive_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kim
--

SELECT pg_catalog.setval('public.menu_additive_id_seq', 8, true);


--
-- Name: menu_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kim
--

SELECT pg_catalog.setval('public.menu_category_id_seq', 19, true);


--
-- Name: menu_device_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kim
--

SELECT pg_catalog.setval('public.menu_device_id_seq', 1, false);


--
-- Name: menu_ingredient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kim
--

SELECT pg_catalog.setval('public.menu_ingredient_id_seq', 25, true);


--
-- Name: menu_sizes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kim
--

SELECT pg_catalog.setval('public.menu_sizes_id_seq', 7, true);


--
-- Name: menu_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kim
--

SELECT pg_catalog.setval('public.menu_tags_id_seq', 4, true);


--
-- Name: menus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kim
--

SELECT pg_catalog.setval('public.menus_id_seq', 18, true);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kim
--

SELECT pg_catalog.setval('public.migrations_id_seq', 80, true);


--
-- Name: onboardings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kim
--

SELECT pg_catalog.setval('public.onboardings_id_seq', 4, true);


--
-- Name: permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kim
--

SELECT pg_catalog.setval('public.permissions_id_seq', 81, true);


--
-- Name: present_restaurant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kim
--

SELECT pg_catalog.setval('public.present_restaurant_id_seq', 1, false);


--
-- Name: presents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kim
--

SELECT pg_catalog.setval('public.presents_id_seq', 1, false);


--
-- Name: promo_code_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kim
--

SELECT pg_catalog.setval('public.promo_code_category_id_seq', 1, false);


--
-- Name: promo_code_menu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kim
--

SELECT pg_catalog.setval('public.promo_code_menu_id_seq', 1, false);


--
-- Name: promo_code_restaurant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kim
--

SELECT pg_catalog.setval('public.promo_code_restaurant_id_seq', 1, false);


--
-- Name: promo_code_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kim
--

SELECT pg_catalog.setval('public.promo_code_user_id_seq', 1, false);


--
-- Name: promo_code_user_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kim
--

SELECT pg_catalog.setval('public.promo_code_user_status_id_seq', 1, false);


--
-- Name: promo_codes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kim
--

SELECT pg_catalog.setval('public.promo_codes_id_seq', 1, false);


--
-- Name: promotion_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kim
--

SELECT pg_catalog.setval('public.promotion_category_id_seq', 4, true);


--
-- Name: promotion_menu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kim
--

SELECT pg_catalog.setval('public.promotion_menu_id_seq', 3, true);


--
-- Name: promotion_restaurant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kim
--

SELECT pg_catalog.setval('public.promotion_restaurant_id_seq', 5, true);


--
-- Name: promotions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kim
--

SELECT pg_catalog.setval('public.promotions_id_seq', 3, true);


--
-- Name: recommendation_by_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kim
--

SELECT pg_catalog.setval('public.recommendation_by_category_id_seq', 1, false);


--
-- Name: regions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kim
--

SELECT pg_catalog.setval('public.regions_id_seq', 28, true);


--
-- Name: restaurant_menu_prices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kim
--

SELECT pg_catalog.setval('public.restaurant_menu_prices_id_seq', 192, true);


--
-- Name: restaurant_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kim
--

SELECT pg_catalog.setval('public.restaurant_user_id_seq', 1, false);


--
-- Name: restaurants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kim
--

SELECT pg_catalog.setval('public.restaurants_id_seq', 8, true);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kim
--

SELECT pg_catalog.setval('public.roles_id_seq', 1, true);


--
-- Name: stories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kim
--

SELECT pg_catalog.setval('public.stories_id_seq', 4, true);


--
-- Name: story_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kim
--

SELECT pg_catalog.setval('public.story_categories_id_seq', 2, true);


--
-- Name: tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kim
--

SELECT pg_catalog.setval('public.tags_id_seq', 2, true);


--
-- Name: user_points_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kim
--

SELECT pg_catalog.setval('public.user_points_id_seq', 136, true);


--
-- Name: user_statuses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kim
--

SELECT pg_catalog.setval('public.user_statuses_id_seq', 3, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kim
--

SELECT pg_catalog.setval('public.users_id_seq', 19, true);


--
-- Name: additives additives_pkey; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.additives
    ADD CONSTRAINT additives_pkey PRIMARY KEY (id);


--
-- Name: areas areas_pkey; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.areas
    ADD CONSTRAINT areas_pkey PRIMARY KEY (id);


--
-- Name: audits audits_pkey; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.audits
    ADD CONSTRAINT audits_pkey PRIMARY KEY (id);


--
-- Name: bonus_category bonus_category_category_id_bonus_id_unique; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.bonus_category
    ADD CONSTRAINT bonus_category_category_id_bonus_id_unique UNIQUE (category_id, bonus_id);


--
-- Name: bonus_category bonus_category_pkey; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.bonus_category
    ADD CONSTRAINT bonus_category_pkey PRIMARY KEY (id);


--
-- Name: bonus_menu bonus_menu_menu_id_bonus_id_unique; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.bonus_menu
    ADD CONSTRAINT bonus_menu_menu_id_bonus_id_unique UNIQUE (menu_id, bonus_id);


--
-- Name: bonus_menu bonus_menu_pkey; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.bonus_menu
    ADD CONSTRAINT bonus_menu_pkey PRIMARY KEY (id);


--
-- Name: bonus_restaurant bonus_restaurant_pkey; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.bonus_restaurant
    ADD CONSTRAINT bonus_restaurant_pkey PRIMARY KEY (id);


--
-- Name: bonus_restaurant bonus_restaurant_restaurant_id_bonus_id_unique; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.bonus_restaurant
    ADD CONSTRAINT bonus_restaurant_restaurant_id_bonus_id_unique UNIQUE (restaurant_id, bonus_id);


--
-- Name: bonus_user_status bonus_user_status_pkey; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.bonus_user_status
    ADD CONSTRAINT bonus_user_status_pkey PRIMARY KEY (id);


--
-- Name: bonus_user_status bonus_user_status_user_status_id_bonus_id_unique; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.bonus_user_status
    ADD CONSTRAINT bonus_user_status_user_status_id_bonus_id_unique UNIQUE (user_status_id, bonus_id);


--
-- Name: bonuses bonuses_pkey; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.bonuses
    ADD CONSTRAINT bonuses_pkey PRIMARY KEY (id);


--
-- Name: cache_locks cache_locks_pkey; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.cache_locks
    ADD CONSTRAINT cache_locks_pkey PRIMARY KEY (key);


--
-- Name: cache cache_pkey; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.cache
    ADD CONSTRAINT cache_pkey PRIMARY KEY (key);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: category_additive category_additive_additive_id_category_id_unique; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.category_additive
    ADD CONSTRAINT category_additive_additive_id_category_id_unique UNIQUE (additive_id, category_id);


--
-- Name: category_additive category_additive_pkey; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.category_additive
    ADD CONSTRAINT category_additive_pkey PRIMARY KEY (id);


--
-- Name: category_device category_device_category_id_device_id_unique; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.category_device
    ADD CONSTRAINT category_device_category_id_device_id_unique UNIQUE (category_id, device_id);


--
-- Name: category_device category_device_pkey; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.category_device
    ADD CONSTRAINT category_device_pkey PRIMARY KEY (id);


--
-- Name: devices devices_pkey; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.devices
    ADD CONSTRAINT devices_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs failed_jobs_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);


--
-- Name: ingredient_categories ingredient_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.ingredient_categories
    ADD CONSTRAINT ingredient_categories_pkey PRIMARY KEY (id);


--
-- Name: ingredients ingredients_pkey; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.ingredients
    ADD CONSTRAINT ingredients_pkey PRIMARY KEY (id);


--
-- Name: job_batches job_batches_pkey; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.job_batches
    ADD CONSTRAINT job_batches_pkey PRIMARY KEY (id);


--
-- Name: jobs jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);


--
-- Name: locations locations_pkey; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);


--
-- Name: measurements measurements_pkey; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.measurements
    ADD CONSTRAINT measurements_pkey PRIMARY KEY (id);


--
-- Name: media media_pkey; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.media
    ADD CONSTRAINT media_pkey PRIMARY KEY (id);


--
-- Name: media media_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.media
    ADD CONSTRAINT media_uuid_unique UNIQUE (uuid);


--
-- Name: menu_additive menu_additive_menu_id_additive_id_unique; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.menu_additive
    ADD CONSTRAINT menu_additive_menu_id_additive_id_unique UNIQUE (menu_id, additive_id);


--
-- Name: menu_additive menu_additive_pkey; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.menu_additive
    ADD CONSTRAINT menu_additive_pkey PRIMARY KEY (id);


--
-- Name: menu_category menu_category_menu_id_category_id_unique; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.menu_category
    ADD CONSTRAINT menu_category_menu_id_category_id_unique UNIQUE (menu_id, category_id);


--
-- Name: menu_category menu_category_pkey; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.menu_category
    ADD CONSTRAINT menu_category_pkey PRIMARY KEY (id);


--
-- Name: menu_device menu_device_menu_id_device_id_unique; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.menu_device
    ADD CONSTRAINT menu_device_menu_id_device_id_unique UNIQUE (menu_id, device_id);


--
-- Name: menu_device menu_device_pkey; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.menu_device
    ADD CONSTRAINT menu_device_pkey PRIMARY KEY (id);


--
-- Name: menu_ingredient menu_ingredient_menu_id_ingredient_id_unique; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.menu_ingredient
    ADD CONSTRAINT menu_ingredient_menu_id_ingredient_id_unique UNIQUE (menu_id, ingredient_id);


--
-- Name: menu_ingredient menu_ingredient_pkey; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.menu_ingredient
    ADD CONSTRAINT menu_ingredient_pkey PRIMARY KEY (id);


--
-- Name: menu_sizes menu_sizes_pkey; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.menu_sizes
    ADD CONSTRAINT menu_sizes_pkey PRIMARY KEY (id);


--
-- Name: menu_tags menu_tags_menu_id_tag_id_unique; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.menu_tags
    ADD CONSTRAINT menu_tags_menu_id_tag_id_unique UNIQUE (menu_id, tag_id);


--
-- Name: menu_tags menu_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.menu_tags
    ADD CONSTRAINT menu_tags_pkey PRIMARY KEY (id);


--
-- Name: menus menus_pkey; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.menus
    ADD CONSTRAINT menus_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: model_has_permissions model_has_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.model_has_permissions
    ADD CONSTRAINT model_has_permissions_pkey PRIMARY KEY (permission_id, model_id, model_type);


--
-- Name: model_has_roles model_has_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.model_has_roles
    ADD CONSTRAINT model_has_roles_pkey PRIMARY KEY (role_id, model_id, model_type);


--
-- Name: notifications notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (id);


--
-- Name: onboardings onboardings_pkey; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.onboardings
    ADD CONSTRAINT onboardings_pkey PRIMARY KEY (id);


--
-- Name: password_reset_tokens password_reset_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.password_reset_tokens
    ADD CONSTRAINT password_reset_tokens_pkey PRIMARY KEY (email);


--
-- Name: permissions permissions_name_guard_name_unique; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_guard_name_unique UNIQUE (name, guard_name);


--
-- Name: permissions permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (id);


--
-- Name: present_restaurant present_restaurant_pkey; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.present_restaurant
    ADD CONSTRAINT present_restaurant_pkey PRIMARY KEY (id);


--
-- Name: present_restaurant present_restaurant_restaurant_id_present_id_unique; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.present_restaurant
    ADD CONSTRAINT present_restaurant_restaurant_id_present_id_unique UNIQUE (restaurant_id, present_id);


--
-- Name: presents presents_pkey; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.presents
    ADD CONSTRAINT presents_pkey PRIMARY KEY (id);


--
-- Name: promo_code_category promo_code_category_category_id_promo_code_id_unique; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.promo_code_category
    ADD CONSTRAINT promo_code_category_category_id_promo_code_id_unique UNIQUE (category_id, promo_code_id);


--
-- Name: promo_code_category promo_code_category_pkey; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.promo_code_category
    ADD CONSTRAINT promo_code_category_pkey PRIMARY KEY (id);


--
-- Name: promo_code_menu promo_code_menu_menu_id_promo_code_id_unique; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.promo_code_menu
    ADD CONSTRAINT promo_code_menu_menu_id_promo_code_id_unique UNIQUE (menu_id, promo_code_id);


--
-- Name: promo_code_menu promo_code_menu_pkey; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.promo_code_menu
    ADD CONSTRAINT promo_code_menu_pkey PRIMARY KEY (id);


--
-- Name: promo_code_restaurant promo_code_restaurant_pkey; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.promo_code_restaurant
    ADD CONSTRAINT promo_code_restaurant_pkey PRIMARY KEY (id);


--
-- Name: promo_code_restaurant promo_code_restaurant_restaurant_id_promo_code_id_unique; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.promo_code_restaurant
    ADD CONSTRAINT promo_code_restaurant_restaurant_id_promo_code_id_unique UNIQUE (restaurant_id, promo_code_id);


--
-- Name: promo_code_user promo_code_user_pkey; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.promo_code_user
    ADD CONSTRAINT promo_code_user_pkey PRIMARY KEY (id);


--
-- Name: promo_code_user_status promo_code_user_status_pkey; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.promo_code_user_status
    ADD CONSTRAINT promo_code_user_status_pkey PRIMARY KEY (id);


--
-- Name: promo_code_user_status promo_code_user_status_user_status_id_promo_code_id_unique; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.promo_code_user_status
    ADD CONSTRAINT promo_code_user_status_user_status_id_promo_code_id_unique UNIQUE (user_status_id, promo_code_id);


--
-- Name: promo_code_user promo_code_user_user_id_promo_code_id_unique; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.promo_code_user
    ADD CONSTRAINT promo_code_user_user_id_promo_code_id_unique UNIQUE (user_id, promo_code_id);


--
-- Name: promo_codes promo_codes_pkey; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.promo_codes
    ADD CONSTRAINT promo_codes_pkey PRIMARY KEY (id);


--
-- Name: promotion_category promotion_category_category_id_promotion_id_unique; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.promotion_category
    ADD CONSTRAINT promotion_category_category_id_promotion_id_unique UNIQUE (category_id, promotion_id);


--
-- Name: promotion_category promotion_category_pkey; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.promotion_category
    ADD CONSTRAINT promotion_category_pkey PRIMARY KEY (id);


--
-- Name: promotion_menu promotion_menu_menu_id_promotion_id_unique; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.promotion_menu
    ADD CONSTRAINT promotion_menu_menu_id_promotion_id_unique UNIQUE (menu_id, promotion_id);


--
-- Name: promotion_menu promotion_menu_pkey; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.promotion_menu
    ADD CONSTRAINT promotion_menu_pkey PRIMARY KEY (id);


--
-- Name: promotion_restaurant promotion_restaurant_pkey; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.promotion_restaurant
    ADD CONSTRAINT promotion_restaurant_pkey PRIMARY KEY (id);


--
-- Name: promotions promotions_pkey; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.promotions
    ADD CONSTRAINT promotions_pkey PRIMARY KEY (id);


--
-- Name: recommendation_by_category recommendation_by_category_menu_id_category_id_unique; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.recommendation_by_category
    ADD CONSTRAINT recommendation_by_category_menu_id_category_id_unique UNIQUE (menu_id, category_id);


--
-- Name: recommendation_by_category recommendation_by_category_pkey; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.recommendation_by_category
    ADD CONSTRAINT recommendation_by_category_pkey PRIMARY KEY (id);


--
-- Name: regions regions_pkey; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.regions
    ADD CONSTRAINT regions_pkey PRIMARY KEY (id);


--
-- Name: restaurant_menu_prices restaurant_menu_prices_pkey; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.restaurant_menu_prices
    ADD CONSTRAINT restaurant_menu_prices_pkey PRIMARY KEY (id);


--
-- Name: restaurant_user restaurant_user_pkey; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.restaurant_user
    ADD CONSTRAINT restaurant_user_pkey PRIMARY KEY (id);


--
-- Name: restaurant_user restaurant_user_restaurant_id_user_id_unique; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.restaurant_user
    ADD CONSTRAINT restaurant_user_restaurant_id_user_id_unique UNIQUE (restaurant_id, user_id);


--
-- Name: restaurants restaurants_pkey; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.restaurants
    ADD CONSTRAINT restaurants_pkey PRIMARY KEY (id);


--
-- Name: role_has_permissions role_has_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.role_has_permissions
    ADD CONSTRAINT role_has_permissions_pkey PRIMARY KEY (permission_id, role_id);


--
-- Name: roles roles_name_guard_name_unique; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_guard_name_unique UNIQUE (name, guard_name);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: stories stories_pkey; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.stories
    ADD CONSTRAINT stories_pkey PRIMARY KEY (id);


--
-- Name: story_categories story_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.story_categories
    ADD CONSTRAINT story_categories_pkey PRIMARY KEY (id);


--
-- Name: tags tags_pkey; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- Name: two_factor_auth_telegrams two_factor_auth_telegrams_pkey; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.two_factor_auth_telegrams
    ADD CONSTRAINT two_factor_auth_telegrams_pkey PRIMARY KEY (id);


--
-- Name: two_factor_auth_telegrams two_factor_auth_telegrams_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.two_factor_auth_telegrams
    ADD CONSTRAINT two_factor_auth_telegrams_uuid_unique UNIQUE (uuid);


--
-- Name: two_factor_auths two_factor_auths_pkey; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.two_factor_auths
    ADD CONSTRAINT two_factor_auths_pkey PRIMARY KEY (id);


--
-- Name: user_points user_points_pkey; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.user_points
    ADD CONSTRAINT user_points_pkey PRIMARY KEY (id);


--
-- Name: user_statuses user_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.user_statuses
    ADD CONSTRAINT user_statuses_pkey PRIMARY KEY (id);


--
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: audits_auditable_type_auditable_id_index; Type: INDEX; Schema: public; Owner: kim
--

CREATE INDEX audits_auditable_type_auditable_id_index ON public.audits USING btree (auditable_type, auditable_id);


--
-- Name: audits_user_id_user_type_index; Type: INDEX; Schema: public; Owner: kim
--

CREATE INDEX audits_user_id_user_type_index ON public.audits USING btree (user_id, user_type);


--
-- Name: jobs_queue_index; Type: INDEX; Schema: public; Owner: kim
--

CREATE INDEX jobs_queue_index ON public.jobs USING btree (queue);


--
-- Name: locations_area_name_index; Type: INDEX; Schema: public; Owner: kim
--

CREATE INDEX locations_area_name_index ON public.locations USING btree (area_name);


--
-- Name: locations_latitude_index; Type: INDEX; Schema: public; Owner: kim
--

CREATE INDEX locations_latitude_index ON public.locations USING btree (latitude);


--
-- Name: locations_locality_name_index; Type: INDEX; Schema: public; Owner: kim
--

CREATE INDEX locations_locality_name_index ON public.locations USING btree (locality_name);


--
-- Name: locations_longitude_index; Type: INDEX; Schema: public; Owner: kim
--

CREATE INDEX locations_longitude_index ON public.locations USING btree (longitude);


--
-- Name: locations_name_index; Type: INDEX; Schema: public; Owner: kim
--

CREATE INDEX locations_name_index ON public.locations USING btree (name);


--
-- Name: locations_province_name_index; Type: INDEX; Schema: public; Owner: kim
--

CREATE INDEX locations_province_name_index ON public.locations USING btree (province_name);


--
-- Name: locations_street_name_index; Type: INDEX; Schema: public; Owner: kim
--

CREATE INDEX locations_street_name_index ON public.locations USING btree (street_name);


--
-- Name: media_model_type_model_id_index; Type: INDEX; Schema: public; Owner: kim
--

CREATE INDEX media_model_type_model_id_index ON public.media USING btree (model_type, model_id);


--
-- Name: media_order_column_index; Type: INDEX; Schema: public; Owner: kim
--

CREATE INDEX media_order_column_index ON public.media USING btree (order_column);


--
-- Name: model_has_permissions_model_id_model_type_index; Type: INDEX; Schema: public; Owner: kim
--

CREATE INDEX model_has_permissions_model_id_model_type_index ON public.model_has_permissions USING btree (model_id, model_type);


--
-- Name: model_has_roles_model_id_model_type_index; Type: INDEX; Schema: public; Owner: kim
--

CREATE INDEX model_has_roles_model_id_model_type_index ON public.model_has_roles USING btree (model_id, model_type);


--
-- Name: notifications_notifiable_type_notifiable_id_index; Type: INDEX; Schema: public; Owner: kim
--

CREATE INDEX notifications_notifiable_type_notifiable_id_index ON public.notifications USING btree (notifiable_type, notifiable_id);


--
-- Name: promo_codes_code_index; Type: INDEX; Schema: public; Owner: kim
--

CREATE INDEX promo_codes_code_index ON public.promo_codes USING btree (code);


--
-- Name: restaurants_address_index; Type: INDEX; Schema: public; Owner: kim
--

CREATE INDEX restaurants_address_index ON public.restaurants USING btree (address);


--
-- Name: restaurants_name_index; Type: INDEX; Schema: public; Owner: kim
--

CREATE INDEX restaurants_name_index ON public.restaurants USING btree (name);


--
-- Name: sessions_last_activity_index; Type: INDEX; Schema: public; Owner: kim
--

CREATE INDEX sessions_last_activity_index ON public.sessions USING btree (last_activity);


--
-- Name: sessions_user_id_index; Type: INDEX; Schema: public; Owner: kim
--

CREATE INDEX sessions_user_id_index ON public.sessions USING btree (user_id);


--
-- Name: two_factor_auth_telegrams_chat_id_index; Type: INDEX; Schema: public; Owner: kim
--

CREATE INDEX two_factor_auth_telegrams_chat_id_index ON public.two_factor_auth_telegrams USING btree (chat_id);


--
-- Name: two_factor_auth_telegrams_code_index; Type: INDEX; Schema: public; Owner: kim
--

CREATE INDEX two_factor_auth_telegrams_code_index ON public.two_factor_auth_telegrams USING btree (code);


--
-- Name: two_factor_auth_telegrams_update_id_index; Type: INDEX; Schema: public; Owner: kim
--

CREATE INDEX two_factor_auth_telegrams_update_id_index ON public.two_factor_auth_telegrams USING btree (update_id);


--
-- Name: two_factor_auth_telegrams_username_index; Type: INDEX; Schema: public; Owner: kim
--

CREATE INDEX two_factor_auth_telegrams_username_index ON public.two_factor_auth_telegrams USING btree (username);


--
-- Name: user_points_area_id_index; Type: INDEX; Schema: public; Owner: kim
--

CREATE INDEX user_points_area_id_index ON public.user_points USING btree (area_id);


--
-- Name: user_points_latitude_index; Type: INDEX; Schema: public; Owner: kim
--

CREATE INDEX user_points_latitude_index ON public.user_points USING btree (latitude);


--
-- Name: user_points_longitude_index; Type: INDEX; Schema: public; Owner: kim
--

CREATE INDEX user_points_longitude_index ON public.user_points USING btree (longitude);


--
-- Name: user_points_user_id_index; Type: INDEX; Schema: public; Owner: kim
--

CREATE INDEX user_points_user_id_index ON public.user_points USING btree (user_id);


--
-- Name: users_phone_number_index; Type: INDEX; Schema: public; Owner: kim
--

CREATE INDEX users_phone_number_index ON public.users USING btree (phone_number);


--
-- Name: additives additives_measurement_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.additives
    ADD CONSTRAINT additives_measurement_id_foreign FOREIGN KEY (measurement_id) REFERENCES public.measurements(id) ON DELETE SET NULL;


--
-- Name: areas areas_restaurant_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.areas
    ADD CONSTRAINT areas_restaurant_id_foreign FOREIGN KEY (restaurant_id) REFERENCES public.restaurants(id) ON DELETE CASCADE;


--
-- Name: bonus_category bonus_category_bonus_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.bonus_category
    ADD CONSTRAINT bonus_category_bonus_id_foreign FOREIGN KEY (bonus_id) REFERENCES public.bonuses(id) ON DELETE CASCADE;


--
-- Name: bonus_category bonus_category_category_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.bonus_category
    ADD CONSTRAINT bonus_category_category_id_foreign FOREIGN KEY (category_id) REFERENCES public.categories(id) ON DELETE CASCADE;


--
-- Name: bonus_menu bonus_menu_bonus_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.bonus_menu
    ADD CONSTRAINT bonus_menu_bonus_id_foreign FOREIGN KEY (bonus_id) REFERENCES public.bonuses(id) ON DELETE CASCADE;


--
-- Name: bonus_menu bonus_menu_menu_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.bonus_menu
    ADD CONSTRAINT bonus_menu_menu_id_foreign FOREIGN KEY (menu_id) REFERENCES public.menus(id) ON DELETE CASCADE;


--
-- Name: bonus_restaurant bonus_restaurant_bonus_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.bonus_restaurant
    ADD CONSTRAINT bonus_restaurant_bonus_id_foreign FOREIGN KEY (bonus_id) REFERENCES public.bonuses(id) ON DELETE CASCADE;


--
-- Name: bonus_restaurant bonus_restaurant_restaurant_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.bonus_restaurant
    ADD CONSTRAINT bonus_restaurant_restaurant_id_foreign FOREIGN KEY (restaurant_id) REFERENCES public.restaurants(id) ON DELETE CASCADE;


--
-- Name: bonus_user_status bonus_user_status_bonus_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.bonus_user_status
    ADD CONSTRAINT bonus_user_status_bonus_id_foreign FOREIGN KEY (bonus_id) REFERENCES public.bonuses(id) ON DELETE CASCADE;


--
-- Name: bonus_user_status bonus_user_status_user_status_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.bonus_user_status
    ADD CONSTRAINT bonus_user_status_user_status_id_foreign FOREIGN KEY (user_status_id) REFERENCES public.user_statuses(id) ON DELETE CASCADE;


--
-- Name: category_additive category_additive_additive_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.category_additive
    ADD CONSTRAINT category_additive_additive_id_foreign FOREIGN KEY (additive_id) REFERENCES public.additives(id) ON DELETE CASCADE;


--
-- Name: category_additive category_additive_category_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.category_additive
    ADD CONSTRAINT category_additive_category_id_foreign FOREIGN KEY (category_id) REFERENCES public.categories(id) ON DELETE CASCADE;


--
-- Name: category_device category_device_category_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.category_device
    ADD CONSTRAINT category_device_category_id_foreign FOREIGN KEY (category_id) REFERENCES public.categories(id) ON DELETE CASCADE;


--
-- Name: category_device category_device_device_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.category_device
    ADD CONSTRAINT category_device_device_id_foreign FOREIGN KEY (device_id) REFERENCES public.devices(id) ON DELETE CASCADE;


--
-- Name: ingredients ingredients_category_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.ingredients
    ADD CONSTRAINT ingredients_category_id_foreign FOREIGN KEY (category_id) REFERENCES public.categories(id) ON DELETE SET NULL;


--
-- Name: ingredients ingredients_measurement_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.ingredients
    ADD CONSTRAINT ingredients_measurement_id_foreign FOREIGN KEY (measurement_id) REFERENCES public.measurements(id) ON DELETE SET NULL;


--
-- Name: menu_additive menu_additive_additive_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.menu_additive
    ADD CONSTRAINT menu_additive_additive_id_foreign FOREIGN KEY (additive_id) REFERENCES public.additives(id) ON DELETE CASCADE;


--
-- Name: menu_additive menu_additive_menu_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.menu_additive
    ADD CONSTRAINT menu_additive_menu_id_foreign FOREIGN KEY (menu_id) REFERENCES public.menus(id) ON DELETE CASCADE;


--
-- Name: menu_category menu_category_category_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.menu_category
    ADD CONSTRAINT menu_category_category_id_foreign FOREIGN KEY (category_id) REFERENCES public.categories(id) ON DELETE CASCADE;


--
-- Name: menu_category menu_category_menu_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.menu_category
    ADD CONSTRAINT menu_category_menu_id_foreign FOREIGN KEY (menu_id) REFERENCES public.menus(id) ON DELETE CASCADE;


--
-- Name: menu_device menu_device_device_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.menu_device
    ADD CONSTRAINT menu_device_device_id_foreign FOREIGN KEY (device_id) REFERENCES public.devices(id) ON DELETE CASCADE;


--
-- Name: menu_device menu_device_menu_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.menu_device
    ADD CONSTRAINT menu_device_menu_id_foreign FOREIGN KEY (menu_id) REFERENCES public.menus(id) ON DELETE CASCADE;


--
-- Name: menu_ingredient menu_ingredient_ingredient_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.menu_ingredient
    ADD CONSTRAINT menu_ingredient_ingredient_id_foreign FOREIGN KEY (ingredient_id) REFERENCES public.ingredients(id) ON DELETE CASCADE;


--
-- Name: menu_ingredient menu_ingredient_menu_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.menu_ingredient
    ADD CONSTRAINT menu_ingredient_menu_id_foreign FOREIGN KEY (menu_id) REFERENCES public.menus(id) ON DELETE CASCADE;


--
-- Name: menu_sizes menu_sizes_measurement_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.menu_sizes
    ADD CONSTRAINT menu_sizes_measurement_id_foreign FOREIGN KEY (measurement_id) REFERENCES public.measurements(id) ON DELETE SET NULL;


--
-- Name: menu_sizes menu_sizes_menu_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.menu_sizes
    ADD CONSTRAINT menu_sizes_menu_id_foreign FOREIGN KEY (menu_id) REFERENCES public.menus(id) ON DELETE CASCADE;


--
-- Name: menu_tags menu_tags_menu_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.menu_tags
    ADD CONSTRAINT menu_tags_menu_id_foreign FOREIGN KEY (menu_id) REFERENCES public.menus(id) ON DELETE CASCADE;


--
-- Name: menu_tags menu_tags_tag_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.menu_tags
    ADD CONSTRAINT menu_tags_tag_id_foreign FOREIGN KEY (tag_id) REFERENCES public.tags(id) ON DELETE CASCADE;


--
-- Name: menus menus_measurement_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.menus
    ADD CONSTRAINT menus_measurement_id_foreign FOREIGN KEY (measurement_id) REFERENCES public.measurements(id) ON DELETE SET NULL;


--
-- Name: model_has_permissions model_has_permissions_permission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.model_has_permissions
    ADD CONSTRAINT model_has_permissions_permission_id_foreign FOREIGN KEY (permission_id) REFERENCES public.permissions(id) ON DELETE CASCADE;


--
-- Name: model_has_roles model_has_roles_role_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.model_has_roles
    ADD CONSTRAINT model_has_roles_role_id_foreign FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE CASCADE;


--
-- Name: present_restaurant present_restaurant_present_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.present_restaurant
    ADD CONSTRAINT present_restaurant_present_id_foreign FOREIGN KEY (present_id) REFERENCES public.presents(id) ON DELETE CASCADE;


--
-- Name: present_restaurant present_restaurant_restaurant_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.present_restaurant
    ADD CONSTRAINT present_restaurant_restaurant_id_foreign FOREIGN KEY (restaurant_id) REFERENCES public.restaurants(id) ON DELETE CASCADE;


--
-- Name: presents presents_menu_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.presents
    ADD CONSTRAINT presents_menu_id_foreign FOREIGN KEY (menu_id) REFERENCES public.menus(id) ON DELETE CASCADE;


--
-- Name: promo_code_category promo_code_category_category_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.promo_code_category
    ADD CONSTRAINT promo_code_category_category_id_foreign FOREIGN KEY (category_id) REFERENCES public.categories(id) ON DELETE CASCADE;


--
-- Name: promo_code_category promo_code_category_promo_code_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.promo_code_category
    ADD CONSTRAINT promo_code_category_promo_code_id_foreign FOREIGN KEY (promo_code_id) REFERENCES public.promo_codes(id) ON DELETE CASCADE;


--
-- Name: promo_code_menu promo_code_menu_menu_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.promo_code_menu
    ADD CONSTRAINT promo_code_menu_menu_id_foreign FOREIGN KEY (menu_id) REFERENCES public.menus(id) ON DELETE CASCADE;


--
-- Name: promo_code_menu promo_code_menu_promo_code_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.promo_code_menu
    ADD CONSTRAINT promo_code_menu_promo_code_id_foreign FOREIGN KEY (promo_code_id) REFERENCES public.promo_codes(id) ON DELETE CASCADE;


--
-- Name: promo_code_restaurant promo_code_restaurant_promo_code_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.promo_code_restaurant
    ADD CONSTRAINT promo_code_restaurant_promo_code_id_foreign FOREIGN KEY (promo_code_id) REFERENCES public.promo_codes(id) ON DELETE CASCADE;


--
-- Name: promo_code_restaurant promo_code_restaurant_restaurant_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.promo_code_restaurant
    ADD CONSTRAINT promo_code_restaurant_restaurant_id_foreign FOREIGN KEY (restaurant_id) REFERENCES public.restaurants(id) ON DELETE CASCADE;


--
-- Name: promo_code_user promo_code_user_promo_code_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.promo_code_user
    ADD CONSTRAINT promo_code_user_promo_code_id_foreign FOREIGN KEY (promo_code_id) REFERENCES public.promo_codes(id) ON DELETE CASCADE;


--
-- Name: promo_code_user_status promo_code_user_status_promo_code_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.promo_code_user_status
    ADD CONSTRAINT promo_code_user_status_promo_code_id_foreign FOREIGN KEY (promo_code_id) REFERENCES public.promo_codes(id) ON DELETE CASCADE;


--
-- Name: promo_code_user_status promo_code_user_status_user_status_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.promo_code_user_status
    ADD CONSTRAINT promo_code_user_status_user_status_id_foreign FOREIGN KEY (user_status_id) REFERENCES public.user_statuses(id) ON DELETE CASCADE;


--
-- Name: promo_code_user promo_code_user_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.promo_code_user
    ADD CONSTRAINT promo_code_user_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: promotion_category promotion_category_category_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.promotion_category
    ADD CONSTRAINT promotion_category_category_id_foreign FOREIGN KEY (category_id) REFERENCES public.categories(id) ON DELETE CASCADE;


--
-- Name: promotion_category promotion_category_promotion_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.promotion_category
    ADD CONSTRAINT promotion_category_promotion_id_foreign FOREIGN KEY (promotion_id) REFERENCES public.promotions(id) ON DELETE CASCADE;


--
-- Name: promotion_menu promotion_menu_menu_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.promotion_menu
    ADD CONSTRAINT promotion_menu_menu_id_foreign FOREIGN KEY (menu_id) REFERENCES public.menus(id) ON DELETE CASCADE;


--
-- Name: promotion_menu promotion_menu_promotion_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.promotion_menu
    ADD CONSTRAINT promotion_menu_promotion_id_foreign FOREIGN KEY (promotion_id) REFERENCES public.promotions(id) ON DELETE CASCADE;


--
-- Name: promotion_restaurant promotion_restaurant_promotion_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.promotion_restaurant
    ADD CONSTRAINT promotion_restaurant_promotion_id_foreign FOREIGN KEY (promotion_id) REFERENCES public.promotions(id) ON DELETE CASCADE;


--
-- Name: promotion_restaurant promotion_restaurant_restaurant_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.promotion_restaurant
    ADD CONSTRAINT promotion_restaurant_restaurant_id_foreign FOREIGN KEY (restaurant_id) REFERENCES public.restaurants(id) ON DELETE CASCADE;


--
-- Name: recommendation_by_category recommendation_by_category_category_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.recommendation_by_category
    ADD CONSTRAINT recommendation_by_category_category_id_foreign FOREIGN KEY (category_id) REFERENCES public.categories(id) ON DELETE CASCADE;


--
-- Name: recommendation_by_category recommendation_by_category_menu_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.recommendation_by_category
    ADD CONSTRAINT recommendation_by_category_menu_id_foreign FOREIGN KEY (menu_id) REFERENCES public.menus(id) ON DELETE CASCADE;


--
-- Name: restaurant_menu_prices restaurant_menu_prices_menu_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.restaurant_menu_prices
    ADD CONSTRAINT restaurant_menu_prices_menu_id_foreign FOREIGN KEY (menu_id) REFERENCES public.menus(id) ON DELETE CASCADE;


--
-- Name: restaurant_menu_prices restaurant_menu_prices_menu_size_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.restaurant_menu_prices
    ADD CONSTRAINT restaurant_menu_prices_menu_size_id_foreign FOREIGN KEY (menu_size_id) REFERENCES public.menu_sizes(id) ON DELETE CASCADE;


--
-- Name: restaurant_menu_prices restaurant_menu_prices_restaurant_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.restaurant_menu_prices
    ADD CONSTRAINT restaurant_menu_prices_restaurant_id_foreign FOREIGN KEY (restaurant_id) REFERENCES public.restaurants(id) ON DELETE CASCADE;


--
-- Name: restaurant_user restaurant_user_restaurant_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.restaurant_user
    ADD CONSTRAINT restaurant_user_restaurant_id_foreign FOREIGN KEY (restaurant_id) REFERENCES public.restaurants(id) ON DELETE CASCADE;


--
-- Name: restaurant_user restaurant_user_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.restaurant_user
    ADD CONSTRAINT restaurant_user_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: restaurants restaurants_region_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.restaurants
    ADD CONSTRAINT restaurants_region_id_foreign FOREIGN KEY (region_id) REFERENCES public.regions(id) ON DELETE SET NULL;


--
-- Name: role_has_permissions role_has_permissions_permission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.role_has_permissions
    ADD CONSTRAINT role_has_permissions_permission_id_foreign FOREIGN KEY (permission_id) REFERENCES public.permissions(id) ON DELETE CASCADE;


--
-- Name: role_has_permissions role_has_permissions_role_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.role_has_permissions
    ADD CONSTRAINT role_has_permissions_role_id_foreign FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE CASCADE;


--
-- Name: stories stories_story_category_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.stories
    ADD CONSTRAINT stories_story_category_id_foreign FOREIGN KEY (story_category_id) REFERENCES public.story_categories(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--


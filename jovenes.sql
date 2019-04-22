--
-- PostgreSQL database dump
--

-- Dumped from database version 11.2 (Debian 11.2-1.pgdg90+1)
-- Dumped by pg_dump version 11.2 (Debian 11.2-1.pgdg90+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: jovenes
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO jovenes;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: jovenes
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO jovenes;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jovenes
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: jovenes
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO jovenes;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: jovenes
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO jovenes;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jovenes
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: jovenes
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO jovenes;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: jovenes
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO jovenes;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jovenes
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: jovenes
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO jovenes;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: jovenes
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO jovenes;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: jovenes
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO jovenes;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jovenes
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: jovenes
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO jovenes;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jovenes
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: jovenes
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO jovenes;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: jovenes
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO jovenes;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jovenes
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: jovenes
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO jovenes;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: jovenes
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO jovenes;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jovenes
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: jovenes
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO jovenes;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: jovenes
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO jovenes;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jovenes
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: jovenes
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO jovenes;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: jovenes
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO jovenes;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jovenes
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: jovenes
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO jovenes;

--
-- Name: home_alianza; Type: TABLE; Schema: public; Owner: jovenes
--

CREATE TABLE public.home_alianza (
    id integer NOT NULL,
    sort_order integer,
    titulo character varying(100) NOT NULL,
    descripcion text,
    page_id integer NOT NULL
);


ALTER TABLE public.home_alianza OWNER TO jovenes;

--
-- Name: home_alianza_id_seq; Type: SEQUENCE; Schema: public; Owner: jovenes
--

CREATE SEQUENCE public.home_alianza_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.home_alianza_id_seq OWNER TO jovenes;

--
-- Name: home_alianza_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jovenes
--

ALTER SEQUENCE public.home_alianza_id_seq OWNED BY public.home_alianza.id;


--
-- Name: home_alianzas; Type: TABLE; Schema: public; Owner: jovenes
--

CREATE TABLE public.home_alianzas (
    page_ptr_id integer NOT NULL,
    imagen_principal_id integer,
    nota_pie text
);


ALTER TABLE public.home_alianzas OWNER TO jovenes;

--
-- Name: home_app; Type: TABLE; Schema: public; Owner: jovenes
--

CREATE TABLE public.home_app (
    page_ptr_id integer NOT NULL,
    video_code character varying(70)
);


ALTER TABLE public.home_app OWNER TO jovenes;

--
-- Name: home_ayudadifundiendo; Type: TABLE; Schema: public; Owner: jovenes
--

CREATE TABLE public.home_ayudadifundiendo (
    page_ptr_id integer NOT NULL,
    imagen_principal_id integer
);


ALTER TABLE public.home_ayudadifundiendo OWNER TO jovenes;

--
-- Name: home_carrera; Type: TABLE; Schema: public; Owner: jovenes
--

CREATE TABLE public.home_carrera (
    page_ptr_id integer NOT NULL,
    imagen_superior_horizontal_id integer,
    imagen_superior_vertical_id integer,
    politica_menores_id integer,
    reglamento_id integer,
    imagen_inferior_kit_id integer,
    imagen_inferior_mapa_id integer
);


ALTER TABLE public.home_carrera OWNER TO jovenes;

--
-- Name: home_carreras; Type: TABLE; Schema: public; Owner: jovenes
--

CREATE TABLE public.home_carreras (
    page_ptr_id integer NOT NULL,
    inscripcion_url character varying(200) NOT NULL,
    distancia character varying(10) NOT NULL,
    valor integer NOT NULL,
    descripcion_categoria character varying(30) NOT NULL
);


ALTER TABLE public.home_carreras OWNER TO jovenes;

--
-- Name: home_comocolaborar; Type: TABLE; Schema: public; Owner: jovenes
--

CREATE TABLE public.home_comocolaborar (
    page_ptr_id integer NOT NULL
);


ALTER TABLE public.home_comocolaborar OWNER TO jovenes;

--
-- Name: home_dondeestamos; Type: TABLE; Schema: public; Owner: jovenes
--

CREATE TABLE public.home_dondeestamos (
    page_ptr_id integer NOT NULL,
    imagen_principal_id integer
);


ALTER TABLE public.home_dondeestamos OWNER TO jovenes;

--
-- Name: home_homegalleryimage; Type: TABLE; Schema: public; Owner: jovenes
--

CREATE TABLE public.home_homegalleryimage (
    id integer NOT NULL,
    sort_order integer,
    caption character varying(250) NOT NULL,
    image_id integer NOT NULL,
    page_id integer NOT NULL,
    boton boolean NOT NULL,
    message text NOT NULL,
    text_boton character varying(25) NOT NULL,
    url_boton character varying(200) NOT NULL
);


ALTER TABLE public.home_homegalleryimage OWNER TO jovenes;

--
-- Name: home_homegalleryimage_id_seq; Type: SEQUENCE; Schema: public; Owner: jovenes
--

CREATE SEQUENCE public.home_homegalleryimage_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.home_homegalleryimage_id_seq OWNER TO jovenes;

--
-- Name: home_homegalleryimage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jovenes
--

ALTER SEQUENCE public.home_homegalleryimage_id_seq OWNED BY public.home_homegalleryimage.id;


--
-- Name: home_homepage; Type: TABLE; Schema: public; Owner: jovenes
--

CREATE TABLE public.home_homepage (
    page_ptr_id integer NOT NULL
);


ALTER TABLE public.home_homepage OWNER TO jovenes;

--
-- Name: home_legado; Type: TABLE; Schema: public; Owner: jovenes
--

CREATE TABLE public.home_legado (
    page_ptr_id integer NOT NULL,
    imagen_principal_id integer
);


ALTER TABLE public.home_legado OWNER TO jovenes;

--
-- Name: home_memoria; Type: TABLE; Schema: public; Owner: jovenes
--

CREATE TABLE public.home_memoria (
    id integer NOT NULL,
    sort_order integer,
    memoria_descripcion character varying(100),
    page_id integer NOT NULL,
    memoria_url character varying(200)
);


ALTER TABLE public.home_memoria OWNER TO jovenes;

--
-- Name: home_memoria_id_seq; Type: SEQUENCE; Schema: public; Owner: jovenes
--

CREATE SEQUENCE public.home_memoria_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.home_memoria_id_seq OWNER TO jovenes;

--
-- Name: home_memoria_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jovenes
--

ALTER SEQUENCE public.home_memoria_id_seq OWNED BY public.home_memoria.id;


--
-- Name: home_nosotros; Type: TABLE; Schema: public; Owner: jovenes
--

CREATE TABLE public.home_nosotros (
    page_ptr_id integer NOT NULL
);


ALTER TABLE public.home_nosotros OWNER TO jovenes;

--
-- Name: home_noticia; Type: TABLE; Schema: public; Owner: jovenes
--

CREATE TABLE public.home_noticia (
    page_ptr_id integer NOT NULL,
    date date NOT NULL,
    intro character varying(250) NOT NULL,
    body text NOT NULL,
    categoria character varying(30) NOT NULL,
    imagen_portada_id integer
);


ALTER TABLE public.home_noticia OWNER TO jovenes;

--
-- Name: home_noticiagalleryimage; Type: TABLE; Schema: public; Owner: jovenes
--

CREATE TABLE public.home_noticiagalleryimage (
    id integer NOT NULL,
    sort_order integer,
    caption character varying(250) NOT NULL,
    image_id integer NOT NULL,
    page_id integer NOT NULL
);


ALTER TABLE public.home_noticiagalleryimage OWNER TO jovenes;

--
-- Name: home_noticiagalleryimage_id_seq; Type: SEQUENCE; Schema: public; Owner: jovenes
--

CREATE SEQUENCE public.home_noticiagalleryimage_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.home_noticiagalleryimage_id_seq OWNER TO jovenes;

--
-- Name: home_noticiagalleryimage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jovenes
--

ALTER SEQUENCE public.home_noticiagalleryimage_id_seq OWNED BY public.home_noticiagalleryimage.id;


--
-- Name: home_noticias; Type: TABLE; Schema: public; Owner: jovenes
--

CREATE TABLE public.home_noticias (
    page_ptr_id integer NOT NULL
);


ALTER TABLE public.home_noticias OWNER TO jovenes;

--
-- Name: home_quehacemos; Type: TABLE; Schema: public; Owner: jovenes
--

CREATE TABLE public.home_quehacemos (
    page_ptr_id integer NOT NULL,
    acciones_imagen_id integer,
    acciones_texto character varying(400),
    banner_imagen_id integer,
    banner_url character varying(200),
    comunitaria_imagen_id integer,
    comunitaria_texto character varying(400),
    educacion_imagen_id integer,
    educacion_texto character varying(400),
    imagen_principal_id integer,
    trabajo_imagen_id integer,
    trabajo_texto character varying(400)
);


ALTER TABLE public.home_quehacemos OWNER TO jovenes;

--
-- Name: home_quienessomos; Type: TABLE; Schema: public; Owner: jovenes
--

CREATE TABLE public.home_quienessomos (
    page_ptr_id integer NOT NULL,
    imagen_principal_id integer
);


ALTER TABLE public.home_quienessomos OWNER TO jovenes;

--
-- Name: home_quierodonar; Type: TABLE; Schema: public; Owner: jovenes
--

CREATE TABLE public.home_quierodonar (
    page_ptr_id integer NOT NULL,
    imagen_principal_id integer,
    url_aumentar character varying(200),
    url_donar character varying(200)
);


ALTER TABLE public.home_quierodonar OWNER TO jovenes;

--
-- Name: home_sponsorapp; Type: TABLE; Schema: public; Owner: jovenes
--

CREATE TABLE public.home_sponsorapp (
    page_id integer NOT NULL,
    sponsorclass_ptr_id integer NOT NULL
);


ALTER TABLE public.home_sponsorapp OWNER TO jovenes;

--
-- Name: home_sponsorcarrera; Type: TABLE; Schema: public; Owner: jovenes
--

CREATE TABLE public.home_sponsorcarrera (
    sponsorclass_ptr_id integer NOT NULL,
    page_id integer NOT NULL
);


ALTER TABLE public.home_sponsorcarrera OWNER TO jovenes;

--
-- Name: home_sponsorclass; Type: TABLE; Schema: public; Owner: jovenes
--

CREATE TABLE public.home_sponsorclass (
    id integer NOT NULL,
    sort_order integer,
    nombre_sponsor character varying(100) NOT NULL,
    url_sponsor character varying(200),
    imagen_sponsor_id integer
);


ALTER TABLE public.home_sponsorclass OWNER TO jovenes;

--
-- Name: home_sponsorclass_id_seq; Type: SEQUENCE; Schema: public; Owner: jovenes
--

CREATE SEQUENCE public.home_sponsorclass_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.home_sponsorclass_id_seq OWNER TO jovenes;

--
-- Name: home_sponsorclass_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jovenes
--

ALTER SEQUENCE public.home_sponsorclass_id_seq OWNED BY public.home_sponsorclass.id;


--
-- Name: home_transparencia; Type: TABLE; Schema: public; Owner: jovenes
--

CREATE TABLE public.home_transparencia (
    page_ptr_id integer NOT NULL,
    imagen_principal_id integer
);


ALTER TABLE public.home_transparencia OWNER TO jovenes;

--
-- Name: home_video_old; Type: TABLE; Schema: public; Owner: jovenes
--

CREATE TABLE public.home_video_old (
    id integer NOT NULL,
    sort_order integer,
    video_code character varying(70),
    page_id integer NOT NULL
);


ALTER TABLE public.home_video_old OWNER TO jovenes;

--
-- Name: home_video_old_id_seq; Type: SEQUENCE; Schema: public; Owner: jovenes
--

CREATE SEQUENCE public.home_video_old_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.home_video_old_id_seq OWNER TO jovenes;

--
-- Name: home_video_old_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jovenes
--

ALTER SEQUENCE public.home_video_old_id_seq OWNED BY public.home_video_old.id;


--
-- Name: postgres_search_indexentry; Type: TABLE; Schema: public; Owner: jovenes
--

CREATE TABLE public.postgres_search_indexentry (
    id integer NOT NULL,
    object_id text NOT NULL,
    body tsvector NOT NULL,
    content_type_id integer NOT NULL,
    autocomplete tsvector NOT NULL
);


ALTER TABLE public.postgres_search_indexentry OWNER TO jovenes;

--
-- Name: postgres_search_indexentry_id_seq; Type: SEQUENCE; Schema: public; Owner: jovenes
--

CREATE SEQUENCE public.postgres_search_indexentry_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.postgres_search_indexentry_id_seq OWNER TO jovenes;

--
-- Name: postgres_search_indexentry_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jovenes
--

ALTER SEQUENCE public.postgres_search_indexentry_id_seq OWNED BY public.postgres_search_indexentry.id;


--
-- Name: taggit_tag; Type: TABLE; Schema: public; Owner: jovenes
--

CREATE TABLE public.taggit_tag (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL
);


ALTER TABLE public.taggit_tag OWNER TO jovenes;

--
-- Name: taggit_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: jovenes
--

CREATE SEQUENCE public.taggit_tag_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.taggit_tag_id_seq OWNER TO jovenes;

--
-- Name: taggit_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jovenes
--

ALTER SEQUENCE public.taggit_tag_id_seq OWNED BY public.taggit_tag.id;


--
-- Name: taggit_taggeditem; Type: TABLE; Schema: public; Owner: jovenes
--

CREATE TABLE public.taggit_taggeditem (
    id integer NOT NULL,
    object_id integer NOT NULL,
    content_type_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE public.taggit_taggeditem OWNER TO jovenes;

--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE; Schema: public; Owner: jovenes
--

CREATE SEQUENCE public.taggit_taggeditem_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.taggit_taggeditem_id_seq OWNER TO jovenes;

--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jovenes
--

ALTER SEQUENCE public.taggit_taggeditem_id_seq OWNED BY public.taggit_taggeditem.id;


--
-- Name: wagtailcore_collection; Type: TABLE; Schema: public; Owner: jovenes
--

CREATE TABLE public.wagtailcore_collection (
    id integer NOT NULL,
    path character varying(255) COLLATE pg_catalog."C" NOT NULL,
    depth integer NOT NULL,
    numchild integer NOT NULL,
    name character varying(255) NOT NULL,
    CONSTRAINT wagtailcore_collection_depth_check CHECK ((depth >= 0)),
    CONSTRAINT wagtailcore_collection_numchild_check CHECK ((numchild >= 0))
);


ALTER TABLE public.wagtailcore_collection OWNER TO jovenes;

--
-- Name: wagtailcore_collection_id_seq; Type: SEQUENCE; Schema: public; Owner: jovenes
--

CREATE SEQUENCE public.wagtailcore_collection_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailcore_collection_id_seq OWNER TO jovenes;

--
-- Name: wagtailcore_collection_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jovenes
--

ALTER SEQUENCE public.wagtailcore_collection_id_seq OWNED BY public.wagtailcore_collection.id;


--
-- Name: wagtailcore_collectionviewrestriction; Type: TABLE; Schema: public; Owner: jovenes
--

CREATE TABLE public.wagtailcore_collectionviewrestriction (
    id integer NOT NULL,
    restriction_type character varying(20) NOT NULL,
    password character varying(255) NOT NULL,
    collection_id integer NOT NULL
);


ALTER TABLE public.wagtailcore_collectionviewrestriction OWNER TO jovenes;

--
-- Name: wagtailcore_collectionviewrestriction_groups; Type: TABLE; Schema: public; Owner: jovenes
--

CREATE TABLE public.wagtailcore_collectionviewrestriction_groups (
    id integer NOT NULL,
    collectionviewrestriction_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.wagtailcore_collectionviewrestriction_groups OWNER TO jovenes;

--
-- Name: wagtailcore_collectionviewrestriction_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: jovenes
--

CREATE SEQUENCE public.wagtailcore_collectionviewrestriction_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailcore_collectionviewrestriction_groups_id_seq OWNER TO jovenes;

--
-- Name: wagtailcore_collectionviewrestriction_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jovenes
--

ALTER SEQUENCE public.wagtailcore_collectionviewrestriction_groups_id_seq OWNED BY public.wagtailcore_collectionviewrestriction_groups.id;


--
-- Name: wagtailcore_collectionviewrestriction_id_seq; Type: SEQUENCE; Schema: public; Owner: jovenes
--

CREATE SEQUENCE public.wagtailcore_collectionviewrestriction_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailcore_collectionviewrestriction_id_seq OWNER TO jovenes;

--
-- Name: wagtailcore_collectionviewrestriction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jovenes
--

ALTER SEQUENCE public.wagtailcore_collectionviewrestriction_id_seq OWNED BY public.wagtailcore_collectionviewrestriction.id;


--
-- Name: wagtailcore_groupcollectionpermission; Type: TABLE; Schema: public; Owner: jovenes
--

CREATE TABLE public.wagtailcore_groupcollectionpermission (
    id integer NOT NULL,
    collection_id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.wagtailcore_groupcollectionpermission OWNER TO jovenes;

--
-- Name: wagtailcore_groupcollectionpermission_id_seq; Type: SEQUENCE; Schema: public; Owner: jovenes
--

CREATE SEQUENCE public.wagtailcore_groupcollectionpermission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailcore_groupcollectionpermission_id_seq OWNER TO jovenes;

--
-- Name: wagtailcore_groupcollectionpermission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jovenes
--

ALTER SEQUENCE public.wagtailcore_groupcollectionpermission_id_seq OWNED BY public.wagtailcore_groupcollectionpermission.id;


--
-- Name: wagtailcore_grouppagepermission; Type: TABLE; Schema: public; Owner: jovenes
--

CREATE TABLE public.wagtailcore_grouppagepermission (
    id integer NOT NULL,
    permission_type character varying(20) NOT NULL,
    group_id integer NOT NULL,
    page_id integer NOT NULL
);


ALTER TABLE public.wagtailcore_grouppagepermission OWNER TO jovenes;

--
-- Name: wagtailcore_grouppagepermission_id_seq; Type: SEQUENCE; Schema: public; Owner: jovenes
--

CREATE SEQUENCE public.wagtailcore_grouppagepermission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailcore_grouppagepermission_id_seq OWNER TO jovenes;

--
-- Name: wagtailcore_grouppagepermission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jovenes
--

ALTER SEQUENCE public.wagtailcore_grouppagepermission_id_seq OWNED BY public.wagtailcore_grouppagepermission.id;


--
-- Name: wagtailcore_page; Type: TABLE; Schema: public; Owner: jovenes
--

CREATE TABLE public.wagtailcore_page (
    id integer NOT NULL,
    path character varying(255) COLLATE pg_catalog."C" NOT NULL,
    depth integer NOT NULL,
    numchild integer NOT NULL,
    title character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    live boolean NOT NULL,
    has_unpublished_changes boolean NOT NULL,
    url_path text NOT NULL,
    seo_title character varying(255) NOT NULL,
    show_in_menus boolean NOT NULL,
    search_description text NOT NULL,
    go_live_at timestamp with time zone,
    expire_at timestamp with time zone,
    expired boolean NOT NULL,
    content_type_id integer NOT NULL,
    owner_id integer,
    locked boolean NOT NULL,
    latest_revision_created_at timestamp with time zone,
    first_published_at timestamp with time zone,
    live_revision_id integer,
    last_published_at timestamp with time zone,
    draft_title character varying(255) NOT NULL,
    CONSTRAINT wagtailcore_page_depth_check CHECK ((depth >= 0)),
    CONSTRAINT wagtailcore_page_numchild_check CHECK ((numchild >= 0))
);


ALTER TABLE public.wagtailcore_page OWNER TO jovenes;

--
-- Name: wagtailcore_page_id_seq; Type: SEQUENCE; Schema: public; Owner: jovenes
--

CREATE SEQUENCE public.wagtailcore_page_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailcore_page_id_seq OWNER TO jovenes;

--
-- Name: wagtailcore_page_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jovenes
--

ALTER SEQUENCE public.wagtailcore_page_id_seq OWNED BY public.wagtailcore_page.id;


--
-- Name: wagtailcore_pagerevision; Type: TABLE; Schema: public; Owner: jovenes
--

CREATE TABLE public.wagtailcore_pagerevision (
    id integer NOT NULL,
    submitted_for_moderation boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    content_json text NOT NULL,
    approved_go_live_at timestamp with time zone,
    page_id integer NOT NULL,
    user_id integer
);


ALTER TABLE public.wagtailcore_pagerevision OWNER TO jovenes;

--
-- Name: wagtailcore_pagerevision_id_seq; Type: SEQUENCE; Schema: public; Owner: jovenes
--

CREATE SEQUENCE public.wagtailcore_pagerevision_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailcore_pagerevision_id_seq OWNER TO jovenes;

--
-- Name: wagtailcore_pagerevision_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jovenes
--

ALTER SEQUENCE public.wagtailcore_pagerevision_id_seq OWNED BY public.wagtailcore_pagerevision.id;


--
-- Name: wagtailcore_pageviewrestriction; Type: TABLE; Schema: public; Owner: jovenes
--

CREATE TABLE public.wagtailcore_pageviewrestriction (
    id integer NOT NULL,
    password character varying(255) NOT NULL,
    page_id integer NOT NULL,
    restriction_type character varying(20) NOT NULL
);


ALTER TABLE public.wagtailcore_pageviewrestriction OWNER TO jovenes;

--
-- Name: wagtailcore_pageviewrestriction_groups; Type: TABLE; Schema: public; Owner: jovenes
--

CREATE TABLE public.wagtailcore_pageviewrestriction_groups (
    id integer NOT NULL,
    pageviewrestriction_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.wagtailcore_pageviewrestriction_groups OWNER TO jovenes;

--
-- Name: wagtailcore_pageviewrestriction_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: jovenes
--

CREATE SEQUENCE public.wagtailcore_pageviewrestriction_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailcore_pageviewrestriction_groups_id_seq OWNER TO jovenes;

--
-- Name: wagtailcore_pageviewrestriction_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jovenes
--

ALTER SEQUENCE public.wagtailcore_pageviewrestriction_groups_id_seq OWNED BY public.wagtailcore_pageviewrestriction_groups.id;


--
-- Name: wagtailcore_pageviewrestriction_id_seq; Type: SEQUENCE; Schema: public; Owner: jovenes
--

CREATE SEQUENCE public.wagtailcore_pageviewrestriction_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailcore_pageviewrestriction_id_seq OWNER TO jovenes;

--
-- Name: wagtailcore_pageviewrestriction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jovenes
--

ALTER SEQUENCE public.wagtailcore_pageviewrestriction_id_seq OWNED BY public.wagtailcore_pageviewrestriction.id;


--
-- Name: wagtailcore_site; Type: TABLE; Schema: public; Owner: jovenes
--

CREATE TABLE public.wagtailcore_site (
    id integer NOT NULL,
    hostname character varying(255) NOT NULL,
    port integer NOT NULL,
    is_default_site boolean NOT NULL,
    root_page_id integer NOT NULL,
    site_name character varying(255)
);


ALTER TABLE public.wagtailcore_site OWNER TO jovenes;

--
-- Name: wagtailcore_site_id_seq; Type: SEQUENCE; Schema: public; Owner: jovenes
--

CREATE SEQUENCE public.wagtailcore_site_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailcore_site_id_seq OWNER TO jovenes;

--
-- Name: wagtailcore_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jovenes
--

ALTER SEQUENCE public.wagtailcore_site_id_seq OWNED BY public.wagtailcore_site.id;


--
-- Name: wagtaildocs_document; Type: TABLE; Schema: public; Owner: jovenes
--

CREATE TABLE public.wagtaildocs_document (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    file character varying(100) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    uploaded_by_user_id integer,
    collection_id integer NOT NULL,
    file_size integer,
    file_hash character varying(40) NOT NULL,
    CONSTRAINT wagtaildocs_document_file_size_check CHECK ((file_size >= 0))
);


ALTER TABLE public.wagtaildocs_document OWNER TO jovenes;

--
-- Name: wagtaildocs_document_id_seq; Type: SEQUENCE; Schema: public; Owner: jovenes
--

CREATE SEQUENCE public.wagtaildocs_document_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtaildocs_document_id_seq OWNER TO jovenes;

--
-- Name: wagtaildocs_document_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jovenes
--

ALTER SEQUENCE public.wagtaildocs_document_id_seq OWNED BY public.wagtaildocs_document.id;


--
-- Name: wagtailembeds_embed; Type: TABLE; Schema: public; Owner: jovenes
--

CREATE TABLE public.wagtailembeds_embed (
    id integer NOT NULL,
    url character varying(200) NOT NULL,
    max_width smallint,
    type character varying(10) NOT NULL,
    html text NOT NULL,
    title text NOT NULL,
    author_name text NOT NULL,
    provider_name text NOT NULL,
    thumbnail_url character varying(200),
    width integer,
    height integer,
    last_updated timestamp with time zone NOT NULL
);


ALTER TABLE public.wagtailembeds_embed OWNER TO jovenes;

--
-- Name: wagtailembeds_embed_id_seq; Type: SEQUENCE; Schema: public; Owner: jovenes
--

CREATE SEQUENCE public.wagtailembeds_embed_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailembeds_embed_id_seq OWNER TO jovenes;

--
-- Name: wagtailembeds_embed_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jovenes
--

ALTER SEQUENCE public.wagtailembeds_embed_id_seq OWNED BY public.wagtailembeds_embed.id;


--
-- Name: wagtailforms_formsubmission; Type: TABLE; Schema: public; Owner: jovenes
--

CREATE TABLE public.wagtailforms_formsubmission (
    id integer NOT NULL,
    form_data text NOT NULL,
    submit_time timestamp with time zone NOT NULL,
    page_id integer NOT NULL
);


ALTER TABLE public.wagtailforms_formsubmission OWNER TO jovenes;

--
-- Name: wagtailforms_formsubmission_id_seq; Type: SEQUENCE; Schema: public; Owner: jovenes
--

CREATE SEQUENCE public.wagtailforms_formsubmission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailforms_formsubmission_id_seq OWNER TO jovenes;

--
-- Name: wagtailforms_formsubmission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jovenes
--

ALTER SEQUENCE public.wagtailforms_formsubmission_id_seq OWNED BY public.wagtailforms_formsubmission.id;


--
-- Name: wagtailimages_image; Type: TABLE; Schema: public; Owner: jovenes
--

CREATE TABLE public.wagtailimages_image (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    file character varying(100) NOT NULL,
    width integer NOT NULL,
    height integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    focal_point_x integer,
    focal_point_y integer,
    focal_point_width integer,
    focal_point_height integer,
    uploaded_by_user_id integer,
    file_size integer,
    collection_id integer NOT NULL,
    file_hash character varying(40) NOT NULL,
    CONSTRAINT wagtailimages_image_file_size_check CHECK ((file_size >= 0)),
    CONSTRAINT wagtailimages_image_focal_point_height_check CHECK ((focal_point_height >= 0)),
    CONSTRAINT wagtailimages_image_focal_point_width_check CHECK ((focal_point_width >= 0)),
    CONSTRAINT wagtailimages_image_focal_point_x_check CHECK ((focal_point_x >= 0)),
    CONSTRAINT wagtailimages_image_focal_point_y_check CHECK ((focal_point_y >= 0))
);


ALTER TABLE public.wagtailimages_image OWNER TO jovenes;

--
-- Name: wagtailimages_image_id_seq; Type: SEQUENCE; Schema: public; Owner: jovenes
--

CREATE SEQUENCE public.wagtailimages_image_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailimages_image_id_seq OWNER TO jovenes;

--
-- Name: wagtailimages_image_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jovenes
--

ALTER SEQUENCE public.wagtailimages_image_id_seq OWNED BY public.wagtailimages_image.id;


--
-- Name: wagtailimages_rendition; Type: TABLE; Schema: public; Owner: jovenes
--

CREATE TABLE public.wagtailimages_rendition (
    id integer NOT NULL,
    file character varying(100) NOT NULL,
    width integer NOT NULL,
    height integer NOT NULL,
    focal_point_key character varying(16) NOT NULL,
    filter_spec character varying(255) NOT NULL,
    image_id integer NOT NULL
);


ALTER TABLE public.wagtailimages_rendition OWNER TO jovenes;

--
-- Name: wagtailimages_rendition_id_seq; Type: SEQUENCE; Schema: public; Owner: jovenes
--

CREATE SEQUENCE public.wagtailimages_rendition_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailimages_rendition_id_seq OWNER TO jovenes;

--
-- Name: wagtailimages_rendition_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jovenes
--

ALTER SEQUENCE public.wagtailimages_rendition_id_seq OWNED BY public.wagtailimages_rendition.id;


--
-- Name: wagtailredirects_redirect; Type: TABLE; Schema: public; Owner: jovenes
--

CREATE TABLE public.wagtailredirects_redirect (
    id integer NOT NULL,
    old_path character varying(255) NOT NULL,
    is_permanent boolean NOT NULL,
    redirect_link character varying(255) NOT NULL,
    redirect_page_id integer,
    site_id integer
);


ALTER TABLE public.wagtailredirects_redirect OWNER TO jovenes;

--
-- Name: wagtailredirects_redirect_id_seq; Type: SEQUENCE; Schema: public; Owner: jovenes
--

CREATE SEQUENCE public.wagtailredirects_redirect_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailredirects_redirect_id_seq OWNER TO jovenes;

--
-- Name: wagtailredirects_redirect_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jovenes
--

ALTER SEQUENCE public.wagtailredirects_redirect_id_seq OWNED BY public.wagtailredirects_redirect.id;


--
-- Name: wagtailsearch_editorspick; Type: TABLE; Schema: public; Owner: jovenes
--

CREATE TABLE public.wagtailsearch_editorspick (
    id integer NOT NULL,
    sort_order integer,
    description text NOT NULL,
    page_id integer NOT NULL,
    query_id integer NOT NULL
);


ALTER TABLE public.wagtailsearch_editorspick OWNER TO jovenes;

--
-- Name: wagtailsearch_editorspick_id_seq; Type: SEQUENCE; Schema: public; Owner: jovenes
--

CREATE SEQUENCE public.wagtailsearch_editorspick_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailsearch_editorspick_id_seq OWNER TO jovenes;

--
-- Name: wagtailsearch_editorspick_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jovenes
--

ALTER SEQUENCE public.wagtailsearch_editorspick_id_seq OWNED BY public.wagtailsearch_editorspick.id;


--
-- Name: wagtailsearch_query; Type: TABLE; Schema: public; Owner: jovenes
--

CREATE TABLE public.wagtailsearch_query (
    id integer NOT NULL,
    query_string character varying(255) NOT NULL
);


ALTER TABLE public.wagtailsearch_query OWNER TO jovenes;

--
-- Name: wagtailsearch_query_id_seq; Type: SEQUENCE; Schema: public; Owner: jovenes
--

CREATE SEQUENCE public.wagtailsearch_query_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailsearch_query_id_seq OWNER TO jovenes;

--
-- Name: wagtailsearch_query_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jovenes
--

ALTER SEQUENCE public.wagtailsearch_query_id_seq OWNED BY public.wagtailsearch_query.id;


--
-- Name: wagtailsearch_querydailyhits; Type: TABLE; Schema: public; Owner: jovenes
--

CREATE TABLE public.wagtailsearch_querydailyhits (
    id integer NOT NULL,
    date date NOT NULL,
    hits integer NOT NULL,
    query_id integer NOT NULL
);


ALTER TABLE public.wagtailsearch_querydailyhits OWNER TO jovenes;

--
-- Name: wagtailsearch_querydailyhits_id_seq; Type: SEQUENCE; Schema: public; Owner: jovenes
--

CREATE SEQUENCE public.wagtailsearch_querydailyhits_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailsearch_querydailyhits_id_seq OWNER TO jovenes;

--
-- Name: wagtailsearch_querydailyhits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jovenes
--

ALTER SEQUENCE public.wagtailsearch_querydailyhits_id_seq OWNED BY public.wagtailsearch_querydailyhits.id;


--
-- Name: wagtailusers_userprofile; Type: TABLE; Schema: public; Owner: jovenes
--

CREATE TABLE public.wagtailusers_userprofile (
    id integer NOT NULL,
    submitted_notifications boolean NOT NULL,
    approved_notifications boolean NOT NULL,
    rejected_notifications boolean NOT NULL,
    user_id integer NOT NULL,
    preferred_language character varying(10) NOT NULL,
    current_time_zone character varying(40) NOT NULL,
    avatar character varying(100) NOT NULL
);


ALTER TABLE public.wagtailusers_userprofile OWNER TO jovenes;

--
-- Name: wagtailusers_userprofile_id_seq; Type: SEQUENCE; Schema: public; Owner: jovenes
--

CREATE SEQUENCE public.wagtailusers_userprofile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailusers_userprofile_id_seq OWNER TO jovenes;

--
-- Name: wagtailusers_userprofile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jovenes
--

ALTER SEQUENCE public.wagtailusers_userprofile_id_seq OWNED BY public.wagtailusers_userprofile.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: home_alianza id; Type: DEFAULT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.home_alianza ALTER COLUMN id SET DEFAULT nextval('public.home_alianza_id_seq'::regclass);


--
-- Name: home_homegalleryimage id; Type: DEFAULT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.home_homegalleryimage ALTER COLUMN id SET DEFAULT nextval('public.home_homegalleryimage_id_seq'::regclass);


--
-- Name: home_memoria id; Type: DEFAULT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.home_memoria ALTER COLUMN id SET DEFAULT nextval('public.home_memoria_id_seq'::regclass);


--
-- Name: home_noticiagalleryimage id; Type: DEFAULT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.home_noticiagalleryimage ALTER COLUMN id SET DEFAULT nextval('public.home_noticiagalleryimage_id_seq'::regclass);


--
-- Name: home_sponsorclass id; Type: DEFAULT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.home_sponsorclass ALTER COLUMN id SET DEFAULT nextval('public.home_sponsorclass_id_seq'::regclass);


--
-- Name: home_video_old id; Type: DEFAULT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.home_video_old ALTER COLUMN id SET DEFAULT nextval('public.home_video_old_id_seq'::regclass);


--
-- Name: postgres_search_indexentry id; Type: DEFAULT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.postgres_search_indexentry ALTER COLUMN id SET DEFAULT nextval('public.postgres_search_indexentry_id_seq'::regclass);


--
-- Name: taggit_tag id; Type: DEFAULT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.taggit_tag ALTER COLUMN id SET DEFAULT nextval('public.taggit_tag_id_seq'::regclass);


--
-- Name: taggit_taggeditem id; Type: DEFAULT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.taggit_taggeditem ALTER COLUMN id SET DEFAULT nextval('public.taggit_taggeditem_id_seq'::regclass);


--
-- Name: wagtailcore_collection id; Type: DEFAULT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.wagtailcore_collection ALTER COLUMN id SET DEFAULT nextval('public.wagtailcore_collection_id_seq'::regclass);


--
-- Name: wagtailcore_collectionviewrestriction id; Type: DEFAULT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.wagtailcore_collectionviewrestriction ALTER COLUMN id SET DEFAULT nextval('public.wagtailcore_collectionviewrestriction_id_seq'::regclass);


--
-- Name: wagtailcore_collectionviewrestriction_groups id; Type: DEFAULT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.wagtailcore_collectionviewrestriction_groups ALTER COLUMN id SET DEFAULT nextval('public.wagtailcore_collectionviewrestriction_groups_id_seq'::regclass);


--
-- Name: wagtailcore_groupcollectionpermission id; Type: DEFAULT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.wagtailcore_groupcollectionpermission ALTER COLUMN id SET DEFAULT nextval('public.wagtailcore_groupcollectionpermission_id_seq'::regclass);


--
-- Name: wagtailcore_grouppagepermission id; Type: DEFAULT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.wagtailcore_grouppagepermission ALTER COLUMN id SET DEFAULT nextval('public.wagtailcore_grouppagepermission_id_seq'::regclass);


--
-- Name: wagtailcore_page id; Type: DEFAULT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.wagtailcore_page ALTER COLUMN id SET DEFAULT nextval('public.wagtailcore_page_id_seq'::regclass);


--
-- Name: wagtailcore_pagerevision id; Type: DEFAULT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.wagtailcore_pagerevision ALTER COLUMN id SET DEFAULT nextval('public.wagtailcore_pagerevision_id_seq'::regclass);


--
-- Name: wagtailcore_pageviewrestriction id; Type: DEFAULT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.wagtailcore_pageviewrestriction ALTER COLUMN id SET DEFAULT nextval('public.wagtailcore_pageviewrestriction_id_seq'::regclass);


--
-- Name: wagtailcore_pageviewrestriction_groups id; Type: DEFAULT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.wagtailcore_pageviewrestriction_groups ALTER COLUMN id SET DEFAULT nextval('public.wagtailcore_pageviewrestriction_groups_id_seq'::regclass);


--
-- Name: wagtailcore_site id; Type: DEFAULT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.wagtailcore_site ALTER COLUMN id SET DEFAULT nextval('public.wagtailcore_site_id_seq'::regclass);


--
-- Name: wagtaildocs_document id; Type: DEFAULT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.wagtaildocs_document ALTER COLUMN id SET DEFAULT nextval('public.wagtaildocs_document_id_seq'::regclass);


--
-- Name: wagtailembeds_embed id; Type: DEFAULT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.wagtailembeds_embed ALTER COLUMN id SET DEFAULT nextval('public.wagtailembeds_embed_id_seq'::regclass);


--
-- Name: wagtailforms_formsubmission id; Type: DEFAULT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.wagtailforms_formsubmission ALTER COLUMN id SET DEFAULT nextval('public.wagtailforms_formsubmission_id_seq'::regclass);


--
-- Name: wagtailimages_image id; Type: DEFAULT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.wagtailimages_image ALTER COLUMN id SET DEFAULT nextval('public.wagtailimages_image_id_seq'::regclass);


--
-- Name: wagtailimages_rendition id; Type: DEFAULT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.wagtailimages_rendition ALTER COLUMN id SET DEFAULT nextval('public.wagtailimages_rendition_id_seq'::regclass);


--
-- Name: wagtailredirects_redirect id; Type: DEFAULT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.wagtailredirects_redirect ALTER COLUMN id SET DEFAULT nextval('public.wagtailredirects_redirect_id_seq'::regclass);


--
-- Name: wagtailsearch_editorspick id; Type: DEFAULT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.wagtailsearch_editorspick ALTER COLUMN id SET DEFAULT nextval('public.wagtailsearch_editorspick_id_seq'::regclass);


--
-- Name: wagtailsearch_query id; Type: DEFAULT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.wagtailsearch_query ALTER COLUMN id SET DEFAULT nextval('public.wagtailsearch_query_id_seq'::regclass);


--
-- Name: wagtailsearch_querydailyhits id; Type: DEFAULT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.wagtailsearch_querydailyhits ALTER COLUMN id SET DEFAULT nextval('public.wagtailsearch_querydailyhits_id_seq'::regclass);


--
-- Name: wagtailusers_userprofile id; Type: DEFAULT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.wagtailusers_userprofile ALTER COLUMN id SET DEFAULT nextval('public.wagtailusers_userprofile_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: jovenes
--

COPY public.auth_group (id, name) FROM stdin;
1	Moderators
2	Editors
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: jovenes
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
15	1	1
16	1	2
17	1	3
18	1	4
19	1	5
20	1	6
21	1	7
22	2	1
23	2	2
24	2	3
25	2	4
26	2	5
27	2	6
28	2	7
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: jovenes
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can access Wagtail admin	3	access_admin
2	Can add document	4	add_document
3	Can change document	4	change_document
4	Can delete document	4	delete_document
5	Can add image	5	add_image
6	Can change image	5	change_image
7	Can delete image	5	delete_image
8	Can add home page	2	add_homepage
9	Can change home page	2	change_homepage
10	Can delete home page	2	delete_homepage
11	Can view home page	2	view_homepage
12	Can add form submission	6	add_formsubmission
13	Can change form submission	6	change_formsubmission
14	Can delete form submission	6	delete_formsubmission
15	Can view form submission	6	view_formsubmission
16	Can add redirect	7	add_redirect
17	Can change redirect	7	change_redirect
18	Can delete redirect	7	delete_redirect
19	Can view redirect	7	view_redirect
20	Can add embed	8	add_embed
21	Can change embed	8	change_embed
22	Can delete embed	8	delete_embed
23	Can view embed	8	view_embed
24	Can add user profile	9	add_userprofile
25	Can change user profile	9	change_userprofile
26	Can delete user profile	9	delete_userprofile
27	Can view user profile	9	view_userprofile
28	Can view document	4	view_document
29	Can view image	5	view_image
30	Can add rendition	10	add_rendition
31	Can change rendition	10	change_rendition
32	Can delete rendition	10	delete_rendition
33	Can view rendition	10	view_rendition
34	Can add query	11	add_query
35	Can change query	11	change_query
36	Can delete query	11	delete_query
37	Can view query	11	view_query
38	Can add Query Daily Hits	12	add_querydailyhits
39	Can change Query Daily Hits	12	change_querydailyhits
40	Can delete Query Daily Hits	12	delete_querydailyhits
41	Can view Query Daily Hits	12	view_querydailyhits
42	Can add page view restriction	13	add_pageviewrestriction
43	Can change page view restriction	13	change_pageviewrestriction
44	Can delete page view restriction	13	delete_pageviewrestriction
45	Can view page view restriction	13	view_pageviewrestriction
46	Can add collection	14	add_collection
47	Can change collection	14	change_collection
48	Can delete collection	14	delete_collection
49	Can view collection	14	view_collection
50	Can add group collection permission	15	add_groupcollectionpermission
51	Can change group collection permission	15	change_groupcollectionpermission
52	Can delete group collection permission	15	delete_groupcollectionpermission
53	Can view group collection permission	15	view_groupcollectionpermission
54	Can add collection view restriction	16	add_collectionviewrestriction
55	Can change collection view restriction	16	change_collectionviewrestriction
56	Can delete collection view restriction	16	delete_collectionviewrestriction
57	Can view collection view restriction	16	view_collectionviewrestriction
58	Can add site	17	add_site
59	Can change site	17	change_site
60	Can delete site	17	delete_site
61	Can view site	17	view_site
62	Can add page revision	18	add_pagerevision
63	Can change page revision	18	change_pagerevision
64	Can delete page revision	18	delete_pagerevision
65	Can view page revision	18	view_pagerevision
66	Can add page	1	add_page
67	Can change page	1	change_page
68	Can delete page	1	delete_page
69	Can view page	1	view_page
70	Can add group page permission	19	add_grouppagepermission
71	Can change group page permission	19	change_grouppagepermission
72	Can delete group page permission	19	delete_grouppagepermission
73	Can view group page permission	19	view_grouppagepermission
74	Can add Tag	20	add_tag
75	Can change Tag	20	change_tag
76	Can delete Tag	20	delete_tag
77	Can view Tag	20	view_tag
78	Can add Tagged Item	21	add_taggeditem
79	Can change Tagged Item	21	change_taggeditem
80	Can delete Tagged Item	21	delete_taggeditem
81	Can view Tagged Item	21	view_taggeditem
82	Can add log entry	22	add_logentry
83	Can change log entry	22	change_logentry
84	Can delete log entry	22	delete_logentry
85	Can view log entry	22	view_logentry
86	Can add permission	23	add_permission
87	Can change permission	23	change_permission
88	Can delete permission	23	delete_permission
89	Can view permission	23	view_permission
90	Can add user	24	add_user
91	Can change user	24	change_user
92	Can delete user	24	delete_user
93	Can view user	24	view_user
94	Can add group	25	add_group
95	Can change group	25	change_group
96	Can delete group	25	delete_group
97	Can view group	25	view_group
98	Can add content type	26	add_contenttype
99	Can change content type	26	change_contenttype
100	Can delete content type	26	delete_contenttype
101	Can view content type	26	view_contenttype
102	Can add session	27	add_session
103	Can change session	27	change_session
104	Can delete session	27	delete_session
105	Can view session	27	view_session
106	Can add Blog Noticias	28	add_noticias
107	Can change Blog Noticias	28	change_noticias
108	Can delete Blog Noticias	28	delete_noticias
109	Can view Blog Noticias	28	view_noticias
110	Can add slider	29	add_slider
111	Can change slider	29	change_slider
112	Can delete slider	29	delete_slider
113	Can view slider	29	view_slider
114	Can add noticia gallery image	30	add_noticiagalleryimage
115	Can change noticia gallery image	30	change_noticiagalleryimage
116	Can delete noticia gallery image	30	delete_noticiagalleryimage
117	Can view noticia gallery image	30	view_noticiagalleryimage
118	Can add Noticia	31	add_noticia
119	Can change Noticia	31	change_noticia
120	Can delete Noticia	31	delete_noticia
121	Can view Noticia	31	view_noticia
122	Can add 'Nosotros'	32	add_nosotros
123	Can change 'Nosotros'	32	change_nosotros
124	Can delete 'Nosotros'	32	delete_nosotros
125	Can view 'Nosotros'	32	view_nosotros
126	Can add 'Transparencia'	33	add_transparencia
127	Can change 'Transparencia'	33	change_transparencia
128	Can delete 'Transparencia'	33	delete_transparencia
129	Can view 'Transparencia'	33	view_transparencia
130	Can add 'Nosotros'	34	add_quehacemos
131	Can change 'Nosotros'	34	change_quehacemos
132	Can delete 'Nosotros'	34	delete_quehacemos
133	Can view 'Nosotros'	34	view_quehacemos
134	Can add 'Quienes Somos'	35	add_quienessomos
135	Can change 'Quienes Somos'	35	change_quienessomos
136	Can delete 'Quienes Somos'	35	delete_quienessomos
137	Can view 'Quienes Somos'	35	view_quienessomos
138	Can add 'DondeEstamos'	36	add_dondeestamos
139	Can change 'DondeEstamos'	36	change_dondeestamos
140	Can delete 'DondeEstamos'	36	delete_dondeestamos
141	Can view 'DondeEstamos'	36	view_dondeestamos
142	Can add 'Ayuda Difundiendo'	37	add_ayudadifundiendo
143	Can change 'Ayuda Difundiendo'	37	change_ayudadifundiendo
144	Can delete 'Ayuda Difundiendo'	37	delete_ayudadifundiendo
145	Can view 'Ayuda Difundiendo'	37	view_ayudadifundiendo
146	Can add 'Carrera'	38	add_carrera
147	Can change 'Carrera'	38	change_carrera
148	Can delete 'Carrera'	38	delete_carrera
149	Can view 'Carrera'	38	view_carrera
150	Can add 'QuieroDonar'	39	add_quierodonar
151	Can change 'QuieroDonar'	39	change_quierodonar
152	Can delete 'QuieroDonar'	39	delete_quierodonar
153	Can view 'QuieroDonar'	39	view_quierodonar
154	Can add 'Legado'	40	add_legado
155	Can change 'Legado'	40	change_legado
156	Can delete 'Legado'	40	delete_legado
157	Can view 'Legado'	40	view_legado
158	Can add 'Donde Estamos'	41	add_alianzas
159	Can change 'Donde Estamos'	41	change_alianzas
160	Can delete 'Donde Estamos'	41	delete_alianzas
161	Can view 'Donde Estamos'	41	view_alianzas
162	Can add 'App'	42	add_app
163	Can change 'App'	42	change_app
164	Can delete 'App'	42	delete_app
165	Can view 'App'	42	view_app
166	Can add 'DondeEstamos'	43	add_comocolaborar
167	Can change 'DondeEstamos'	43	change_comocolaborar
168	Can delete 'DondeEstamos'	43	delete_comocolaborar
169	Can view 'DondeEstamos'	43	view_comocolaborar
170	Can add sponsor	44	add_sponsor
171	Can change sponsor	44	change_sponsor
172	Can delete sponsor	44	delete_sponsor
173	Can view sponsor	44	view_sponsor
174	Can add sponsor app	45	add_sponsorapp
175	Can change sponsor app	45	change_sponsorapp
176	Can delete sponsor app	45	delete_sponsorapp
177	Can view sponsor app	45	view_sponsorapp
178	Can add sponsor class	46	add_sponsorclass
179	Can change sponsor class	46	change_sponsorclass
180	Can delete sponsor class	46	delete_sponsorclass
181	Can view sponsor class	46	view_sponsorclass
182	Can add sponsor carrera	47	add_sponsorcarrera
183	Can change sponsor carrera	47	change_sponsorcarrera
184	Can delete sponsor carrera	47	delete_sponsorcarrera
185	Can view sponsor carrera	47	view_sponsorcarrera
186	Can add video_ old	48	add_video_old
187	Can change video_ old	48	change_video_old
188	Can delete video_ old	48	delete_video_old
189	Can view video_ old	48	view_video_old
190	Can add Carrera	49	add_carreras
191	Can change Carrera	49	change_carreras
192	Can delete Carrera	49	delete_carreras
193	Can view Carrera	49	view_carreras
194	Can add alianza	50	add_alianza
195	Can change alianza	50	change_alianza
196	Can delete alianza	50	delete_alianza
197	Can view alianza	50	view_alianza
198	Can add memoria	51	add_memoria
199	Can change memoria	51	change_memoria
200	Can delete memoria	51	delete_memoria
201	Can view memoria	51	view_memoria
202	Can add index entry	52	add_indexentry
203	Can change index entry	52	change_indexentry
204	Can delete index entry	52	delete_indexentry
205	Can view index entry	52	view_indexentry
206	Can add home gallery image	53	add_homegalleryimage
207	Can change home gallery image	53	change_homegalleryimage
208	Can delete home gallery image	53	delete_homegalleryimage
209	Can view home gallery image	53	view_homegalleryimage
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: jovenes
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$120000$lMR1oKATyZzD$01pf8DPnzip4lPfWsRUxsWvkXCyxNMNjCI+ZF0QcOj0=	2019-03-18 13:45:13.824-03	t	porlosjovenes				t	t	2019-03-18 13:44:18.08-03
3	pbkdf2_sha256$120000$hALFCZBBQbud$KMM/zxZh7qoN0qi/M9lQ7PfrJWhRCv7GI3Z9Etd2ylY=	2019-04-21 05:27:37.585685-03	t	admin				t	t	2019-04-04 11:22:10.674-03
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: jovenes
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: jovenes
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: jovenes
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: jovenes
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	wagtailcore	page
2	home	homepage
3	wagtailadmin	admin
4	wagtaildocs	document
5	wagtailimages	image
6	wagtailforms	formsubmission
7	wagtailredirects	redirect
8	wagtailembeds	embed
9	wagtailusers	userprofile
10	wagtailimages	rendition
11	wagtailsearch	query
12	wagtailsearch	querydailyhits
13	wagtailcore	pageviewrestriction
14	wagtailcore	collection
15	wagtailcore	groupcollectionpermission
16	wagtailcore	collectionviewrestriction
17	wagtailcore	site
18	wagtailcore	pagerevision
19	wagtailcore	grouppagepermission
20	taggit	tag
21	taggit	taggeditem
22	admin	logentry
23	auth	permission
24	auth	user
25	auth	group
26	contenttypes	contenttype
27	sessions	session
28	home	noticias
29	home	slider
30	home	noticiagalleryimage
31	home	noticia
32	home	nosotros
33	home	transparencia
34	home	quehacemos
35	home	quienessomos
36	home	dondeestamos
37	home	ayudadifundiendo
38	home	carrera
39	home	quierodonar
40	home	legado
41	home	alianzas
42	home	app
43	home	comocolaborar
44	home	sponsor
45	home	sponsorapp
46	home	sponsorclass
47	home	sponsorcarrera
48	home	video_old
49	home	carreras
50	home	alianza
51	home	memoria
52	postgres_search	indexentry
53	home	homegalleryimage
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: jovenes
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2019-04-21 03:29:27.219971-03
2	auth	0001_initial	2019-04-21 03:29:27.424651-03
3	admin	0001_initial	2019-04-21 03:29:27.518395-03
4	admin	0002_logentry_remove_auto_add	2019-04-21 03:29:27.531227-03
5	admin	0003_logentry_add_action_flag_choices	2019-04-21 03:29:27.543202-03
6	contenttypes	0002_remove_content_type_name	2019-04-21 03:29:27.570871-03
7	auth	0002_alter_permission_name_max_length	2019-04-21 03:29:27.579332-03
8	auth	0003_alter_user_email_max_length	2019-04-21 03:29:27.592771-03
9	auth	0004_alter_user_username_opts	2019-04-21 03:29:27.605031-03
10	auth	0005_alter_user_last_login_null	2019-04-21 03:29:27.617611-03
11	auth	0006_require_contenttypes_0002	2019-04-21 03:29:27.620685-03
12	auth	0007_alter_validators_add_error_messages	2019-04-21 03:29:27.630591-03
13	auth	0008_alter_user_username_max_length	2019-04-21 03:29:27.651755-03
14	auth	0009_alter_user_last_name_max_length	2019-04-21 03:29:27.662908-03
15	wagtailcore	0001_initial	2019-04-21 03:29:28.093619-03
16	wagtailcore	0002_initial_data	2019-04-21 03:29:28.097029-03
17	wagtailcore	0003_add_uniqueness_constraint_on_group_page_permission	2019-04-21 03:29:28.100334-03
18	wagtailcore	0004_page_locked	2019-04-21 03:29:28.103286-03
19	wagtailcore	0005_add_page_lock_permission_to_moderators	2019-04-21 03:29:28.106056-03
20	wagtailcore	0006_add_lock_page_permission	2019-04-21 03:29:28.10867-03
21	wagtailcore	0007_page_latest_revision_created_at	2019-04-21 03:29:28.111368-03
22	wagtailcore	0008_populate_latest_revision_created_at	2019-04-21 03:29:28.114306-03
23	wagtailcore	0009_remove_auto_now_add_from_pagerevision_created_at	2019-04-21 03:29:28.117285-03
24	wagtailcore	0010_change_page_owner_to_null_on_delete	2019-04-21 03:29:28.120284-03
25	wagtailcore	0011_page_first_published_at	2019-04-21 03:29:28.122996-03
26	wagtailcore	0012_extend_page_slug_field	2019-04-21 03:29:28.125622-03
27	wagtailcore	0013_update_golive_expire_help_text	2019-04-21 03:29:28.128487-03
28	wagtailcore	0014_add_verbose_name	2019-04-21 03:29:28.131188-03
29	wagtailcore	0015_add_more_verbose_names	2019-04-21 03:29:28.13379-03
30	wagtailcore	0016_change_page_url_path_to_text_field	2019-04-21 03:29:28.136485-03
31	wagtailcore	0017_change_edit_page_permission_description	2019-04-21 03:29:28.161289-03
32	wagtailcore	0018_pagerevision_submitted_for_moderation_index	2019-04-21 03:29:28.193133-03
33	wagtailcore	0019_verbose_names_cleanup	2019-04-21 03:29:28.259508-03
34	wagtailcore	0020_add_index_on_page_first_published_at	2019-04-21 03:29:28.285679-03
35	wagtailcore	0021_capitalizeverbose	2019-04-21 03:29:28.732276-03
36	wagtailcore	0022_add_site_name	2019-04-21 03:29:28.754918-03
37	wagtailcore	0023_alter_page_revision_on_delete_behaviour	2019-04-21 03:29:28.777329-03
38	wagtailcore	0024_collection	2019-04-21 03:29:28.81846-03
39	wagtailcore	0025_collection_initial_data	2019-04-21 03:29:28.838522-03
40	wagtailcore	0026_group_collection_permission	2019-04-21 03:29:28.90608-03
41	taggit	0001_initial	2019-04-21 03:29:29.000519-03
42	wagtailimages	0001_initial	2019-04-21 03:29:29.177593-03
43	wagtailimages	0002_initial_data	2019-04-21 03:29:29.180742-03
44	wagtailimages	0003_fix_focal_point_fields	2019-04-21 03:29:29.183562-03
45	wagtailimages	0004_make_focal_point_key_not_nullable	2019-04-21 03:29:29.186971-03
46	wagtailimages	0005_make_filter_spec_unique	2019-04-21 03:29:29.189788-03
47	wagtailimages	0006_add_verbose_names	2019-04-21 03:29:29.192787-03
48	wagtailimages	0007_image_file_size	2019-04-21 03:29:29.195748-03
49	wagtailimages	0008_image_created_at_index	2019-04-21 03:29:29.198545-03
50	wagtailimages	0009_capitalizeverbose	2019-04-21 03:29:29.201202-03
51	wagtailimages	0010_change_on_delete_behaviour	2019-04-21 03:29:29.203768-03
52	wagtailimages	0011_image_collection	2019-04-21 03:29:29.206233-03
53	wagtailimages	0012_copy_image_permissions_to_collections	2019-04-21 03:29:29.208685-03
54	wagtailimages	0013_make_rendition_upload_callable	2019-04-21 03:29:29.211111-03
55	wagtailimages	0014_add_filter_spec_field	2019-04-21 03:29:29.213518-03
56	wagtailimages	0015_fill_filter_spec_field	2019-04-21 03:29:29.216141-03
57	wagtailimages	0016_deprecate_rendition_filter_relation	2019-04-21 03:29:29.218708-03
58	wagtailimages	0017_reduce_focal_point_key_max_length	2019-04-21 03:29:29.221039-03
59	wagtailimages	0018_remove_rendition_filter	2019-04-21 03:29:29.223404-03
60	wagtailimages	0019_delete_filter	2019-04-21 03:29:29.225722-03
61	wagtailimages	0020_add-verbose-name	2019-04-21 03:29:29.228089-03
62	wagtailimages	0021_image_file_hash	2019-04-21 03:29:29.230296-03
63	wagtailredirects	0001_initial	2019-04-21 03:29:29.31419-03
64	wagtailredirects	0002_add_verbose_names	2019-04-21 03:29:29.36653-03
65	wagtailredirects	0003_make_site_field_editable	2019-04-21 03:29:29.399426-03
66	wagtailredirects	0004_set_unique_on_path_and_site	2019-04-21 03:29:29.447842-03
67	wagtailredirects	0005_capitalizeverbose	2019-04-21 03:29:29.539556-03
68	wagtailredirects	0006_redirect_increase_max_length	2019-04-21 03:29:29.56389-03
69	wagtailforms	0001_initial	2019-04-21 03:29:29.619266-03
70	wagtailforms	0002_add_verbose_names	2019-04-21 03:29:29.644738-03
71	wagtailforms	0003_capitalizeverbose	2019-04-21 03:29:29.66919-03
72	wagtailcore	0027_fix_collection_path_collation	2019-04-21 03:29:29.711464-03
73	wagtailcore	0024_alter_page_content_type_on_delete_behaviour	2019-04-21 03:29:29.740379-03
74	wagtailcore	0028_merge	2019-04-21 03:29:29.743442-03
75	wagtailcore	0029_unicode_slugfield_dj19	2019-04-21 03:29:29.762571-03
76	wagtailcore	0030_index_on_pagerevision_created_at	2019-04-21 03:29:29.792688-03
77	wagtailcore	0031_add_page_view_restriction_types	2019-04-21 03:29:29.877469-03
78	wagtailcore	0032_add_bulk_delete_page_permission	2019-04-21 03:29:29.898478-03
79	wagtailcore	0033_remove_golive_expiry_help_text	2019-04-21 03:29:29.933646-03
80	wagtailcore	0034_page_live_revision	2019-04-21 03:29:29.965221-03
81	wagtailcore	0035_page_last_published_at	2019-04-21 03:29:29.989565-03
82	wagtailcore	0036_populate_page_last_published_at	2019-04-21 03:29:30.015745-03
83	wagtailcore	0037_set_page_owner_editable	2019-04-21 03:29:30.042283-03
84	wagtailcore	0038_make_first_published_at_editable	2019-04-21 03:29:30.119876-03
85	wagtailcore	0039_collectionviewrestriction	2019-04-21 03:29:30.223335-03
86	wagtailcore	0040_page_draft_title	2019-04-21 03:29:30.286194-03
87	wagtailcore	0041_group_collection_permissions_verbose_name_plural	2019-04-21 03:29:30.309489-03
88	wagtaildocs	0001_initial	2019-04-21 03:29:30.356947-03
89	wagtaildocs	0002_initial_data	2019-04-21 03:29:30.401517-03
90	wagtaildocs	0003_add_verbose_names	2019-04-21 03:29:30.455087-03
91	wagtaildocs	0004_capitalizeverbose	2019-04-21 03:29:30.552223-03
92	wagtaildocs	0005_document_collection	2019-04-21 03:29:30.586404-03
93	wagtaildocs	0006_copy_document_permissions_to_collections	2019-04-21 03:29:30.625205-03
94	wagtaildocs	0005_alter_uploaded_by_user_on_delete_action	2019-04-21 03:29:30.64935-03
95	wagtaildocs	0007_merge	2019-04-21 03:29:30.652122-03
96	wagtaildocs	0008_document_file_size	2019-04-21 03:29:30.672841-03
97	wagtaildocs	0009_document_verbose_name_plural	2019-04-21 03:29:30.692319-03
98	wagtaildocs	0010_document_file_hash	2019-04-21 03:29:30.71548-03
99	home	0001_initial	2019-04-21 03:29:30.745563-03
100	home	0002_create_homepage	2019-04-21 03:29:30.795241-03
101	home	0003_auto_20190404_1323	2019-04-21 03:29:30.880255-03
102	home	0004_auto_20190408_1814	2019-04-21 03:29:30.987133-03
103	home	0005_slider	2019-04-21 03:29:31.018098-03
104	home	0006_noticia_noticiagalleryimage	2019-04-21 03:29:31.172836-03
105	home	0007_nosotros	2019-04-21 03:29:31.205285-03
106	home	0008_dondeestamos_quehacemos_quienessomos_transparencia	2019-04-21 03:29:31.312136-03
107	home	0009_auto_20190410_0731	2019-04-21 03:29:31.527122-03
108	home	0010_auto_20190410_0926	2019-04-21 03:29:31.625192-03
109	home	0011_app_video_url	2019-04-21 03:29:31.646331-03
110	home	0012_auto_20190410_1345	2019-04-21 03:29:31.688997-03
111	home	0013_carrera_video_code	2019-04-21 03:29:31.710463-03
112	home	0014_auto_20190410_1521	2019-04-21 03:29:31.840383-03
113	home	0015_auto_20190410_1548	2019-04-21 03:29:31.949265-03
114	home	0016_auto_20190410_1548	2019-04-21 03:29:32.127442-03
115	home	0017_auto_20190410_1721	2019-04-21 03:29:32.360724-03
116	home	0018_auto_20190410_1740	2019-04-21 03:29:32.450408-03
117	home	0019_auto_20190410_1748	2019-04-21 03:29:32.476942-03
118	home	0020_auto_20190410_1844	2019-04-21 03:29:32.542698-03
119	home	0021_auto_20190410_1902	2019-04-21 03:29:32.599873-03
120	home	0022_auto_20190410_1910	2019-04-21 03:29:32.622535-03
121	home	0023_auto_20190410_1942	2019-04-21 03:29:32.706088-03
122	home	0024_auto_20190410_2056	2019-04-21 03:29:32.792715-03
123	home	0025_auto_20190410_2257	2019-04-21 03:29:32.880806-03
124	home	0026_auto_20190411_0032	2019-04-21 03:29:32.988599-03
125	home	0027_ayudadifundiendo_imagen_principal	2019-04-21 03:29:33.118987-03
126	home	0028_quierodonar_imagen_principal	2019-04-21 03:29:33.167611-03
127	home	0029_auto_20190411_0118	2019-04-21 03:29:33.219864-03
128	home	0030_auto_20190411_0134	2019-04-21 03:29:33.271061-03
129	home	0031_auto_20190411_0143	2019-04-21 03:29:33.333951-03
130	home	0032_auto_20190411_0214	2019-04-21 03:29:33.428759-03
131	home	0033_alianzas_nota_pie	2019-04-21 03:29:33.480822-03
132	home	0034_auto_20190411_0333	2019-04-21 03:29:33.936942-03
133	home	0035_auto_20190411_0351	2019-04-21 03:29:34.09846-03
134	home	0036_quienessomos_imagen_principal	2019-04-21 03:29:34.151569-03
135	home	0037_auto_20190411_0436	2019-04-21 03:29:34.244406-03
136	home	0038_memoria_memoria_url	2019-04-21 03:29:34.26348-03
137	home	0039_auto_20190411_0507	2019-04-21 03:29:34.309642-03
138	home	0040_auto_20190411_0545	2019-04-21 03:29:34.325461-03
139	home	0041_auto_20190411_0600	2019-04-21 03:29:34.358917-03
140	home	0042_auto_20190411_0600	2019-04-21 03:29:34.391861-03
141	home	0043_noticia_categoria	2019-04-21 03:29:34.410684-03
142	home	0044_auto_20190411_1351	2019-04-21 03:29:34.429581-03
143	home	0045_auto_20190411_1722	2019-04-21 03:29:34.481287-03
144	postgres_search	0001_initial	2019-04-21 03:29:34.546926-03
145	postgres_search	0002_add_autocomplete	2019-04-21 03:29:34.602714-03
146	sessions	0001_initial	2019-04-21 03:29:34.645522-03
147	taggit	0002_auto_20150616_2121	2019-04-21 03:29:34.673444-03
148	wagtailadmin	0001_create_admin_access_permissions	2019-04-21 03:29:34.73398-03
149	wagtailembeds	0001_initial	2019-04-21 03:29:34.769102-03
150	wagtailembeds	0002_add_verbose_names	2019-04-21 03:29:34.779286-03
151	wagtailembeds	0003_capitalizeverbose	2019-04-21 03:29:34.78709-03
152	wagtailembeds	0004_embed_verbose_name_plural	2019-04-21 03:29:34.795342-03
153	wagtailsearch	0001_initial	2019-04-21 03:29:34.924066-03
154	wagtailsearch	0002_add_verbose_names	2019-04-21 03:29:35.010541-03
155	wagtailsearch	0003_remove_editors_pick	2019-04-21 03:29:35.044235-03
156	wagtailsearch	0004_querydailyhits_verbose_name_plural	2019-04-21 03:29:35.052685-03
157	wagtailusers	0001_initial	2019-04-21 03:29:35.096957-03
158	wagtailusers	0002_add_verbose_name_on_userprofile	2019-04-21 03:29:35.147558-03
159	wagtailusers	0003_add_verbose_names	2019-04-21 03:29:35.164839-03
160	wagtailusers	0004_capitalizeverbose	2019-04-21 03:29:35.303802-03
161	wagtailusers	0005_make_related_name_wagtail_specific	2019-04-21 03:29:35.334233-03
162	wagtailusers	0006_userprofile_prefered_language	2019-04-21 03:29:35.353835-03
163	wagtailusers	0007_userprofile_current_time_zone	2019-04-21 03:29:35.376823-03
164	wagtailusers	0008_userprofile_avatar	2019-04-21 03:29:35.395906-03
165	wagtailusers	0009_userprofile_verbose_name_plural	2019-04-21 03:29:35.414441-03
166	wagtailimages	0001_squashed_0021	2019-04-21 03:29:35.419279-03
167	wagtailcore	0001_squashed_0016_change_page_url_path_to_text_field	2019-04-21 03:29:35.421851-03
168	home	0002_auto_20190422_0519	2019-04-22 02:20:02.688745-03
169	home	0003_auto_20190422_0542	2019-04-22 02:42:51.814222-03
170	home	0004_auto_20190422_0557	2019-04-22 02:57:54.130686-03
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: jovenes
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
1awutg3pglk591mcmvczrcmefwr53pxx	NzMyN2QwNmFmOWUyODU1MTNiZDRlNjg2MmIwNjdiMTE2YTA2MDc1Yjp7Il9hdXRoX3VzZXJfaWQiOiIzIiwid2FndGFpbC1wcmV2aWV3LTMxIjpbImdhbGxlcnlfaW1hZ2VzLTEtaWQ9MyZnYWxsZXJ5X2ltYWdlcy0yLU9SREVSPTMmc2x1Zz1ub3RpLTEmZ2FsbGVyeV9pbWFnZXMtMC1pZD0yJmJvZHk9JTdCJTBEJTBBKysrKyUyMmJsb2NrcyUyMiUzQSslNUIlMEQlMEErKysrKysrKyU3QiUwRCUwQSsrKysrKysrKysrKyUyMmtleSUyMiUzQSslMjIwYjlvaSUyMiUyQyUwRCUwQSsrKysrKysrKysrKyUyMmVudGl0eVJhbmdlcyUyMiUzQSslNUIlNUQlMkMlMEQlMEErKysrKysrKysrKyslMjJ0eXBlJTIyJTNBKyUyMnVuc3R5bGVkJTIyJTJDJTBEJTBBKysrKysrKysrKysrJTIyZGVwdGglMjIlM0ErMCUyQyUwRCUwQSsrKysrKysrKysrKyUyMnRleHQlMjIlM0ErJTIyTG9yZW0rSXBzdW0raXMrc2ltcGx5K2R1bW15K3RleHQrb2YrdGhlK3ByaW50aW5nK2FuZCt0eXBlc2V0dGluZytpbmR1c3RyeS4rTG9yZW0rSXBzdW0raGFzK2JlZW4rdGhlK2luZHVzdHJ5JTI3cytzdGFuZGFyZCtkdW1teSt0ZXh0K2V2ZXIrc2luY2UrdGhlKzE1MDBzJTJDK3doZW4rYW4rdW5rbm93bitwcmludGVyK3Rvb2srYStnYWxsZXkrb2YrdHlwZSthbmQrc2NyYW1ibGVkK2l0K3RvK21ha2UrYSt0eXBlK3NwZWNpbWVuK2Jvb2suK0l0K2hhcytzdXJ2aXZlZCtub3Qrb25seStmaXZlK2NlbnR1cmllcyUyQytidXQrYWxzbyt0aGUrbGVhcCtpbnRvK2VsZWN0cm9uaWMrdHlwZXNldHRpbmclMkMrcmVtYWluaW5nK2Vzc2VudGlhbGx5K3VuY2hhbmdlZC4rSXQrd2FzK3BvcHVsYXJpc2VkK2luK3RoZSsxOTYwcyt3aXRoK3RoZStyZWxlYXNlK29mK0xldHJhc2V0K3NoZWV0cytjb250YWluaW5nK0xvcmVtK0lwc3VtK3Bhc3NhZ2VzJTJDK2FuZCttb3JlK3JlY2VudGx5K3dpdGgrZGVza3RvcCtwdWJsaXNoaW5nK3NvZnR3YXJlK2xpa2UrQWxkdXMrUGFnZU1ha2VyK2luY2x1ZGluZyt2ZXJzaW9ucytvZitMb3JlbStJcHN1bS4lMjIlMkMlMEQlMEErKysrKysrKysrKyslMjJpbmxpbmVTdHlsZVJhbmdlcyUyMiUzQSslNUIlMEQlMEErKysrKysrKysrKysrKysrJTdCJTBEJTBBKysrKysrKysrKysrKysrKysrKyslMjJzdHlsZSUyMiUzQSslMjJCT0xEJTIyJTJDJTBEJTBBKysrKysrKysrKysrKysrKysrKyslMjJvZmZzZXQlMjIlM0ErMCUyQyUwRCUwQSsrKysrKysrKysrKysrKysrKysrJTIybGVuZ3RoJTIyJTNBKzExJTBEJTBBKysrKysrKysrKysrKysrKyU3RCUwRCUwQSsrKysrKysrKysrKyU1RCUwRCUwQSsrKysrKysrJTdEJTBEJTBBKysrKyU1RCUyQyUwRCUwQSsrKyslMjJlbnRpdHlNYXAlMjIlM0ErJTdCJTdEJTBEJTBBJTdEJmdhbGxlcnlfaW1hZ2VzLU1BWF9OVU1fRk9STVM9MTAwMCZnYWxsZXJ5X2ltYWdlcy1JTklUSUFMX0ZPUk1TPTMmZ2FsbGVyeV9pbWFnZXMtMi1pZD00JmdhbGxlcnlfaW1hZ2VzLTAtaW1hZ2U9MjMmY3NyZm1pZGRsZXdhcmV0b2tlbj1TM1BBU3N1a2xsSnR4d24yVFFPNVV4WjdXUzlibkhDbTQ5NzZvUTlnU1gxV2lTM1htRjE5T1JtOHFOMUhQb040JmNhdGVnb3JpYT1FZHVjYWNpb24mbmV4dD0mZ2FsbGVyeV9pbWFnZXMtMS1jYXB0aW9uPUltYWdlbitkZStwcnVlYmErMiZpbnRybz1ub3RpY2lhK2JhamFkYSZnYWxsZXJ5X2ltYWdlcy0yLURFTEVURT0mZXhwaXJlX2F0PSZzZWFyY2hfZGVzY3JpcHRpb249JmdhbGxlcnlfaW1hZ2VzLTAtREVMRVRFPSZnYWxsZXJ5X2ltYWdlcy1NSU5fTlVNX0ZPUk1TPTAmZ2FsbGVyeV9pbWFnZXMtMi1pbWFnZT0xNiZnYWxsZXJ5X2ltYWdlcy0xLU9SREVSPTImdGl0bGU9Tm90aSsxJmdhbGxlcnlfaW1hZ2VzLTItY2FwdGlvbj1JbWFnZW4rZGUrcHJ1ZWJhKzMmZ29fbGl2ZV9hdD0mc2VvX3RpdGxlPSZpbWFnZW5fcG9ydGFkYT0xMiZnYWxsZXJ5X2ltYWdlcy0xLURFTEVURT0mZ2FsbGVyeV9pbWFnZXMtVE9UQUxfRk9STVM9MyZkYXRlPTIwMTktMDQtMTEmZ2FsbGVyeV9pbWFnZXMtMC1PUkRFUj0xJmdhbGxlcnlfaW1hZ2VzLTAtY2FwdGlvbj1JbWFnZW4rZGUrcHJ1ZWJhKzEmZ2FsbGVyeV9pbWFnZXMtMS1pbWFnZT0yMiIsMTU1NTA5Nzk0NC4yODk3MDNdLCJfYXV0aF91c2VyX2hhc2giOiIzZjQ1MjBlMDg3ZjlkZDUzYmVhZTdiNGEyMzk2ODE2ZTQ0MDVmOWIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQifQ==	2019-04-26 16:39:04.433-03
20ksmv7tedrcjoukuch0o8ipwgictvuc	Y2YyNThhNjkwMDIxYWExMjQ4YTg5YmMyYjI2NzdhODg1ZTIwZTM0Njp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiI0ODE2Y2Q2ZTdjMjEwMDc5Y2UxMjUwYThiYzEyNjUzYzNmOTY2YzQ0In0=	2019-04-01 13:45:13.836-03
8cavynn69az0xvcmznhxepezcezqs540	MDQwY2Y1MzYxMTY4MDBkNWM1NWRmMzUwYzQwOTAzZDZlMTQwNmE3YTp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzZjQ1MjBlMDg3ZjlkZDUzYmVhZTdiNGEyMzk2ODE2ZTQ0MDVmOWIzIn0=	2019-04-25 11:32:23.239-03
g7yordbwemaaaizt7pmo5csb67e2jevr	NWUxZDRmMDhhOTg0M2FjNTJiM2UyNzk2Y2RjNDMxZDU0Y2FlYWYyZDp7Il9hdXRoX3VzZXJfaGFzaCI6IjNmNDUyMGUwODdmOWRkNTNiZWFlN2I0YTIzOTY4MTZlNDQwNWY5YjMiLCJfYXV0aF91c2VyX2lkIjoiMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2019-04-25 10:52:39.054-03
qco9pntcasn17hx3exswiarzmpye5lca	YWMyZjcyODU3MGNjMTZmMTU5OTliNzI1NGQ4OTI4MjNhZmRhMzIxZDp7IndhZ3RhaWwtcHJldmlldy0xOSI6WyJzZW9fdGl0bGU9JnNsdWc9YWxpYW56YXMmdGl0bGU9QWxpYW56YXMmZXhwaXJlX2F0PSZnb19saXZlX2F0PSZjc3JmbWlkZGxld2FyZXRva2VuPXE5Rmp0dnFLRko3Q2tzV05jZXhSVmowRW5EQ0ZsaVY1NFA2UG8zeEk5bUE4VlQ5d3U5bWZZOWJ3cElqVjhLZlAmbmV4dD0mc2VhcmNoX2Rlc2NyaXB0aW9uPSIsMTU1NDk0ODI2OC41ODE3ODE2XSwiX2F1dGhfdXNlcl9oYXNoIjoiM2Y0NTIwZTA4N2Y5ZGQ1M2JlYWU3YjRhMjM5NjgxNmU0NDA1ZjliMyIsIl9hdXRoX3VzZXJfaWQiOiIzIiwid2FndGFpbC1wcmV2aWV3LTI4IjpbImRlc2NyaXBjaW9uX2NhdGVnb3JpYT1DYXRlZ29yaWErRmFtaWxpYXImZXhwaXJlX2F0PSZkaXN0YW5jaWE9MSZpbnNjcmlwY2lvbl91cmw9aHR0cHMlM0ElMkYlMkZzcG9ydGljay5jb20uYXIlMkZzaXMlMkZ1c2VycyUyRnN0YXJ0JTJGZXZlbnRvJTJGZGJhJnZhbG9yPTMwMCZzZWFyY2hfZGVzY3JpcHRpb249JnNlb190aXRsZT0mc2x1Zz1jYXJyZXJhLTFrJmNzcmZtaWRkbGV3YXJldG9rZW49ZU00TG1kNEsyMHlHRnd6T1BJWGZhRVcwNTB1T1hQNHJTc3ZoaExiSXdEMWNnWE14N0RNRGR1N1M3NWI0S2hvYiZ0aXRsZT1DYXJyZXJhKzFrJm5leHQ9JmdvX2xpdmVfYXQ9IiwxNTU0OTIyMDY2Ljg3MDM1OTRdLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9	2019-04-24 23:04:28.625-03
uvjx37ojiozfslcgnp2nmcpnumm1egoi	NDZkNWNjY2NhOTEwNjFmMzI0NjZiOTk3ZmRlNWY5MGYxYTQ3Y2JhYTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjMiLCJfYXV0aF91c2VyX2hhc2giOiIzZjQ1MjBlMDg3ZjlkZDUzYmVhZTdiNGEyMzk2ODE2ZTQ0MDVmOWIzIn0=	2019-05-05 05:27:37.617336-03
\.


--
-- Data for Name: home_alianza; Type: TABLE DATA; Schema: public; Owner: jovenes
--

COPY public.home_alianza (id, sort_order, titulo, descripcion, page_id) FROM stdin;
1	0	Construí alianzas locales socioeducativas	<p>Conocé las propuestas socioeducativas de Don Bosco en todo el país y desarrollá acciones por la educación.</p>	19
2	1	Impulsá programas de responsabilidad social (RSE)	<p>Canalizá tus programas de responsabilidad social empresaria (RSE) a través de las diferentes áreas de acción de Don Bosco Argentina.</p>	19
3	2	Realizá campañas de comunicación y sensibilización	<p>Desarrollá campañas de comunicación entre clientes, empleados y usuarios que fomenten el compromiso con la educación y la solidaridad.</p>	19
4	3	Sumate a la app 1K Por los Jóvenes	<p>La app que propone llevar una vida saludable mientras se realiza una acción solidaria</p><p>- Potenciá tu imagen corporativa promoviendo la vida sana y la solidaridad.</p><p>- Obtené presencia de marca realizando aportes por cada Km que los usuarios recorren, sea caminando, andando en bicicleta o corriendo.</p>	19
5	4	Sumate a Buenos Aires Corre Por Los Jóvenes	<p>Sé parte del evento que moviliza a todos los que trabajamos Por los Jóvenes el 8 de diciembre, en Vicente López. </p><p>- Invitá a tus empleados con precio promocional</p><p>- Patrociná el evento</p><p>- Participá con tu stand y difundí tus acciones por la educación y los jóvenes</p>	19
6	5	Contribuí con donaciones	<p>Recibimos donaciones que colaboren con las propuestas socioeducativas de Don Bosco:<br/></p><p>- Equipamiento y materiales para formación profesional</p><p>- Útiles escolares</p><p>- Equipamiento informático</p><p>- Herramientas de trabajo y maquinarias</p><p>- Indumentaria deportiva y calzado</p><p>- Elementos deportivos</p><p>- Otros</p>	19
\.


--
-- Data for Name: home_alianzas; Type: TABLE DATA; Schema: public; Owner: jovenes
--

COPY public.home_alianzas (page_ptr_id, imagen_principal_id, nota_pie) FROM stdin;
19	15	<h5>Las empresas donantes pueden obtener un beneficio impositivo, ya que Don Bosco Argentina se encuentra inscripta como entidad beneficiaria, reconocida como exenta del Impuesto a las Ganancias. De esta manera, las donaciones realizadas a nuestra organización podrán deducirse de este impuesto, hasta el límite del 5% de la renta neta del período fiscal correspondiente.</h5><h5>Para mayor información contactarse con</h5><h5><b>alianzas@porlosjovenes.org</b></h5>
\.


--
-- Data for Name: home_app; Type: TABLE DATA; Schema: public; Owner: jovenes
--

COPY public.home_app (page_ptr_id, video_code) FROM stdin;
16	EFu-Mdl7Rck
\.


--
-- Data for Name: home_ayudadifundiendo; Type: TABLE DATA; Schema: public; Owner: jovenes
--

COPY public.home_ayudadifundiendo (page_ptr_id, imagen_principal_id) FROM stdin;
20	12
\.


--
-- Data for Name: home_carrera; Type: TABLE DATA; Schema: public; Owner: jovenes
--

COPY public.home_carrera (page_ptr_id, imagen_superior_horizontal_id, imagen_superior_vertical_id, politica_menores_id, reglamento_id, imagen_inferior_kit_id, imagen_inferior_mapa_id) FROM stdin;
17	8	9	2	1	11	10
\.


--
-- Data for Name: home_carreras; Type: TABLE DATA; Schema: public; Owner: jovenes
--

COPY public.home_carreras (page_ptr_id, inscripcion_url, distancia, valor, descripcion_categoria) FROM stdin;
28	https://sportick.com.ar/sis/users/start/evento/dba	1 KM	300	Categoria Familiar
29	https://sportick.com.ar/sis/users/start/evento/dba	3 KM	460	Categoria Participativa
30	https://sportick.com.ar/sis/users/start/evento/dba	10 KM	500	Categoria Competitiva
\.


--
-- Data for Name: home_comocolaborar; Type: TABLE DATA; Schema: public; Owner: jovenes
--

COPY public.home_comocolaborar (page_ptr_id) FROM stdin;
18
\.


--
-- Data for Name: home_dondeestamos; Type: TABLE DATA; Schema: public; Owner: jovenes
--

COPY public.home_dondeestamos (page_ptr_id, imagen_principal_id) FROM stdin;
13	\N
\.


--
-- Data for Name: home_homegalleryimage; Type: TABLE DATA; Schema: public; Owner: jovenes
--

COPY public.home_homegalleryimage (id, sort_order, caption, image_id, page_id, boton, message, text_boton, url_boton) FROM stdin;
1	0		25	3	f	<p><br/><br/><br/><br/><br/><br/><br/><br/><br/></p><h2>La educación de hoy</h2><h2>son las oportunidades</h2><h2>de mañana</h2>		
2	1		26	3	f	<h2><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>El futuro esta en sus manos</h2><h2>Hagamoslo posible</h2>		
3	2		27	3	t	<p></p>	Quiero Donar	https://porlosjovenes.org/quierodonar
\.


--
-- Data for Name: home_homepage; Type: TABLE DATA; Schema: public; Owner: jovenes
--

COPY public.home_homepage (page_ptr_id) FROM stdin;
3
\.


--
-- Data for Name: home_legado; Type: TABLE DATA; Schema: public; Owner: jovenes
--

COPY public.home_legado (page_ptr_id, imagen_principal_id) FROM stdin;
21	14
\.


--
-- Data for Name: home_memoria; Type: TABLE DATA; Schema: public; Owner: jovenes
--

COPY public.home_memoria (id, sort_order, memoria_descripcion, page_id, memoria_url) FROM stdin;
1	0	Memoria 2017	15	https://www.yumpu.com/es/embed/view/oaR13L2TzhOMYdlj
2	1	Memoria 2018	15	https://www.yumpu.com/es/embed/view/YrjnRyWIK2SXH6iO
\.


--
-- Data for Name: home_nosotros; Type: TABLE DATA; Schema: public; Owner: jovenes
--

COPY public.home_nosotros (page_ptr_id) FROM stdin;
10
\.


--
-- Data for Name: home_noticia; Type: TABLE DATA; Schema: public; Owner: jovenes
--

COPY public.home_noticia (page_ptr_id, date, intro, body, categoria, imagen_portada_id) FROM stdin;
31	2019-04-11	noticia bajada	<p><b>Lorem Ipsum</b> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#x27;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>	Educacion	12
32	2019-04-04	Bajada 2 un poco mas larga que la enterior	<p><b>Lorem Ipsum</b> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#x27;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p><p><b>Lorem Ipsum</b> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#x27;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>	Educacion	16
33	2019-05-02	bajada de la noticia breve resumen	<p></p><embed alt="595a26a84b952_647_365-1.jpg" embedtype="image" format="left" id="23"/><p></p>	Educacion	22
\.


--
-- Data for Name: home_noticiagalleryimage; Type: TABLE DATA; Schema: public; Owner: jovenes
--

COPY public.home_noticiagalleryimage (id, sort_order, caption, image_id, page_id) FROM stdin;
2	0	Imagen de prueba 1	23	31
3	1	Imagen de prueba 2	22	31
4	2	Imagen de prueba 3	16	31
5	0	Imagen de texto 2	15	32
6	1	Imagen de texto 2 donar	13	32
7	0	gente	21	33
8	1	mano	20	33
\.


--
-- Data for Name: home_noticias; Type: TABLE DATA; Schema: public; Owner: jovenes
--

COPY public.home_noticias (page_ptr_id) FROM stdin;
12
\.


--
-- Data for Name: home_quehacemos; Type: TABLE DATA; Schema: public; Owner: jovenes
--

COPY public.home_quehacemos (page_ptr_id, acciones_imagen_id, acciones_texto, banner_imagen_id, banner_url, comunitaria_imagen_id, comunitaria_texto, educacion_imagen_id, educacion_texto, imagen_principal_id, trabajo_imagen_id, trabajo_texto) FROM stdin;
11	21	Acompañamiento cotidiano a familias de parajes aislados y de escasos recursos, construyendo con ellas inclusión educativa, acercando bienes materiales y conectando a unas comunidades con otras para romper la exclusión y el aislamiento.	17	https://porlosjovenes.org/quierodonar	20	Cuando las necesidades son grandes, más grandes aún son las respuestas para paliarlas. Las propuestas de Don Bosco Argentina orientadas a los chicos y chicas más vulnerables económica y afectivamente, como hogares, centros de día y colonias, permiten vivir en condiciones dignas y crecer en un ambiente sano.	18	Acceder a educación es construir las herramientas intelectuales y personales que permiten a cada uno moldear su presente y su futuro. La educación Inicial, Primaria, Secundaria, Terciaria y Universitaria es integral: apunta al crecimiento de la persona en su complejidad (intelectual, espiritual, afectiva y corporal).	16	19	Llevar una vida digna y crecer como personas requiere trabajar, para lo cual es necesario formarse. La formación para el trabajo y la educación técnico profesional (escuelas técnicas, agrotécnicas –EAS- y centros de formación profesional) significan aprendizaje técnico y práctico fundamentado en valores, para que cada joven dé forma a un futuro estable.
\.


--
-- Data for Name: home_quienessomos; Type: TABLE DATA; Schema: public; Owner: jovenes
--

COPY public.home_quienessomos (page_ptr_id, imagen_principal_id) FROM stdin;
14	22
\.


--
-- Data for Name: home_quierodonar; Type: TABLE DATA; Schema: public; Owner: jovenes
--

COPY public.home_quierodonar (page_ptr_id, imagen_principal_id, url_aumentar, url_donar) FROM stdin;
22	13	https://donbosco.secure.force.com/contacto	https://donbosco.secure.force.com/porlosjovenes
\.


--
-- Data for Name: home_sponsorapp; Type: TABLE DATA; Schema: public; Owner: jovenes
--

COPY public.home_sponsorapp (page_id, sponsorclass_ptr_id) FROM stdin;
16	1
16	2
16	3
\.


--
-- Data for Name: home_sponsorcarrera; Type: TABLE DATA; Schema: public; Owner: jovenes
--

COPY public.home_sponsorcarrera (sponsorclass_ptr_id, page_id) FROM stdin;
4	17
5	17
\.


--
-- Data for Name: home_sponsorclass; Type: TABLE DATA; Schema: public; Owner: jovenes
--

COPY public.home_sponsorclass (id, sort_order, nombre_sponsor, url_sponsor, imagen_sponsor_id) FROM stdin;
1	0	Racing Solidario	\N	3
2	1	Nivea	\N	5
3	2	Mostaza	\N	4
4	0	Racing Solidario	\N	3
5	1	Mostaza	\N	4
\.


--
-- Data for Name: home_transparencia; Type: TABLE DATA; Schema: public; Owner: jovenes
--

COPY public.home_transparencia (page_ptr_id, imagen_principal_id) FROM stdin;
15	23
\.


--
-- Data for Name: home_video_old; Type: TABLE DATA; Schema: public; Owner: jovenes
--

COPY public.home_video_old (id, sort_order, video_code, page_id) FROM stdin;
1	0	FRFENxD830c	17
2	1	Ve90f44ShWE	17
3	2	9f8GQ7UutSE	17
\.


--
-- Data for Name: postgres_search_indexentry; Type: TABLE DATA; Schema: public; Owner: jovenes
--

COPY public.postgres_search_indexentry (id, object_id, body, content_type_id, autocomplete) FROM stdin;
1	1		1	'root':1B
2	1		5	'55845484_10217976041933890_3274402394099679232_n.jpg':2A 'ciud':1A
3	2		5	'logo8a.jpg':2A 'racing':1A
4	3		5	'racing':1A 'racing-ok.jpg':2A
5	4		5	'002':5A '1.png':6A '2018':4A 'isolog':2A 'mostaz':3A 'www.mostazaweb.com.ar':1A
6	5		5	'nive':1A 'nivea.jpg':3A 'sponsor':2A
7	6		5	'pieza_para_web4.jpg':1A
8	7		5	'pieza_para_web_desk4.jpg':1A
9	8		5	'pieza_para_web_desk4.jpg':1A
10	9		5	'pieza_para_web_mobile_2.jpg':1A
11	10		5	'map':1A,2A
12	11		5	'remera1.jpg':1A
13	12		5	'iphone-4-415708_1920.jpg':2A 'red':1A
14	13		5	'don':1A 'donar.jpg':2A
15	14		5	'foto_legados_y_herencias_21.jpg':1A
16	15		5	'alianz':1A 'foto_comunicacion_3.jpg':2A
17	16		5	'hac':2A 'quehacemos.jpg':3A
18	17		5	'bann':1A 'banner_2_gif4.gif':2A
19	18		5	'educacion':1A 'ico_educacion.png':2A
20	19		5	'ico_trabajo.png':2A 'trabaj':1A
21	20		5	'comunitari':1A 'ico_comunitarias.png':2A
22	21		5	'accion':1A 'ico_misioneras.png':3A 'misioner':2A
23	22		5	'quienes.jpg':2A 'quienessom':1A
24	23		5	'595a26a84b952_647_365-1.jpg':1A
25	24		5	'2019':3A '55845484_10217976041933890_3274402394099679232_n.jpg':4A 'abril':2A 'educacion':1A
26	1		4	'general':3A 'reglament':1A,2A
27	2		4	'autorizacion':1A,3A 'menor':2A,4A
28	31	'1500s':28 '1960s':69 'aldus':88 'also':55 'an':30 'and':12,38,80 'baj':2 'been':18 'book':46 'but':54 'centuri':53 'containing':76 'desktop':84 'dummy':7,23 'electronic':59 'essentially':62 'ever':25 'fiv':52 'galley':35 'in':67 'including':90 'industry':14,20 'into':58 'ipsum':4,16,78,94 'is':5 'it':40,47,64 'leap':57 'letraset':74 'lik':87 'lorem':3,15,77,93 'mak':42 'mor':81 'not':50 'notici':1 'of':9,36,73,92 'only':51 'pagemak':89 'passag':79 'popularis':66 'print':32 'printing':11 'publishing':85 'recently':82 'rel':72 'remaining':61 's':21 'scrambl':39 'sheets':75 'simply':6 'sinc':26 'softwar':86 'specim':45 'standard':22 'surviv':49 'text':8,24 'the':10,19,27,56,68,71 'to':41 'took':33 'type':37,44 'typesetting':13,60 'unchang':63 'unknown':31 'versions':91 'was':65 'when':29 'with':70,83	31	
29	32	'1500s':35,127 '1960s':76,168 '2':2 'aldus':95,187 'also':62,154 'an':37,129 'and':19,45,87,111,137,179 'baj':1 'been':25,117 'book':53,145 'but':61,153 'centuri':60,152 'containing':83,175 'desktop':91,183 'dummy':14,30,106,122 'electronic':66,158 'enterior':9 'essentially':69,161 'ever':32,124 'fiv':59,151 'galley':42,134 'in':74,166 'including':97,189 'industry':21,27,113,119 'into':65,157 'ipsum':11,23,85,101,103,115,177,193 'is':12,104 'it':47,54,71,139,146,163 'larg':6 'leap':64,156 'letraset':81,173 'lik':94,186 'lorem':10,22,84,100,102,114,176,192 'mak':49,141 'mas':5 'mor':88,180 'not':57,149 'of':16,43,80,99,108,135,172,191 'only':58,150 'pagemak':96,188 'passag':86,178 'popularis':73,165 'print':39,131 'printing':18,110 'publishing':92,184 'recently':89,181 'rel':79,171 'remaining':68,160 's':28,120 'scrambl':46,138 'sheets':82,174 'simply':13,105 'sinc':33,125 'softwar':93,185 'specim':52,144 'standard':29,121 'surviv':56,148 'text':15,31,107,123 'the':17,26,34,63,75,78,109,118,126,155,167,170 'to':48,140 'took':40,132 'type':44,51,136,143 'typesetting':20,67,112,159 'unchang':70,162 'unknown':38,130 'versions':98,190 'was':72,164 'when':36,128 'with':77,90,169,182	31	
30	33	'baj':1 'brev':5 'notici':4 'resum':6	31	
31	12		28	
32	28		49	
33	29		49	
34	30		49	
35	16		42	
36	17		38	
37	22		39	
38	21		40	
39	20		37	
40	19		41	
41	18		43	
42	13		36	
43	15		33	
44	14		35	
45	10		32	
46	11		34	
50	25		5	'1er':4A 'hom':2A 'nin':3A 'plan':5A 'silid':1A
52	26		5	'1er':2A 'joven':1A 'plan':3A
54	27		5	'web.jpg':1A
47	3		2	'joven':3B
\.


--
-- Data for Name: taggit_tag; Type: TABLE DATA; Schema: public; Owner: jovenes
--

COPY public.taggit_tag (id, name, slug) FROM stdin;
1	ciudad	ciudad
2	Racing	racing
3	racing	racing_1
4	http://www.mostazaweb.com.ar/	httpwwwmostazawebcomar
5	Nivea Sponsor	nivea-sponsor
6	Reglamento	reglamento
7	Autorizacion Menores	autorizacion-menores
8	Mapa	mapa
9	Redes	redes
10	Donar	donar
11	Alianzas	alianzas
12	que hacemos	que-hacemos
13	banner	banner
14	educacion	educacion
15	trabajo	trabajo
16	comunitaria	comunitaria
17	acciones	acciones
18	misioneras	misioneras
19	QuienesSomos	quienessomos
20	abril	abril
21	2019	2019
22	silider home	silider-home
\.


--
-- Data for Name: taggit_taggeditem; Type: TABLE DATA; Schema: public; Owner: jovenes
--

COPY public.taggit_taggeditem (id, object_id, content_type_id, tag_id) FROM stdin;
1	1	5	1
2	2	5	2
3	3	5	3
4	4	5	4
5	5	5	5
6	1	4	6
7	2	4	7
8	10	5	8
9	12	5	9
10	13	5	10
11	15	5	11
12	16	5	12
13	17	5	13
14	18	5	14
15	19	5	15
16	20	5	16
17	21	5	17
18	21	5	18
19	22	5	19
20	24	5	20
21	24	5	21
22	24	5	14
23	25	5	22
\.


--
-- Data for Name: wagtailcore_collection; Type: TABLE DATA; Schema: public; Owner: jovenes
--

COPY public.wagtailcore_collection (id, path, depth, numchild, name) FROM stdin;
1	0001	1	0	Root
\.


--
-- Data for Name: wagtailcore_collectionviewrestriction; Type: TABLE DATA; Schema: public; Owner: jovenes
--

COPY public.wagtailcore_collectionviewrestriction (id, restriction_type, password, collection_id) FROM stdin;
\.


--
-- Data for Name: wagtailcore_collectionviewrestriction_groups; Type: TABLE DATA; Schema: public; Owner: jovenes
--

COPY public.wagtailcore_collectionviewrestriction_groups (id, collectionviewrestriction_id, group_id) FROM stdin;
\.


--
-- Data for Name: wagtailcore_groupcollectionpermission; Type: TABLE DATA; Schema: public; Owner: jovenes
--

COPY public.wagtailcore_groupcollectionpermission (id, collection_id, group_id, permission_id) FROM stdin;
1	1	2	2
2	1	1	2
3	1	2	3
4	1	1	3
5	1	2	5
6	1	1	5
7	1	2	6
8	1	1	6
\.


--
-- Data for Name: wagtailcore_grouppagepermission; Type: TABLE DATA; Schema: public; Owner: jovenes
--

COPY public.wagtailcore_grouppagepermission (id, permission_type, group_id, page_id) FROM stdin;
1	add	1	1
2	edit	1	1
3	publish	1	1
4	add	2	1
5	edit	2	1
6	lock	1	1
\.


--
-- Data for Name: wagtailcore_page; Type: TABLE DATA; Schema: public; Owner: jovenes
--

COPY public.wagtailcore_page (id, path, depth, numchild, title, slug, live, has_unpublished_changes, url_path, seo_title, show_in_menus, search_description, go_live_at, expire_at, expired, content_type_id, owner_id, locked, latest_revision_created_at, first_published_at, live_revision_id, last_published_at, draft_title) FROM stdin;
3	00010001	2	6	Por Los jovenes	home	t	f	/home/		f		\N	\N	f	2	\N	f	2019-04-22 06:31:30.866605-03	2019-04-22 02:07:45.550565-03	89	2019-04-22 06:31:31.429786-03	Por Los jovenes
1	0001	1	1	Root	root	t	f	/		f		\N	\N	f	1	\N	f	\N	\N	\N	\N	Root
10	000100010002	3	3	Nosotros	nosotros	t	f	/home/nosotros/		f		\N	\N	f	32	3	f	2019-04-11 02:47:47.363-03	2019-04-11 02:47:47.883-03	75	2019-04-11 02:47:47.883-03	Nosotros
11	000100010003	3	0	Que Hacemos	que-hacemos	t	f	/home/que-hacemos/		f		\N	\N	f	34	3	f	2019-04-11 00:56:56.486-03	2019-04-10 03:51:51.982-03	72	2019-04-11 00:56:57.364-03	Que Hacemos
12	000100010001	3	3	Noticias	noticias	t	f	/home/noticias/		f		\N	\N	f	28	3	f	2019-04-11 10:53:22.687-03	2019-04-11 10:53:23.184-03	79	2019-04-11 10:53:23.184-03	Noticias
13	0001000100020001	4	0	Donde Estamos	donde-estamos	t	f	/home/nosotros/donde-estamos/		f		\N	\N	f	36	3	f	2019-04-10 03:58:16.634-03	2019-04-10 03:58:17.06-03	15	2019-04-10 03:58:17.06-03	Donde Estamos
14	0001000100020002	4	0	Quienes Somos	quienes-somos	t	f	/home/nosotros/quienes-somos/		f		\N	\N	f	35	3	f	2019-04-11 01:11:31.126-03	2019-04-11 01:11:31.613-03	73	2019-04-11 01:11:31.613-03	Quienes Somos
15	0001000100020003	4	0	Transparencia	transparencia	t	f	/home/nosotros/transparencia/		f		\N	\N	f	33	3	f	2019-04-11 01:43:41.402-03	2019-04-10 04:00:50.47-03	74	2019-04-11 01:43:41.98-03	Transparencia
16	000100010006	3	2	App	app	t	f	/home/app/		f		\N	\N	f	42	3	f	2019-04-10 14:22:36.272-03	2019-04-10 04:32:08.083-03	42	2019-04-10 14:22:36.946-03	App
17	000100010007	3	3	Carrera	carrera	t	f	/home/carrera/	Carrera	f	Promocion de Carreras Solidarias	\N	\N	f	38	3	f	2019-04-10 21:37:27.869-03	2019-04-10 04:32:53.912-03	58	2019-04-10 21:37:28.887-03	Carrera
18	000100010005	3	4	Como Colaborar	como-colaborar	t	f	/home/como-colaborar/		f		\N	\N	f	43	3	f	2019-04-10 04:36:42.111-03	2019-04-10 04:36:42.557-03	23	2019-04-10 04:36:42.557-03	Como Colaborar
19	0001000100050001	4	0	Alianzas	alianzas	t	f	/home/como-colaborar/alianzas/		f		\N	\N	f	41	3	f	2019-04-10 23:57:00.186-03	2019-04-10 04:39:32.813-03	70	2019-04-10 23:57:01.073-03	Alianzas
20	0001000100050002	4	0	Ayuda Difundiendo	ayuda-difundiendo	t	f	/home/como-colaborar/ayuda-difundiendo/		f		\N	\N	f	37	3	f	2019-04-10 21:53:51.072-03	2019-04-10 04:39:59.633-03	59	2019-04-10 21:53:51.722-03	Ayuda Difundiendo
21	0001000100050003	4	0	Legado	legado	t	f	/home/como-colaborar/legado/		f		\N	\N	f	40	3	f	2019-04-10 22:54:26.81-03	2019-04-10 04:44:04.295-03	63	2019-04-10 22:54:27.453-03	Legado
22	0001000100050004	4	0	Quiero Donar	quiero-donar	t	f	/home/como-colaborar/quiero-donar/		f		\N	\N	f	39	3	f	2019-04-10 22:37:07.266-03	2019-04-10 04:44:53.309-03	62	2019-04-10 22:37:07.799-03	Quiero Donar
24	0001000100060001	4	0	Racing Solidario	racing-solidario	t	f	/home/app/racing-solidario/		f		\N	\N	f	44	3	f	2019-04-10 07:02:09.366-03	2019-04-10 07:02:09.807-03	32	2019-04-10 07:02:09.807-03	Racing Solidario
27	0001000100060002	4	0	Mostaza	mostaza	t	f	/home/app/mostaza/		f		\N	\N	f	44	3	f	2019-04-10 10:04:47.11-03	2019-04-10 10:04:47.678-03	35	2019-04-10 10:04:47.678-03	Mostaza
28	0001000100070003	4	0	Carrera 1k	carrera-1k	t	f	/home/carrera/carrera-1k/		f		\N	\N	f	49	3	f	2019-04-10 16:04:03.289-03	2019-04-10 16:04:03.742-03	49	2019-04-10 16:04:03.742-03	Carrera 1k
29	0001000100070004	4	0	Carrera 3K	carrera-3k	t	f	/home/carrera/carrera-3k/		f		\N	\N	f	49	3	f	2019-04-10 16:12:10.984-03	2019-04-10 16:12:11.35-03	50	2019-04-10 16:12:11.35-03	Carrera 3K
30	0001000100070005	4	0	Carrera 10K	carrera-10k	t	f	/home/carrera/carrera-10k/		f		\N	\N	f	49	3	f	2019-04-10 16:14:04.673-03	2019-04-10 16:14:05.233-03	51	2019-04-10 16:14:05.233-03	Carrera 10K
31	0001000100010001	4	0	Noti 1	noti-1	t	f	/home/noticias/noti-1/		f		\N	\N	f	31	3	f	2019-04-11 14:37:24.408-03	2019-04-11 03:18:28.614-03	83	2019-04-11 14:37:25.052-03	Noti 1
32	0001000100010002	4	0	Prueba 2	prueba-2	t	f	/home/noticias/prueba-2/		f		\N	\N	f	31	3	f	2019-04-11 14:36:20.966-03	2019-04-11 03:20:16.787-03	82	2019-04-11 14:36:21.539-03	Prueba 2
33	0001000100010003	4	0	Prueba de noticia 3	prueba-de-noticia-3	t	f	/home/noticias/prueba-de-noticia-3/		f		\N	\N	f	31	3	f	2019-04-11 14:24:44.935-03	2019-04-11 11:34:41.435-03	81	2019-04-11 14:24:45.646-03	Prueba de noticia 3
\.


--
-- Data for Name: wagtailcore_pagerevision; Type: TABLE DATA; Schema: public; Owner: jovenes
--

COPY public.wagtailcore_pagerevision (id, submitted_for_moderation, created_at, content_json, approved_go_live_at, page_id, user_id) FROM stdin;
10	f	2019-04-10 03:50:39.474-03	{"last_published_at": null, "owner": 3, "slug": "nosotros", "title": "Nosotros", "url_path": "/home/nosotros/", "live": false, "locked": false, "numchild": 0, "show_in_menus": false, "draft_title": "Nosotros", "expired": false, "go_live_at": null, "content_type": 32, "seo_title": "", "live_revision": null, "has_unpublished_changes": false, "depth": 3, "path": "000100010001", "latest_revision_created_at": null, "first_published_at": null, "expire_at": null, "search_description": "", "pk": 10}	\N	10	3
11	f	2019-04-10 03:51:42.886-03	{"last_published_at": null, "owner": 3, "slug": "que-hacemos", "title": "Que Hacemos", "url_path": "/home/que-hacemos/", "live": false, "locked": false, "numchild": 0, "show_in_menus": false, "draft_title": "Que Hacemos", "expired": false, "go_live_at": null, "content_type": 34, "seo_title": "", "live_revision": null, "has_unpublished_changes": false, "depth": 3, "path": "000100010002", "latest_revision_created_at": null, "first_published_at": null, "expire_at": null, "search_description": "", "pk": 11}	\N	11	3
12	f	2019-04-10 03:51:51.554-03	{"last_published_at": null, "owner": 3, "slug": "que-hacemos", "title": "Que Hacemos", "url_path": "/home/que-hacemos/", "live": false, "locked": false, "numchild": 0, "show_in_menus": false, "draft_title": "Que Hacemos", "expired": false, "go_live_at": null, "content_type": 34, "seo_title": "", "live_revision": null, "has_unpublished_changes": true, "depth": 3, "path": "000100010002", "latest_revision_created_at": "2019-04-10T06:51:42.886Z", "first_published_at": null, "expire_at": null, "search_description": "", "pk": 11}	\N	11	3
13	f	2019-04-10 03:52:27.051-03	{"last_published_at": null, "owner": 3, "slug": "noticias", "title": "Noticias", "url_path": "/home/noticias/", "live": false, "locked": false, "numchild": 0, "show_in_menus": false, "draft_title": "Noticias", "expired": false, "go_live_at": null, "content_type": 28, "seo_title": "", "live_revision": null, "has_unpublished_changes": false, "depth": 3, "path": "000100010003", "latest_revision_created_at": null, "first_published_at": null, "expire_at": null, "search_description": "", "pk": 12}	\N	12	3
14	f	2019-04-10 03:57:48.766-03	{"last_published_at": null, "owner": 3, "slug": "donde-estamos", "title": "Donde Estamos", "url_path": "/home/nosotros/donde-estamos/", "live": false, "locked": false, "numchild": 0, "show_in_menus": false, "draft_title": "Donde Estamos", "expired": false, "go_live_at": null, "content_type": 36, "seo_title": "", "live_revision": null, "has_unpublished_changes": false, "depth": 4, "path": "0001000100010001", "latest_revision_created_at": null, "first_published_at": null, "expire_at": null, "search_description": "", "pk": 13}	\N	13	3
15	f	2019-04-10 03:58:16.634-03	{"last_published_at": null, "owner": 3, "slug": "donde-estamos", "title": "Donde Estamos", "url_path": "/home/nosotros/donde-estamos/", "live": false, "locked": false, "numchild": 0, "show_in_menus": false, "draft_title": "Donde Estamos", "expired": false, "go_live_at": null, "content_type": 36, "seo_title": "", "live_revision": null, "has_unpublished_changes": true, "depth": 4, "path": "0001000100010001", "latest_revision_created_at": "2019-04-10T06:57:48.766Z", "first_published_at": null, "expire_at": null, "search_description": "", "pk": 13}	\N	13	3
16	f	2019-04-10 03:58:40.203-03	{"last_published_at": null, "owner": 3, "slug": "quienes-somos", "title": "Quienes Somos", "url_path": "/home/nosotros/quienes-somos/", "live": false, "locked": false, "numchild": 0, "show_in_menus": false, "draft_title": "Quienes Somos", "expired": false, "go_live_at": null, "content_type": 35, "seo_title": "", "live_revision": null, "has_unpublished_changes": false, "depth": 4, "path": "0001000100010002", "latest_revision_created_at": null, "first_published_at": null, "expire_at": null, "search_description": "", "pk": 14}	\N	14	3
17	f	2019-04-10 04:00:50.077-03	{"last_published_at": null, "owner": 3, "slug": "transparencia", "title": "Transparencia", "url_path": "/home/nosotros/transparencia/", "live": true, "locked": false, "numchild": 0, "show_in_menus": false, "draft_title": "Transparencia", "expired": false, "go_live_at": null, "content_type": 33, "seo_title": "", "live_revision": null, "has_unpublished_changes": false, "depth": 4, "path": "0001000100010003", "latest_revision_created_at": null, "first_published_at": null, "expire_at": null, "search_description": "", "pk": 15}	\N	15	3
18	f	2019-04-10 04:32:01.309-03	{"numchild": 0, "depth": 3, "live": false, "owner": 3, "locked": false, "pk": 16, "has_unpublished_changes": false, "slug": "app", "last_published_at": null, "expired": false, "live_revision": null, "expire_at": null, "latest_revision_created_at": null, "first_published_at": null, "go_live_at": null, "content_type": 42, "title": "App", "draft_title": "App", "show_in_menus": false, "path": "000100010004", "search_description": "", "seo_title": "", "url_path": "/home/app/"}	\N	16	3
19	f	2019-04-10 04:32:07.719-03	{"numchild": 0, "depth": 3, "live": false, "owner": 3, "locked": false, "pk": 16, "has_unpublished_changes": true, "slug": "app", "last_published_at": null, "expired": false, "live_revision": null, "expire_at": null, "latest_revision_created_at": "2019-04-10T07:32:01.309Z", "first_published_at": null, "go_live_at": null, "content_type": 42, "title": "App", "draft_title": "App", "show_in_menus": false, "path": "000100010004", "search_description": "", "seo_title": "", "url_path": "/home/app/"}	\N	16	3
20	f	2019-04-10 04:32:43.473-03	{"numchild": 0, "depth": 3, "live": false, "owner": 3, "locked": false, "pk": 17, "has_unpublished_changes": false, "slug": "carrera", "last_published_at": null, "expired": false, "live_revision": null, "expire_at": null, "latest_revision_created_at": null, "first_published_at": null, "go_live_at": null, "content_type": 38, "title": "Carrera", "draft_title": "Carrera", "show_in_menus": false, "path": "000100010005", "search_description": "", "seo_title": "", "url_path": "/home/carrera/"}	\N	17	3
21	f	2019-04-10 04:32:53.476-03	{"numchild": 0, "depth": 3, "live": false, "owner": 3, "locked": false, "pk": 17, "has_unpublished_changes": true, "slug": "carrera", "last_published_at": null, "expired": false, "live_revision": null, "expire_at": null, "latest_revision_created_at": "2019-04-10T07:32:43.473Z", "first_published_at": null, "go_live_at": null, "content_type": 38, "title": "Carrera", "draft_title": "Carrera", "show_in_menus": false, "path": "000100010005", "search_description": "", "seo_title": "", "url_path": "/home/carrera/"}	\N	17	3
22	f	2019-04-10 04:36:22.992-03	{"content_type": 43, "slug": "como-colaborar", "numchild": 0, "live_revision": null, "expire_at": null, "latest_revision_created_at": null, "locked": false, "first_published_at": null, "title": "Como Colaborar", "last_published_at": null, "search_description": "", "path": "000100010006", "draft_title": "Como Colaborar", "expired": false, "has_unpublished_changes": false, "pk": 18, "seo_title": "", "depth": 3, "url_path": "/home/como-colaborar/", "live": false, "show_in_menus": false, "owner": 3, "go_live_at": null}	\N	18	3
23	f	2019-04-10 04:36:42.111-03	{"content_type": 43, "slug": "como-colaborar", "numchild": 0, "live_revision": null, "expire_at": null, "latest_revision_created_at": "2019-04-10T07:36:22.992Z", "locked": false, "first_published_at": null, "title": "Como Colaborar", "last_published_at": null, "search_description": "", "path": "000100010006", "draft_title": "Como Colaborar", "expired": false, "has_unpublished_changes": true, "pk": 18, "seo_title": "", "depth": 3, "url_path": "/home/como-colaborar/", "live": false, "show_in_menus": false, "owner": 3, "go_live_at": null}	\N	18	3
24	f	2019-04-10 04:39:26.349-03	{"content_type": 41, "slug": "alianzas", "numchild": 0, "live_revision": null, "expire_at": null, "latest_revision_created_at": null, "locked": false, "first_published_at": null, "title": "Alianzas", "last_published_at": null, "search_description": "", "path": "0001000100060001", "draft_title": "Alianzas", "expired": false, "has_unpublished_changes": false, "pk": 19, "seo_title": "", "depth": 4, "url_path": "/home/como-colaborar/alianzas/", "live": false, "show_in_menus": false, "owner": 3, "go_live_at": null}	\N	19	3
25	f	2019-04-10 04:39:32.457-03	{"content_type": 41, "slug": "alianzas", "numchild": 0, "live_revision": null, "expire_at": null, "latest_revision_created_at": "2019-04-10T07:39:26.349Z", "locked": false, "first_published_at": null, "title": "Alianzas", "last_published_at": null, "search_description": "", "path": "0001000100060001", "draft_title": "Alianzas", "expired": false, "has_unpublished_changes": true, "pk": 19, "seo_title": "", "depth": 4, "url_path": "/home/como-colaborar/alianzas/", "live": false, "show_in_menus": false, "owner": 3, "go_live_at": null}	\N	19	3
26	f	2019-04-10 04:39:59.275-03	{"content_type": 37, "slug": "ayuda-difundiendo", "numchild": 0, "live_revision": null, "expire_at": null, "latest_revision_created_at": null, "locked": false, "first_published_at": null, "title": "Ayuda Difundiendo", "last_published_at": null, "search_description": "", "path": "0001000100060002", "draft_title": "Ayuda Difundiendo", "expired": false, "has_unpublished_changes": false, "pk": 20, "seo_title": "", "depth": 4, "url_path": "/home/como-colaborar/ayuda-difundiendo/", "live": true, "show_in_menus": false, "owner": 3, "go_live_at": null}	\N	20	3
27	f	2019-04-10 04:43:46.427-03	{"content_type": 40, "slug": "legado", "numchild": 0, "live_revision": null, "expire_at": null, "latest_revision_created_at": null, "locked": false, "first_published_at": null, "title": "Legado", "last_published_at": null, "search_description": "", "path": "0001000100050003", "draft_title": "Legado", "expired": false, "has_unpublished_changes": false, "pk": 21, "seo_title": "", "depth": 4, "url_path": "/home/como-colaborar/legado/", "live": false, "show_in_menus": false, "owner": 3, "go_live_at": null}	\N	21	3
28	f	2019-04-10 04:44:00.323-03	{"content_type": 40, "slug": "legado", "numchild": 0, "live_revision": null, "expire_at": null, "latest_revision_created_at": "2019-04-10T07:43:46.427Z", "locked": false, "first_published_at": null, "title": "Legado", "last_published_at": null, "search_description": "", "path": "0001000100050003", "draft_title": "Legado", "expired": false, "has_unpublished_changes": true, "pk": 21, "seo_title": "", "depth": 4, "url_path": "/home/como-colaborar/legado/", "live": false, "show_in_menus": false, "owner": 3, "go_live_at": null}	\N	21	3
29	f	2019-04-10 04:44:03.896-03	{"content_type": 40, "slug": "legado", "numchild": 0, "live_revision": null, "expire_at": null, "latest_revision_created_at": "2019-04-10T07:44:00.323Z", "locked": false, "first_published_at": null, "title": "Legado", "last_published_at": null, "search_description": "", "path": "0001000100050003", "draft_title": "Legado", "expired": false, "has_unpublished_changes": true, "pk": 21, "seo_title": "", "depth": 4, "url_path": "/home/como-colaborar/legado/", "live": false, "show_in_menus": false, "owner": 3, "go_live_at": null}	\N	21	3
30	f	2019-04-10 04:44:52.915-03	{"content_type": 39, "slug": "quiero-donar", "numchild": 0, "live_revision": null, "expire_at": null, "latest_revision_created_at": null, "locked": false, "first_published_at": null, "title": "Quiero Donar", "last_published_at": null, "search_description": "", "path": "0001000100050004", "draft_title": "Quiero Donar", "expired": false, "has_unpublished_changes": false, "pk": 22, "seo_title": "", "depth": 4, "url_path": "/home/como-colaborar/quiero-donar/", "live": true, "show_in_menus": false, "owner": 3, "go_live_at": null}	\N	22	3
32	f	2019-04-10 07:02:09.366-03	{"url_sponsor": "https://www.racingclub.com.ar/racingsolidario/", "draft_title": "Racing Solidario", "latest_revision_created_at": null, "live_revision": null, "slug": "racing-solidario", "seo_title": "", "live": true, "numchild": 0, "nombre_sponsor": "Racing Club", "path": "0001000100060001", "first_published_at": null, "go_live_at": null, "owner": 3, "pk": 24, "locked": false, "title": "Racing Solidario", "url_path": "/home/app/racing-solidario/", "content_type": 44, "imagen_sponsor": 3, "expire_at": null, "has_unpublished_changes": false, "depth": 4, "show_in_menus": false, "expired": false, "search_description": "", "last_published_at": null}	\N	24	3
35	f	2019-04-10 10:04:47.11-03	{"first_published_at": null, "slug": "mostaza", "imagen_sponsor": 4, "last_published_at": null, "expired": false, "live_revision": null, "latest_revision_created_at": null, "content_type": 44, "pk": 27, "go_live_at": null, "nombre_sponsor": "Mostaza", "draft_title": "Mostaza", "locked": false, "title": "Mostaza", "path": "0001000100060002", "url_path": "/home/app/mostaza/", "search_description": "", "numchild": 0, "live": true, "seo_title": "", "has_unpublished_changes": false, "url_sponsor": "http://www.mostazaweb.com.ar/", "owner": 3, "show_in_menus": false, "depth": 4, "expire_at": null}	\N	27	3
36	f	2019-04-10 10:32:47.253-03	{"live": true, "seo_title": "", "live_revision": 19, "first_published_at": "2019-04-10T07:32:08.083Z", "draft_title": "App", "search_description": "", "expired": false, "content_type": 42, "has_unpublished_changes": false, "pk": 16, "last_published_at": "2019-04-10T07:32:08.083Z", "expire_at": null, "go_live_at": null, "show_in_menus": false, "url_path": "/home/app/", "depth": 3, "latest_revision_created_at": "2019-04-10T07:32:07.719Z", "path": "000100010006", "video_url": "https://youtu.be/EFu-Mdl7Rck", "slug": "app", "title": "App", "numchild": 2, "owner": 3, "locked": false}	\N	16	3
37	f	2019-04-10 10:46:14.642-03	{"has_unpublished_changes": false, "expired": false, "path": "000100010006", "first_published_at": "2019-04-10T07:32:08.083Z", "owner": 3, "expire_at": null, "latest_revision_created_at": "2019-04-10T13:32:47.253Z", "content_type": 42, "pk": 16, "video_code": "EFu-Mdl7Rck", "numchild": 2, "title": "App", "slug": "app", "last_published_at": "2019-04-10T13:32:47.693Z", "locked": false, "draft_title": "App", "live_revision": 36, "url_path": "/home/app/", "depth": 3, "show_in_menus": false, "live": true, "go_live_at": null, "seo_title": "", "search_description": ""}	\N	16	3
38	f	2019-04-10 12:04:18.651-03	{"depth": 3, "expire_at": null, "seo_title": "", "show_in_menus": false, "title": "Carrera", "first_published_at": "2019-04-10T07:32:53.912Z", "path": "000100010007", "video_code": "EFu-Mdl7Rck", "slug": "carrera", "search_description": "", "live_revision": 21, "locked": false, "live": true, "expired": false, "last_published_at": "2019-04-10T07:32:53.912Z", "url_path": "/home/carrera/", "numchild": 2, "draft_title": "Carrera", "owner": 3, "has_unpublished_changes": false, "content_type": 38, "go_live_at": null, "latest_revision_created_at": "2019-04-10T07:32:53.476Z", "pk": 17}	\N	17	3
39	f	2019-04-10 12:37:40.84-03	{"content_type": 42, "owner": 3, "locked": false, "search_description": "", "numchild": 2, "expire_at": null, "draft_title": "App", "show_in_menus": false, "seo_title": "", "video_code": "EFu-Mdl7Rck", "path": "000100010006", "last_published_at": "2019-04-10T13:46:15.119Z", "url_path": "/home/app/", "has_unpublished_changes": false, "go_live_at": null, "first_published_at": "2019-04-10T07:32:08.083Z", "expired": false, "live_revision": 37, "carousel_sponsor": [{"content_type": 45, "owner": null, "locked": false, "search_description": "", "page": 16, "numchild": 0, "expire_at": null, "draft_title": "", "show_in_menus": false, "seo_title": "", "path": "", "url_sponsor": null, "last_published_at": null, "url_path": "", "has_unpublished_changes": false, "go_live_at": null, "first_published_at": null, "expired": false, "live_revision": null, "nombre_sponsor": "Racing Solidario", "live": true, "pk": null, "slug": "", "latest_revision_created_at": null, "depth": null, "imagen_sponsor": 2, "title": ""}], "live": true, "pk": 16, "slug": "app", "latest_revision_created_at": "2019-04-10T13:46:14.642Z", "depth": 3, "title": "App"}	\N	16	3
40	f	2019-04-10 12:42:44.947-03	{"content_type": 42, "owner": 3, "locked": false, "search_description": "", "numchild": 2, "expire_at": null, "draft_title": "App", "show_in_menus": false, "seo_title": "", "video_code": "EFu-Mdl7Rck", "path": "000100010006", "last_published_at": "2019-04-10T13:46:15.119Z", "url_path": "/home/app/", "has_unpublished_changes": true, "go_live_at": null, "first_published_at": "2019-04-10T07:32:08.083Z", "expired": false, "live_revision": 37, "carousel_sponsor": [{"content_type": 45, "owner": null, "locked": false, "search_description": "", "page": 16, "numchild": 0, "expire_at": null, "draft_title": "", "show_in_menus": false, "seo_title": "", "path": "", "url_sponsor": "https://www.racingclub.com.ar/racingsolidario/", "last_published_at": null, "url_path": "", "has_unpublished_changes": false, "go_live_at": null, "first_published_at": null, "expired": false, "live_revision": null, "nombre_sponsor": "Racing", "live": true, "pk": null, "slug": "", "latest_revision_created_at": null, "depth": null, "imagen_sponsor": 3, "title": ""}, {"content_type": 45, "owner": null, "locked": false, "search_description": "", "page": 16, "numchild": 0, "expire_at": null, "draft_title": "", "show_in_menus": false, "seo_title": "", "path": "", "url_sponsor": "https://www.nivea.com.ar/", "last_published_at": null, "url_path": "", "has_unpublished_changes": false, "go_live_at": null, "first_published_at": null, "expired": false, "live_revision": null, "nombre_sponsor": "Nivea", "live": true, "pk": null, "slug": "", "latest_revision_created_at": null, "depth": null, "imagen_sponsor": 5, "title": ""}], "live": true, "pk": 16, "slug": "app", "latest_revision_created_at": "2019-04-10T15:37:40.840Z", "depth": 3, "title": "App"}	\N	16	3
41	f	2019-04-10 12:50:03.401-03	{"show_in_menus": false, "numchild": 2, "video_code": "EFu-Mdl7Rck", "carousel_sponsor": [{"nombre_sponsor": "Racing", "imagen_sponsor": 3, "url_sponsor": "https://www.racingclub.com.ar/racingsolidario/", "pk": null, "page": 16, "sort_order": 0}, {"nombre_sponsor": "Nivea", "imagen_sponsor": 5, "url_sponsor": "https://www.nivea.com.ar/", "pk": null, "page": 16, "sort_order": 1}], "live": true, "expired": false, "last_published_at": "2019-04-10T13:46:15.119Z", "owner": 3, "seo_title": "", "title": "App", "expire_at": null, "go_live_at": null, "pk": 16, "has_unpublished_changes": true, "locked": false, "depth": 3, "first_published_at": "2019-04-10T07:32:08.083Z", "content_type": 42, "path": "000100010006", "live_revision": 37, "draft_title": "App", "slug": "app", "search_description": "", "url_path": "/home/app/", "latest_revision_created_at": "2019-04-10T15:42:44.947Z"}	\N	16	3
42	f	2019-04-10 14:22:36.272-03	{"seo_title": "", "last_published_at": "2019-04-10T15:50:03.970Z", "has_unpublished_changes": false, "locked": false, "draft_title": "App", "go_live_at": null, "pk": 16, "depth": 3, "live": true, "latest_revision_created_at": "2019-04-10T15:50:03.401Z", "expire_at": null, "show_in_menus": false, "carousel_sponsor_app": [{"page": 16, "nombre_sponsor": "Racing Solidario", "sort_order": 0, "url_sponsor": null, "pk": null, "imagen_sponsor": 3}, {"page": 16, "nombre_sponsor": "Nivea", "sort_order": 1, "url_sponsor": null, "pk": null, "imagen_sponsor": 5}, {"page": 16, "nombre_sponsor": "Mostaza", "sort_order": 2, "url_sponsor": null, "pk": null, "imagen_sponsor": 4}], "first_published_at": "2019-04-10T07:32:08.083Z", "path": "000100010006", "title": "App", "slug": "app", "search_description": "", "content_type": 42, "numchild": 2, "video_code": "EFu-Mdl7Rck", "expired": false, "url_path": "/home/app/", "owner": 3, "live_revision": 41}	\N	16	3
43	f	2019-04-10 14:23:31.811-03	{"seo_title": "", "last_published_at": "2019-04-10T15:04:19.290Z", "has_unpublished_changes": false, "locked": false, "draft_title": "Carrera", "go_live_at": null, "pk": 17, "depth": 3, "live": true, "latest_revision_created_at": "2019-04-10T15:04:18.651Z", "expire_at": null, "show_in_menus": false, "first_published_at": "2019-04-10T07:32:53.912Z", "path": "000100010007", "title": "Carrera", "slug": "carrera", "carousel_sponsor_carrera": [{"page": 17, "nombre_sponsor": "Racing Solidario", "sort_order": 0, "url_sponsor": null, "pk": null, "imagen_sponsor": 3}, {"page": 17, "nombre_sponsor": "Mostaza", "sort_order": 1, "url_sponsor": null, "pk": null, "imagen_sponsor": 4}], "search_description": "", "content_type": 38, "numchild": 2, "video_code": "EFu-Mdl7Rck", "expired": false, "url_path": "/home/carrera/", "owner": 3, "live_revision": 38}	\N	17	3
44	f	2019-04-10 14:24:14.272-03	{"seo_title": "", "last_published_at": "2019-04-10T15:04:19.290Z", "has_unpublished_changes": true, "locked": false, "draft_title": "Carrera", "go_live_at": null, "pk": 17, "depth": 3, "live": true, "latest_revision_created_at": "2019-04-10T17:23:31.811Z", "expire_at": null, "show_in_menus": false, "first_published_at": "2019-04-10T07:32:53.912Z", "path": "000100010007", "title": "Carrera", "slug": "carrera", "carousel_sponsor_carrera": [{"page": 17, "nombre_sponsor": "Racing Solidario", "sort_order": 0, "url_sponsor": null, "pk": null, "imagen_sponsor": 3}, {"page": 17, "nombre_sponsor": "Mostaza", "sort_order": 1, "url_sponsor": null, "pk": null, "imagen_sponsor": 4}], "search_description": "", "content_type": 38, "numchild": 2, "video_code": "EFu-Mdl7Rck", "expired": false, "url_path": "/home/carrera/", "owner": 3, "live_revision": 38}	\N	17	3
45	f	2019-04-10 14:42:09.411-03	{"seo_title": "", "show_in_menus": false, "title": "Carrera", "url_path": "/home/carrera/", "latest_revision_created_at": "2019-04-10T17:24:14.272Z", "locked": false, "carousel_videos_anteriores": [{"sort_order": 0, "pk": null, "video_code": "FRFENxD830c", "page": 17}, {"sort_order": 1, "pk": null, "video_code": "Ve90f44ShWE", "page": 17}, {"sort_order": 2, "pk": null, "video_code": "EFu-Mdl7Rck", "page": 17}], "live_revision": 44, "live": true, "draft_title": "Carrera", "has_unpublished_changes": false, "carousel_sponsor_carrera": [{"page": 17, "pk": 4, "sort_order": 0, "imagen_sponsor": 3, "url_sponsor": null, "nombre_sponsor": "Racing Solidario"}, {"page": 17, "pk": 5, "sort_order": 1, "imagen_sponsor": 4, "url_sponsor": null, "nombre_sponsor": "Mostaza"}], "first_published_at": "2019-04-10T07:32:53.912Z", "search_description": "", "pk": 17, "depth": 3, "last_published_at": "2019-04-10T17:24:14.786Z", "slug": "carrera", "numchild": 2, "owner": 3, "path": "000100010007", "expire_at": null, "expired": false, "content_type": 38, "go_live_at": null}	\N	17	3
46	f	2019-04-10 14:53:29.392-03	{"owner": 3, "seo_title": "", "slug": "carrera", "pk": 17, "path": "000100010007", "depth": 3, "carousel_sponsor_carrera": [{"page": 17, "sort_order": 0, "url_sponsor": null, "pk": 4, "imagen_sponsor": 3, "nombre_sponsor": "Racing Solidario"}, {"page": 17, "sort_order": 1, "url_sponsor": null, "pk": 5, "imagen_sponsor": 4, "nombre_sponsor": "Mostaza"}], "live": true, "numchild": 2, "show_in_menus": false, "latest_revision_created_at": "2019-04-10T17:42:09.411Z", "carousel_videos_anteriores": [{"pk": 1, "page": 17, "video_code": "FRFENxD830c", "sort_order": 0}, {"pk": 2, "page": 17, "video_code": "Ve90f44ShWE", "sort_order": 1}, {"pk": 3, "page": 17, "video_code": "9f8GQ7UutSE", "sort_order": 2}], "content_type": 38, "first_published_at": "2019-04-10T07:32:53.912Z", "url_path": "/home/carrera/", "expired": false, "draft_title": "Carrera", "go_live_at": null, "locked": false, "has_unpublished_changes": false, "title": "Carrera", "expire_at": null, "search_description": "", "last_published_at": "2019-04-10T17:42:10.067Z", "live_revision": 45}	\N	17	3
47	f	2019-04-10 15:47:38.871-03	{"expire_at": null, "descripcion_categoria": "Categoria Familiar", "distancia": "1", "pk": 28, "inscripcion_url": "https://sportick.com.ar/sis/users/start/evento/dba", "valor": "300", "live_revision": null, "expired": false, "latest_revision_created_at": null, "last_published_at": null, "slug": "carrera-1k", "locked": false, "title": "Carrera 1k", "content_type": 49, "live": false, "draft_title": "Carrera 1k", "owner": 3, "first_published_at": null, "path": "0001000100070003", "depth": 4, "numchild": 0, "search_description": "", "has_unpublished_changes": false, "seo_title": "", "url_path": "/home/carrera/carrera-1k/", "show_in_menus": false, "go_live_at": null}	\N	28	3
48	f	2019-04-10 16:03:56.38-03	{"depth": 4, "latest_revision_created_at": "2019-04-10T18:47:38.871Z", "title": "Carrera 1k", "numchild": 0, "owner": 3, "expire_at": null, "draft_title": "Carrera 1k", "live_revision": null, "first_published_at": null, "locked": false, "url_path": "/home/carrera/carrera-1k/", "live": false, "content_type": 49, "go_live_at": null, "slug": "carrera-1k", "has_unpublished_changes": true, "last_published_at": null, "pk": 28, "valor": 300, "show_in_menus": false, "descripcion_categoria": "Categoria Familiar", "expired": false, "seo_title": "", "path": "0001000100070003", "distancia": "1 KM", "inscripcion_url": "https://sportick.com.ar/sis/users/start/evento/dba", "search_description": ""}	\N	28	3
49	f	2019-04-10 16:04:03.289-03	{"depth": 4, "latest_revision_created_at": "2019-04-10T19:03:56.380Z", "title": "Carrera 1k", "numchild": 0, "owner": 3, "expire_at": null, "draft_title": "Carrera 1k", "live_revision": null, "first_published_at": null, "locked": false, "url_path": "/home/carrera/carrera-1k/", "live": false, "content_type": 49, "go_live_at": null, "slug": "carrera-1k", "has_unpublished_changes": true, "last_published_at": null, "pk": 28, "valor": 300, "show_in_menus": false, "descripcion_categoria": "Categoria Familiar", "expired": false, "seo_title": "", "path": "0001000100070003", "distancia": "1 KM", "inscripcion_url": "https://sportick.com.ar/sis/users/start/evento/dba", "search_description": ""}	\N	28	3
50	f	2019-04-10 16:12:10.984-03	{"expired": false, "distancia": "3 KM", "pk": 29, "valor": 460, "inscripcion_url": "https://sportick.com.ar/sis/users/start/evento/dba", "descripcion_categoria": "Categoria Participativa", "latest_revision_created_at": null, "path": "0001000100070004", "title": "Carrera 3K", "slug": "carrera-3k", "draft_title": "Carrera 3K", "numchild": 0, "seo_title": "", "expire_at": null, "has_unpublished_changes": false, "last_published_at": null, "depth": 4, "locked": false, "live": true, "url_path": "/home/carrera/carrera-3k/", "go_live_at": null, "owner": 3, "first_published_at": null, "content_type": 49, "show_in_menus": false, "search_description": "", "live_revision": null}	\N	29	3
51	f	2019-04-10 16:14:04.673-03	{"expired": false, "distancia": "10 KM", "pk": 30, "valor": 500, "inscripcion_url": "https://sportick.com.ar/sis/users/start/evento/dba", "descripcion_categoria": "Categoria Competitiva", "latest_revision_created_at": null, "path": "0001000100070005", "title": "Carrera 10K", "slug": "carrera-10k", "draft_title": "Carrera 10K", "numchild": 0, "seo_title": "", "expire_at": null, "has_unpublished_changes": false, "last_published_at": null, "depth": 4, "locked": false, "live": true, "url_path": "/home/carrera/carrera-10k/", "go_live_at": null, "owner": 3, "first_published_at": null, "content_type": 49, "show_in_menus": false, "search_description": "", "live_revision": null}	\N	30	3
52	f	2019-04-10 16:46:45.226-03	{"owner": 3, "seo_title": "", "imagen_superior_vertical": 7, "live": true, "expire_at": null, "draft_title": "Carrera", "carousel_sponsor_carrera": [{"imagen_sponsor": 3, "url_sponsor": null, "sort_order": 0, "page": 17, "nombre_sponsor": "Racing Solidario", "pk": 4}, {"imagen_sponsor": 4, "url_sponsor": null, "sort_order": 1, "page": 17, "nombre_sponsor": "Mostaza", "pk": 5}], "search_description": "", "carousel_videos_anteriores": [{"sort_order": 0, "video_code": "FRFENxD830c", "page": 17, "pk": 1}, {"sort_order": 1, "video_code": "Ve90f44ShWE", "page": 17, "pk": 2}, {"sort_order": 2, "video_code": "9f8GQ7UutSE", "page": 17, "pk": 3}], "pk": 17, "content_type": 38, "slug": "carrera", "expired": false, "path": "000100010007", "live_revision": 46, "depth": 3, "locked": false, "has_unpublished_changes": false, "url_path": "/home/carrera/", "imagen_superior_horizontal": 6, "show_in_menus": false, "last_published_at": "2019-04-10T17:53:30.126Z", "first_published_at": "2019-04-10T07:32:53.912Z", "latest_revision_created_at": "2019-04-10T17:53:29.392Z", "go_live_at": null, "title": "Carrera", "numchild": 3}	\N	17	3
53	f	2019-04-10 17:33:13.765-03	{"show_in_menus": false, "depth": 3, "first_published_at": "2019-04-10T07:32:53.912Z", "owner": 3, "pk": 17, "has_unpublished_changes": false, "expire_at": null, "go_live_at": null, "carousel_sponsor_carrera": [{"imagen_sponsor": 3, "url_sponsor": null, "sort_order": 0, "page": 17, "nombre_sponsor": "Racing Solidario", "pk": 4}, {"imagen_sponsor": 4, "url_sponsor": null, "sort_order": 1, "page": 17, "nombre_sponsor": "Mostaza", "pk": 5}], "url_path": "/home/carrera/", "title": "Carrera", "live_revision": 52, "seo_title": "", "content_type": 38, "carousel_videos_anteriores": [{"video_code": "FRFENxD830c", "sort_order": 0, "page": 17, "pk": 1}, {"video_code": "Ve90f44ShWE", "sort_order": 1, "page": 17, "pk": 2}, {"video_code": "9f8GQ7UutSE", "sort_order": 2, "page": 17, "pk": 3}], "draft_title": "Carrera", "last_published_at": "2019-04-10T19:46:45.982Z", "slug": "carrera", "imagen_superior_horizontal": 8, "locked": false, "live": true, "path": "000100010007", "search_description": "", "expired": false, "numchild": 3, "latest_revision_created_at": "2019-04-10T19:46:45.226Z", "imagen_superior_vertical": 9}	\N	17	3
61	f	2019-04-10 22:33:01.942-03	{"locked": false, "imagen_principal": 13, "has_unpublished_changes": false, "latest_revision_created_at": "2019-04-11T01:12:12.950Z", "show_in_menus": false, "depth": 4, "owner": 3, "url_path": "/home/como-colaborar/quiero-donar/", "pk": 22, "go_live_at": null, "draft_title": "Quiero Donar", "content_type": 39, "expired": false, "last_published_at": "2019-04-11T01:12:13.427Z", "slug": "quiero-donar", "live": true, "url_aumentar": "https://donbosco.secure.force.com/contacto", "numchild": 0, "expire_at": null, "seo_title": "", "path": "0001000100050004", "title": "Quiero Donar", "first_published_at": "2019-04-10T07:44:53.309Z", "url_donar": "https://donbosco.secure.force.com/porlosjovenes", "search_description": "", "live_revision": 60}	\N	22	3
54	f	2019-04-10 19:50:23.155-03	{"politica_menores": 2, "carousel_videos_anteriores": [{"video_code": "FRFENxD830c", "page": 17, "pk": 1, "sort_order": 0}, {"video_code": "Ve90f44ShWE", "page": 17, "pk": 2, "sort_order": 1}, {"video_code": "9f8GQ7UutSE", "page": 17, "pk": 3, "sort_order": 2}], "carousel_sponsor_carrera": [{"nombre_sponsor": "Racing Solidario", "url_sponsor": null, "pk": 4, "page": 17, "imagen_sponsor": 3, "sort_order": 0}, {"nombre_sponsor": "Mostaza", "url_sponsor": null, "pk": 5, "page": 17, "imagen_sponsor": 4, "sort_order": 1}], "seo_title": "", "search_description": "", "expired": false, "go_live_at": null, "depth": 3, "live": true, "content_type": 38, "title": "Carrera", "numchild": 3, "owner": 3, "has_unpublished_changes": false, "path": "000100010007", "imagen_superior_horizontal": 8, "locked": false, "reglamento": 1, "draft_title": "Carrera", "pk": 17, "slug": "carrera", "live_revision": 53, "last_published_at": "2019-04-10T20:33:14.559Z", "url_path": "/home/carrera/", "expire_at": null, "show_in_menus": false, "first_published_at": "2019-04-10T07:32:53.912Z", "imagen_superior_vertical": 9, "latest_revision_created_at": "2019-04-10T20:33:13.765Z"}	\N	17	3
55	f	2019-04-10 20:15:41.538-03	{"pk": 17, "latest_revision_created_at": "2019-04-10T22:50:23.155Z", "expire_at": null, "search_description": "", "has_unpublished_changes": false, "numchild": 3, "depth": 3, "first_published_at": "2019-04-10T07:32:53.912Z", "last_published_at": "2019-04-10T22:50:24.378Z", "go_live_at": null, "carousel_videos_anteriores": [{"pk": 1, "sort_order": 0, "page": 17, "video_code": "FRFENxD830c"}, {"pk": 2, "sort_order": 1, "page": 17, "video_code": "Ve90f44ShWE"}, {"pk": 3, "sort_order": 2, "page": 17, "video_code": "9f8GQ7UutSE"}], "live_revision": 54, "owner": 3, "imagen_superior_vertical": 9, "live": true, "expired": false, "seo_title": "", "path": "000100010007", "draft_title": "Carrera", "politica_menores": 2, "content_type": 38, "slug": "carrera", "imagen_superior_horizontal": 8, "imagen_inferior_vertical": 11, "title": "Carrera", "locked": false, "imagen_inferior_horizontal": 10, "url_path": "/home/carrera/", "reglamento": 1, "show_in_menus": false, "carousel_sponsor_carrera": [{"pk": 4, "page": 17, "nombre_sponsor": "Racing Solidario", "url_sponsor": null, "sort_order": 0, "imagen_sponsor": 3}, {"pk": 5, "page": 17, "nombre_sponsor": "Mostaza", "url_sponsor": null, "sort_order": 1, "imagen_sponsor": 4}]}	\N	17	3
56	f	2019-04-10 20:30:27.262-03	{"pk": 17, "latest_revision_created_at": "2019-04-10T23:15:41.538Z", "expire_at": "2019-04-10T23:32:00Z", "search_description": "", "has_unpublished_changes": false, "numchild": 3, "depth": 3, "first_published_at": "2019-04-10T07:32:53.912Z", "last_published_at": "2019-04-10T23:15:42.673Z", "go_live_at": "2019-04-03T23:29:00Z", "carousel_videos_anteriores": [{"pk": 1, "sort_order": 0, "page": 17, "video_code": "FRFENxD830c"}, {"pk": 2, "sort_order": 1, "page": 17, "video_code": "Ve90f44ShWE"}, {"pk": 3, "sort_order": 2, "page": 17, "video_code": "9f8GQ7UutSE"}], "live_revision": 55, "owner": 3, "imagen_superior_vertical": 9, "live": true, "expired": false, "seo_title": "", "path": "000100010007", "draft_title": "Carrera", "politica_menores": 2, "content_type": 38, "slug": "carrera", "imagen_superior_horizontal": 8, "imagen_inferior_vertical": 11, "title": "Carrera", "locked": false, "imagen_inferior_horizontal": 10, "url_path": "/home/carrera/", "reglamento": 1, "show_in_menus": false, "carousel_sponsor_carrera": [{"pk": 4, "page": 17, "nombre_sponsor": "Racing Solidario", "url_sponsor": null, "sort_order": 0, "imagen_sponsor": 3}, {"pk": 5, "page": 17, "nombre_sponsor": "Mostaza", "url_sponsor": null, "sort_order": 1, "imagen_sponsor": 4}]}	\N	17	3
57	f	2019-04-10 21:28:58.737-03	{"seo_title": "Carrera", "path": "000100010007", "go_live_at": null, "show_in_menus": false, "reglamento": 1, "carousel_videos_anteriores": [{"page": 17, "pk": 1, "video_code": "FRFENxD830c", "sort_order": 0}, {"page": 17, "pk": 2, "video_code": "Ve90f44ShWE", "sort_order": 1}, {"page": 17, "pk": 3, "video_code": "9f8GQ7UutSE", "sort_order": 2}], "first_published_at": "2019-04-10T07:32:53.912Z", "title": "Carrera", "latest_revision_created_at": "2019-04-10T23:30:27.262Z", "numchild": 3, "slug": "carrera", "depth": 3, "owner": 3, "expire_at": null, "url_path": "/home/carrera/", "politica_menores": 2, "has_unpublished_changes": false, "pk": 17, "imagen_superior_vertical": 9, "draft_title": "Carrera", "search_description": "Promocion de Carreras Solidarias", "expired": false, "imagen_inferior_horizontal": 10, "content_type": 38, "imagen_superior_horizontal": 8, "imagen_inferior_vertical": 11, "live": true, "last_published_at": "2019-04-10T23:30:28.297Z", "live_revision": 56, "locked": false, "carousel_sponsor_carrera": [{"page": 17, "nombre_sponsor": "Racing Solidario", "sort_order": 0, "pk": 4, "url_sponsor": null, "imagen_sponsor": 3}, {"page": 17, "nombre_sponsor": "Mostaza", "sort_order": 1, "pk": 5, "url_sponsor": null, "imagen_sponsor": 4}]}	\N	17	3
58	f	2019-04-10 21:37:27.869-03	{"owner": 3, "imagen_inferior_mapa": 10, "has_unpublished_changes": false, "seo_title": "Carrera", "live_revision": 57, "expire_at": null, "path": "000100010007", "reglamento": 1, "carousel_sponsor_carrera": [{"nombre_sponsor": "Racing Solidario", "sort_order": 0, "pk": 4, "imagen_sponsor": 3, "page": 17, "url_sponsor": null}, {"nombre_sponsor": "Mostaza", "sort_order": 1, "pk": 5, "imagen_sponsor": 4, "page": 17, "url_sponsor": null}], "live": true, "show_in_menus": false, "expired": false, "pk": 17, "imagen_inferior_kit": 11, "depth": 3, "imagen_superior_horizontal": 8, "carousel_videos_anteriores": [{"pk": 1, "sort_order": 0, "page": 17, "video_code": "FRFENxD830c"}, {"pk": 2, "sort_order": 1, "page": 17, "video_code": "Ve90f44ShWE"}, {"pk": 3, "sort_order": 2, "page": 17, "video_code": "9f8GQ7UutSE"}], "content_type": 38, "last_published_at": "2019-04-11T00:28:59.812Z", "url_path": "/home/carrera/", "locked": false, "title": "Carrera", "slug": "carrera", "numchild": 3, "latest_revision_created_at": "2019-04-11T00:28:58.737Z", "search_description": "Promocion de Carreras Solidarias", "draft_title": "Carrera", "politica_menores": 2, "imagen_superior_vertical": 9, "first_published_at": "2019-04-10T07:32:53.912Z", "go_live_at": null}	\N	17	3
59	f	2019-04-10 21:53:51.072-03	{"draft_title": "Ayuda Difundiendo", "content_type": 37, "go_live_at": null, "first_published_at": "2019-04-10T07:39:59.633Z", "show_in_menus": false, "has_unpublished_changes": false, "live_revision": 26, "url_path": "/home/como-colaborar/ayuda-difundiendo/", "last_published_at": "2019-04-10T07:39:59.633Z", "live": true, "numchild": 0, "depth": 4, "locked": false, "search_description": "", "title": "Ayuda Difundiendo", "imagen_principal": 12, "latest_revision_created_at": "2019-04-10T07:39:59.275Z", "expired": false, "slug": "ayuda-difundiendo", "seo_title": "", "pk": 20, "expire_at": null, "path": "0001000100050002", "owner": 3}	\N	20	3
60	f	2019-04-10 22:12:12.95-03	{"show_in_menus": false, "last_published_at": "2019-04-10T07:44:53.309Z", "owner": 3, "title": "Quiero Donar", "imagen_principal": 13, "slug": "quiero-donar", "live": true, "path": "0001000100050004", "pk": 22, "expire_at": null, "search_description": "", "seo_title": "", "live_revision": 30, "url_path": "/home/como-colaborar/quiero-donar/", "draft_title": "Quiero Donar", "expired": false, "depth": 4, "locked": false, "content_type": 39, "numchild": 0, "go_live_at": null, "has_unpublished_changes": false, "first_published_at": "2019-04-10T07:44:53.309Z", "latest_revision_created_at": "2019-04-10T07:44:52.915Z"}	\N	22	3
62	f	2019-04-10 22:37:07.266-03	{"search_description": "", "depth": 4, "pk": 22, "last_published_at": "2019-04-11T01:33:02.457Z", "slug": "quiero-donar", "draft_title": "Quiero Donar", "locked": false, "path": "0001000100050004", "latest_revision_created_at": "2019-04-11T01:33:01.942Z", "expire_at": null, "content_type": 39, "numchild": 0, "go_live_at": null, "expired": false, "has_unpublished_changes": false, "imagen_principal": 13, "live": true, "seo_title": "", "owner": 3, "title": "Quiero Donar", "url_path": "/home/como-colaborar/quiero-donar/", "url_aumentar": "https://donbosco.secure.force.com/contacto", "live_revision": 61, "first_published_at": "2019-04-10T07:44:53.309Z", "url_donar": "https://donbosco.secure.force.com/porlosjovenes", "show_in_menus": false}	\N	22	3
63	f	2019-04-10 22:54:26.81-03	{"owner": 3, "title": "Legado", "expire_at": null, "url_path": "/home/como-colaborar/legado/", "path": "0001000100050003", "numchild": 0, "pk": 21, "live_revision": 29, "latest_revision_created_at": "2019-04-10T07:44:03.896Z", "draft_title": "Legado", "has_unpublished_changes": false, "expired": false, "locked": false, "live": true, "search_description": "", "slug": "legado", "seo_title": "", "content_type": 40, "last_published_at": "2019-04-10T07:44:04.295Z", "depth": 4, "show_in_menus": false, "first_published_at": "2019-04-10T07:44:04.295Z", "go_live_at": null, "imagen_principal": 14}	\N	21	3
64	f	2019-04-10 23:22:17.458-03	{"imagen_principal": 15, "search_description": "", "live": true, "content_type": 41, "live_revision": 25, "has_unpublished_changes": false, "listado_alianzas": [{"titulo": "Constru\\u00ed alianzas locales socioeducativas", "sort_order": 0, "page": 19, "pk": null, "descripcion": "Conoc\\u00e9 las propuestas socioeducativas de Don Bosco en todo el pa\\u00eds y desarroll\\u00e1 acciones por la educaci\\u00f3n."}, {"titulo": "Impuls\\u00e1 programas de responsabilidad social (RSE)", "sort_order": 1, "page": 19, "pk": null, "descripcion": "Canaliz\\u00e1 tus programas de responsabilidad social empresaria (RSE) a trav\\u00e9s de las diferentes \\u00e1reas de acci\\u00f3n de Don Bosco Argentina."}, {"titulo": "Realiz\\u00e1 campa\\u00f1as de comunicaci\\u00f3n y sensibilizaci\\u00f3n", "sort_order": 2, "page": 19, "pk": null, "descripcion": "Desarroll\\u00e1 campa\\u00f1as de comunicaci\\u00f3n entre clientes, empleados y usuarios que fomenten el compromiso con la educaci\\u00f3n y la solidaridad."}, {"titulo": "Sumate a la app 1K Por los J\\u00f3venes", "sort_order": 3, "page": 19, "pk": null, "descripcion": "La app que propone llevar una vida saludable mientras se realiza una acci\\u00f3n solidaria  Potenci\\u00e1 tu imagen corporativa promoviendo la vida sana y la solidaridad. Obten\\u00e9 presencia de marca realizando ap"}, {"titulo": "Sumate a Buenos Aires Corre Por Los J\\u00f3venes", "sort_order": 4, "page": 19, "pk": null, "descripcion": "S\\u00e9 parte del evento que moviliza a todos los que trabajamos Por los J\\u00f3venes el 8 de diciembre, en Vicente L\\u00f3pez.   - Invit\\u00e1 a tus empleados con precio promocional  - Patrocin\\u00e1 el evento  - Particip\\u00e1"}, {"titulo": "Contribu\\u00ed con donaciones", "sort_order": 5, "page": 19, "pk": null, "descripcion": "Recibimos donaciones que colaboren con las propuestas socioeducativas de Don Bosco:  Equipamiento y materiales para formaci\\u00f3n profesional \\u00datiles escolares Equipamiento inform\\u00e1tico Herramientas de trab"}], "slug": "alianzas", "go_live_at": null, "locked": false, "path": "0001000100050001", "expire_at": null, "url_path": "/home/como-colaborar/alianzas/", "numchild": 0, "owner": 3, "draft_title": "Alianzas", "depth": 4, "title": "Alianzas", "show_in_menus": false, "pk": 19, "expired": false, "last_published_at": "2019-04-10T07:39:32.813Z", "first_published_at": "2019-04-10T07:39:32.813Z", "latest_revision_created_at": "2019-04-10T07:39:32.457Z", "seo_title": ""}	\N	19	3
65	f	2019-04-10 23:43:26.313-03	{"live_revision": 64, "url_path": "/home/como-colaborar/alianzas/", "nota_pie": "<p><b>Las empresas donantes pueden obtener un beneficio impositivo, ya que Don Bosco Argentina se encuentra inscripta como entidad beneficiaria, reconocida como exenta del Impuesto a las Ganancias. De esta manera, las donaciones realizadas a nuestra organizaci\\u00f3n podr\\u00e1n deducirse de este impuesto, hasta el l\\u00edmite del 5% de la renta neta del per\\u00edodo fiscal correspondiente.</b></p><p><b>Para mayor informaci\\u00f3n contactarse con</b></p><p><b>alianzas@porlosjovenes.org</b></p>", "go_live_at": null, "seo_title": "", "draft_title": "Alianzas", "latest_revision_created_at": "2019-04-11T02:22:17.458Z", "content_type": 41, "live": true, "expired": false, "owner": 3, "slug": "alianzas", "numchild": 0, "expire_at": null, "title": "Alianzas", "search_description": "", "depth": 4, "has_unpublished_changes": false, "pk": 19, "show_in_menus": false, "listado_alianzas": [{"page": 19, "pk": 1, "descripcion": "Conoc\\u00e9 las propuestas socioeducativas de Don Bosco en todo el pa\\u00eds y desarroll\\u00e1 acciones por la educaci\\u00f3n.", "sort_order": 0, "titulo": "Constru\\u00ed alianzas locales socioeducativas"}, {"page": 19, "pk": 2, "descripcion": "Canaliz\\u00e1 tus programas de responsabilidad social empresaria (RSE) a trav\\u00e9s de las diferentes \\u00e1reas de acci\\u00f3n de Don Bosco Argentina.", "sort_order": 1, "titulo": "Impuls\\u00e1 programas de responsabilidad social (RSE)"}, {"page": 19, "pk": 3, "descripcion": "Desarroll\\u00e1 campa\\u00f1as de comunicaci\\u00f3n entre clientes, empleados y usuarios que fomenten el compromiso con la educaci\\u00f3n y la solidaridad.", "sort_order": 2, "titulo": "Realiz\\u00e1 campa\\u00f1as de comunicaci\\u00f3n y sensibilizaci\\u00f3n"}, {"page": 19, "pk": 4, "descripcion": "La app que propone llevar una vida saludable mientras se realiza una acci\\u00f3n solidaria  Potenci\\u00e1 tu imagen corporativa promoviendo la vida sana y la solidaridad. Obten\\u00e9 presencia de marca realizando ap", "sort_order": 3, "titulo": "Sumate a la app 1K Por los J\\u00f3venes"}, {"page": 19, "pk": 5, "descripcion": "S\\u00e9 parte del evento que moviliza a todos los que trabajamos Por los J\\u00f3venes el 8 de diciembre, en Vicente L\\u00f3pez.   - Invit\\u00e1 a tus empleados con precio promocional  - Patrocin\\u00e1 el evento  - Particip\\u00e1", "sort_order": 4, "titulo": "Sumate a Buenos Aires Corre Por Los J\\u00f3venes"}, {"page": 19, "pk": 6, "descripcion": "Recibimos donaciones que colaboren con las propuestas socioeducativas de Don Bosco:  Equipamiento y materiales para formaci\\u00f3n profesional \\u00datiles escolares Equipamiento inform\\u00e1tico Herramientas de trab", "sort_order": 5, "titulo": "Contribu\\u00ed con donaciones"}], "first_published_at": "2019-04-10T07:39:32.813Z", "path": "0001000100050001", "imagen_principal": 15, "locked": false, "last_published_at": "2019-04-11T02:22:18.403Z"}	\N	19	3
66	f	2019-04-10 23:45:10.689-03	{"live_revision": 64, "url_path": "/home/como-colaborar/alianzas/", "nota_pie": "<p>Las empresas donantes pueden obtener un beneficio impositivo, ya que Don Bosco Argentina se encuentra inscripta como entidad beneficiaria, reconocida como exenta del Impuesto a las Ganancias. De esta manera, las donaciones realizadas a nuestra organizaci\\u00f3n podr\\u00e1n deducirse de este impuesto, hasta el l\\u00edmite del 5% de la renta neta del per\\u00edodo fiscal correspondiente.</p><p>Para mayor informaci\\u00f3n contactarse con</p><h4><b>alianzas@porlosjovenes.org</b></h4>", "go_live_at": null, "seo_title": "", "draft_title": "Alianzas", "latest_revision_created_at": "2019-04-11T02:43:26.313Z", "content_type": 41, "live": true, "expired": false, "owner": 3, "slug": "alianzas", "numchild": 0, "expire_at": null, "title": "Alianzas", "search_description": "", "depth": 4, "has_unpublished_changes": true, "pk": 19, "show_in_menus": false, "listado_alianzas": [{"page": null, "pk": 1, "descripcion": "Conoc\\u00e9 las propuestas socioeducativas de Don Bosco en todo el pa\\u00eds y desarroll\\u00e1 acciones por la educaci\\u00f3n.", "sort_order": 0, "titulo": "Constru\\u00ed alianzas locales socioeducativas"}, {"page": null, "pk": 2, "descripcion": "Canaliz\\u00e1 tus programas de responsabilidad social empresaria (RSE) a trav\\u00e9s de las diferentes \\u00e1reas de acci\\u00f3n de Don Bosco Argentina.", "sort_order": 1, "titulo": "Impuls\\u00e1 programas de responsabilidad social (RSE)"}, {"page": null, "pk": 3, "descripcion": "Desarroll\\u00e1 campa\\u00f1as de comunicaci\\u00f3n entre clientes, empleados y usuarios que fomenten el compromiso con la educaci\\u00f3n y la solidaridad.", "sort_order": 2, "titulo": "Realiz\\u00e1 campa\\u00f1as de comunicaci\\u00f3n y sensibilizaci\\u00f3n"}, {"page": null, "pk": 4, "descripcion": "La app que propone llevar una vida saludable mientras se realiza una acci\\u00f3n solidaria  Potenci\\u00e1 tu imagen corporativa promoviendo la vida sana y la solidaridad. Obten\\u00e9 presencia de marca realizando ap", "sort_order": 3, "titulo": "Sumate a la app 1K Por los J\\u00f3venes"}, {"page": null, "pk": 5, "descripcion": "S\\u00e9 parte del evento que moviliza a todos los que trabajamos Por los J\\u00f3venes el 8 de diciembre, en Vicente L\\u00f3pez.   - Invit\\u00e1 a tus empleados con precio promocional  - Patrocin\\u00e1 el evento  - Particip\\u00e1", "sort_order": 4, "titulo": "Sumate a Buenos Aires Corre Por Los J\\u00f3venes"}, {"page": null, "pk": 6, "descripcion": "Recibimos donaciones que colaboren con las propuestas socioeducativas de Don Bosco:  Equipamiento y materiales para formaci\\u00f3n profesional \\u00datiles escolares Equipamiento inform\\u00e1tico Herramientas de trab", "sort_order": 5, "titulo": "Contribu\\u00ed con donaciones"}], "first_published_at": "2019-04-10T07:39:32.813Z", "path": "0001000100050001", "imagen_principal": 15, "locked": false, "last_published_at": "2019-04-11T02:22:18.403Z"}	\N	19	3
71	f	2019-04-11 00:55:04.58-03	{"title": "Que Hacemos", "educacion_texto": "Acceder a educaci\\u00f3n es construir las herramientas intelectuales y personales que permiten a cada uno", "latest_revision_created_at": "2019-04-10T06:51:51.554Z", "live": true, "draft_title": "Que Hacemos", "show_in_menus": false, "trabajo_texto": "Acceder a educaci\\u00f3n es construir las herramientas intelectuales y personales que permiten a cada uno", "educacion_imagen": 18, "acciones_texto": "Acceder a educaci\\u00f3n es construir las herramientas intelectuales y personales que permiten a cada uno", "seo_title": "", "locked": false, "path": "000100010003", "depth": 3, "expire_at": null, "pk": 11, "imagen_principal": 16, "content_type": 34, "slug": "que-hacemos", "live_revision": 12, "last_published_at": "2019-04-10T06:51:51.982Z", "banner_imagen": 17, "has_unpublished_changes": false, "acciones_imagen": 21, "trabajo_imagen": 19, "comunitaria_texto": "Acceder a educaci\\u00f3n es construir las herramientas intelectuales y personales que permiten a cada uno", "banner_url": "https://porlosjovenes.org/quierodonar", "comunitaria_imagen": 20, "expired": false, "url_path": "/home/que-hacemos/", "numchild": 0, "search_description": "", "owner": 3, "go_live_at": null, "first_published_at": "2019-04-10T06:51:51.982Z"}	\N	11	3
67	f	2019-04-10 23:46:15.58-03	{"live_revision": 66, "url_path": "/home/como-colaborar/alianzas/", "nota_pie": "<h2>Las empresas donantes pueden obtener un beneficio impositivo, ya que Don Bosco Argentina se encuentra inscripta como entidad beneficiaria, reconocida como exenta del Impuesto a las Ganancias. De esta manera, las donaciones realizadas a nuestra organizaci\\u00f3n podr\\u00e1n deducirse de este impuesto, hasta el l\\u00edmite del 5% de la renta neta del per\\u00edodo fiscal correspondiente.</h2><h2>Para mayor informaci\\u00f3n contactarse con</h2><h4><b>alianzas@porlosjovenes.org</b></h4>", "go_live_at": null, "seo_title": "", "draft_title": "Alianzas", "latest_revision_created_at": "2019-04-11T02:45:10.689Z", "content_type": 41, "live": true, "expired": false, "owner": 3, "slug": "alianzas", "numchild": 0, "expire_at": null, "title": "Alianzas", "search_description": "", "depth": 4, "has_unpublished_changes": false, "pk": 19, "show_in_menus": false, "listado_alianzas": [{"page": 19, "pk": 1, "descripcion": "Conoc\\u00e9 las propuestas socioeducativas de Don Bosco en todo el pa\\u00eds y desarroll\\u00e1 acciones por la educaci\\u00f3n.", "sort_order": 0, "titulo": "Constru\\u00ed alianzas locales socioeducativas"}, {"page": 19, "pk": 2, "descripcion": "Canaliz\\u00e1 tus programas de responsabilidad social empresaria (RSE) a trav\\u00e9s de las diferentes \\u00e1reas de acci\\u00f3n de Don Bosco Argentina.", "sort_order": 1, "titulo": "Impuls\\u00e1 programas de responsabilidad social (RSE)"}, {"page": 19, "pk": 3, "descripcion": "Desarroll\\u00e1 campa\\u00f1as de comunicaci\\u00f3n entre clientes, empleados y usuarios que fomenten el compromiso con la educaci\\u00f3n y la solidaridad.", "sort_order": 2, "titulo": "Realiz\\u00e1 campa\\u00f1as de comunicaci\\u00f3n y sensibilizaci\\u00f3n"}, {"page": 19, "pk": 4, "descripcion": "La app que propone llevar una vida saludable mientras se realiza una acci\\u00f3n solidaria  Potenci\\u00e1 tu imagen corporativa promoviendo la vida sana y la solidaridad. Obten\\u00e9 presencia de marca realizando ap", "sort_order": 3, "titulo": "Sumate a la app 1K Por los J\\u00f3venes"}, {"page": 19, "pk": 5, "descripcion": "S\\u00e9 parte del evento que moviliza a todos los que trabajamos Por los J\\u00f3venes el 8 de diciembre, en Vicente L\\u00f3pez.   - Invit\\u00e1 a tus empleados con precio promocional  - Patrocin\\u00e1 el evento  - Particip\\u00e1", "sort_order": 4, "titulo": "Sumate a Buenos Aires Corre Por Los J\\u00f3venes"}, {"page": 19, "pk": 6, "descripcion": "Recibimos donaciones que colaboren con las propuestas socioeducativas de Don Bosco:  Equipamiento y materiales para formaci\\u00f3n profesional \\u00datiles escolares Equipamiento inform\\u00e1tico Herramientas de trab", "sort_order": 5, "titulo": "Contribu\\u00ed con donaciones"}], "first_published_at": "2019-04-10T07:39:32.813Z", "path": "0001000100050001", "imagen_principal": 15, "locked": false, "last_published_at": "2019-04-11T02:45:11.445Z"}	\N	19	3
68	f	2019-04-10 23:49:43.311-03	{"show_in_menus": false, "latest_revision_created_at": "2019-04-11T02:46:15.580Z", "content_type": 41, "locked": false, "url_path": "/home/como-colaborar/alianzas/", "go_live_at": null, "nota_pie": "<h6>Las empresas donantes pueden obtener un beneficio impositivo, ya que Don Bosco Argentina se encuentra inscripta como entidad beneficiaria, reconocida como exenta del Impuesto a las Ganancias. De esta manera, las donaciones realizadas a nuestra organizaci\\u00f3n podr\\u00e1n deducirse de este impuesto, hasta el l\\u00edmite del 5% de la renta neta del per\\u00edodo fiscal correspondiente.</h6><h6>Para mayor informaci\\u00f3n contactarse con</h6><h4><b>alianzas@porlosjovenes.org</b></h4>", "live_revision": 67, "draft_title": "Alianzas", "title": "Alianzas", "first_published_at": "2019-04-10T07:39:32.813Z", "expired": false, "seo_title": "", "expire_at": null, "owner": 3, "path": "0001000100050001", "slug": "alianzas", "has_unpublished_changes": false, "live": true, "pk": 19, "imagen_principal": 15, "numchild": 0, "last_published_at": "2019-04-11T02:46:16.552Z", "search_description": "", "listado_alianzas": [{"page": 19, "pk": 1, "descripcion": "Conoc\\u00e9 las propuestas socioeducativas de Don Bosco en todo el pa\\u00eds y desarroll\\u00e1 acciones por la educaci\\u00f3n.", "titulo": "Constru\\u00ed alianzas locales socioeducativas", "sort_order": 0}, {"page": 19, "pk": 2, "descripcion": "Canaliz\\u00e1 tus programas de responsabilidad social empresaria (RSE) a trav\\u00e9s de las diferentes \\u00e1reas de acci\\u00f3n de Don Bosco Argentina.", "titulo": "Impuls\\u00e1 programas de responsabilidad social (RSE)", "sort_order": 1}, {"page": 19, "pk": 3, "descripcion": "Desarroll\\u00e1 campa\\u00f1as de comunicaci\\u00f3n entre clientes, empleados y usuarios que fomenten el compromiso con la educaci\\u00f3n y la solidaridad.", "titulo": "Realiz\\u00e1 campa\\u00f1as de comunicaci\\u00f3n y sensibilizaci\\u00f3n", "sort_order": 2}, {"page": 19, "pk": 4, "descripcion": "La app que propone llevar una vida saludable mientras se realiza una acci\\u00f3n solidaria  Potenci\\u00e1 tu imagen corporativa promoviendo la vida sana y la solidaridad. Obten\\u00e9 presencia de marca realizando ap", "titulo": "Sumate a la app 1K Por los J\\u00f3venes", "sort_order": 3}, {"page": 19, "pk": 5, "descripcion": "S\\u00e9 parte del evento que moviliza a todos los que trabajamos Por los J\\u00f3venes el 8 de diciembre, en Vicente L\\u00f3pez.   - Invit\\u00e1 a tus empleados con precio promocional  - Patrocin\\u00e1 el evento  - Particip\\u00e1", "titulo": "Sumate a Buenos Aires Corre Por Los J\\u00f3venes", "sort_order": 4}, {"page": 19, "pk": 6, "descripcion": "Recibimos donaciones que colaboren con las propuestas socioeducativas de Don Bosco:  Equipamiento y materiales para formaci\\u00f3n profesional \\u00datiles escolares Equipamiento inform\\u00e1tico Herramientas de trab", "titulo": "Contribu\\u00ed con donaciones", "sort_order": 5}], "depth": 4}	\N	19	3
69	f	2019-04-10 23:51:10.354-03	{"show_in_menus": false, "latest_revision_created_at": "2019-04-11T02:49:43.311Z", "content_type": 41, "locked": false, "url_path": "/home/como-colaborar/alianzas/", "go_live_at": null, "nota_pie": "<h5>Las empresas donantes pueden obtener un beneficio impositivo, ya que Don Bosco Argentina se encuentra inscripta como entidad beneficiaria, reconocida como exenta del Impuesto a las Ganancias. De esta manera, las donaciones realizadas a nuestra organizaci\\u00f3n podr\\u00e1n deducirse de este impuesto, hasta el l\\u00edmite del 5% de la renta neta del per\\u00edodo fiscal correspondiente.</h5><h5>Para mayor informaci\\u00f3n contactarse con</h5><h5><b>alianzas@porlosjovenes.org</b></h5>", "live_revision": 68, "draft_title": "Alianzas", "title": "Alianzas", "first_published_at": "2019-04-10T07:39:32.813Z", "expired": false, "seo_title": "", "expire_at": null, "owner": 3, "path": "0001000100050001", "slug": "alianzas", "has_unpublished_changes": false, "live": true, "pk": 19, "imagen_principal": 15, "numchild": 0, "last_published_at": "2019-04-11T02:49:44.261Z", "search_description": "", "listado_alianzas": [{"page": 19, "pk": 1, "descripcion": "Conoc\\u00e9 las propuestas socioeducativas de Don Bosco en todo el pa\\u00eds y desarroll\\u00e1 acciones por la educaci\\u00f3n.", "titulo": "Constru\\u00ed alianzas locales socioeducativas", "sort_order": 0}, {"page": 19, "pk": 2, "descripcion": "Canaliz\\u00e1 tus programas de responsabilidad social empresaria (RSE) a trav\\u00e9s de las diferentes \\u00e1reas de acci\\u00f3n de Don Bosco Argentina.", "titulo": "Impuls\\u00e1 programas de responsabilidad social (RSE)", "sort_order": 1}, {"page": 19, "pk": 3, "descripcion": "Desarroll\\u00e1 campa\\u00f1as de comunicaci\\u00f3n entre clientes, empleados y usuarios que fomenten el compromiso con la educaci\\u00f3n y la solidaridad.", "titulo": "Realiz\\u00e1 campa\\u00f1as de comunicaci\\u00f3n y sensibilizaci\\u00f3n", "sort_order": 2}, {"page": 19, "pk": 4, "descripcion": "La app que propone llevar una vida saludable mientras se realiza una acci\\u00f3n solidaria  Potenci\\u00e1 tu imagen corporativa promoviendo la vida sana y la solidaridad. Obten\\u00e9 presencia de marca realizando ap", "titulo": "Sumate a la app 1K Por los J\\u00f3venes", "sort_order": 3}, {"page": 19, "pk": 5, "descripcion": "S\\u00e9 parte del evento que moviliza a todos los que trabajamos Por los J\\u00f3venes el 8 de diciembre, en Vicente L\\u00f3pez.   - Invit\\u00e1 a tus empleados con precio promocional  - Patrocin\\u00e1 el evento  - Particip\\u00e1", "titulo": "Sumate a Buenos Aires Corre Por Los J\\u00f3venes", "sort_order": 4}, {"page": 19, "pk": 6, "descripcion": "Recibimos donaciones que colaboren con las propuestas socioeducativas de Don Bosco:  Equipamiento y materiales para formaci\\u00f3n profesional \\u00datiles escolares Equipamiento inform\\u00e1tico Herramientas de trab", "titulo": "Contribu\\u00ed con donaciones", "sort_order": 5}], "depth": 4}	\N	19	3
70	f	2019-04-10 23:57:00.186-03	{"latest_revision_created_at": "2019-04-11T02:51:10.354Z", "listado_alianzas": [{"pk": 1, "sort_order": 0, "descripcion": "<p>Conoc\\u00e9 las propuestas socioeducativas de Don Bosco en todo el pa\\u00eds y desarroll\\u00e1 acciones por la educaci\\u00f3n.</p>", "titulo": "Constru\\u00ed alianzas locales socioeducativas", "page": 19}, {"pk": 2, "sort_order": 1, "descripcion": "<p>Canaliz\\u00e1 tus programas de responsabilidad social empresaria (RSE) a trav\\u00e9s de las diferentes \\u00e1reas de acci\\u00f3n de Don Bosco Argentina.</p>", "titulo": "Impuls\\u00e1 programas de responsabilidad social (RSE)", "page": 19}, {"pk": 3, "sort_order": 2, "descripcion": "<p>Desarroll\\u00e1 campa\\u00f1as de comunicaci\\u00f3n entre clientes, empleados y usuarios que fomenten el compromiso con la educaci\\u00f3n y la solidaridad.</p>", "titulo": "Realiz\\u00e1 campa\\u00f1as de comunicaci\\u00f3n y sensibilizaci\\u00f3n", "page": 19}, {"pk": 4, "sort_order": 3, "descripcion": "<p>La app que propone llevar una vida saludable mientras se realiza una acci\\u00f3n solidaria</p><p>- Potenci\\u00e1 tu imagen corporativa promoviendo la vida sana y la solidaridad.</p><p>- Obten\\u00e9 presencia de marca realizando aportes por cada Km que los usuarios recorren, sea caminando, andando en bicicleta o corriendo.</p>", "titulo": "Sumate a la app 1K Por los J\\u00f3venes", "page": 19}, {"pk": 5, "sort_order": 4, "descripcion": "<p>S\\u00e9 parte del evento que moviliza a todos los que trabajamos Por los J\\u00f3venes el 8 de diciembre, en Vicente L\\u00f3pez.\\u00a0</p><p>- Invit\\u00e1 a tus empleados con precio promocional</p><p>- Patrocin\\u00e1 el evento</p><p>- Particip\\u00e1 con tu stand y difund\\u00ed tus acciones por la educaci\\u00f3n y los j\\u00f3venes</p>", "titulo": "Sumate a Buenos Aires Corre Por Los J\\u00f3venes", "page": 19}, {"pk": 6, "sort_order": 5, "descripcion": "<p>Recibimos donaciones que colaboren con las propuestas socioeducativas de Don Bosco:<br/></p><p>- Equipamiento y materiales para formaci\\u00f3n profesional</p><p>- \\u00datiles escolares</p><p>- Equipamiento inform\\u00e1tico</p><p>- Herramientas de trabajo y maquinarias</p><p>- Indumentaria deportiva y calzado</p><p>- Elementos deportivos</p><p>- Otros</p>", "titulo": "Contribu\\u00ed con donaciones", "page": 19}], "path": "0001000100050001", "content_type": 41, "pk": 19, "expired": false, "go_live_at": null, "depth": 4, "live": true, "draft_title": "Alianzas", "search_description": "", "url_path": "/home/como-colaborar/alianzas/", "owner": 3, "slug": "alianzas", "expire_at": null, "first_published_at": "2019-04-10T07:39:32.813Z", "last_published_at": "2019-04-11T02:51:11.353Z", "has_unpublished_changes": false, "imagen_principal": 15, "seo_title": "", "locked": false, "numchild": 0, "title": "Alianzas", "nota_pie": "<h5>Las empresas donantes pueden obtener un beneficio impositivo, ya que Don Bosco Argentina se encuentra inscripta como entidad beneficiaria, reconocida como exenta del Impuesto a las Ganancias. De esta manera, las donaciones realizadas a nuestra organizaci\\u00f3n podr\\u00e1n deducirse de este impuesto, hasta el l\\u00edmite del 5% de la renta neta del per\\u00edodo fiscal correspondiente.</h5><h5>Para mayor informaci\\u00f3n contactarse con</h5><h5><b>alianzas@porlosjovenes.org</b></h5>", "live_revision": 69, "show_in_menus": false}	\N	19	3
72	f	2019-04-11 00:56:56.486-03	{"title": "Que Hacemos", "educacion_texto": "Acceder a educaci\\u00f3n es construir las herramientas intelectuales y personales que permiten a cada uno moldear su presente y su futuro. La educaci\\u00f3n Inicial, Primaria, Secundaria, Terciaria y Universitaria es integral: apunta al crecimiento de la persona en su complejidad (intelectual, espiritual, afectiva y corporal).", "latest_revision_created_at": "2019-04-11T03:55:04.580Z", "live": true, "draft_title": "Que Hacemos", "show_in_menus": false, "trabajo_texto": "Llevar una vida digna y crecer como personas requiere trabajar, para lo cual es necesario formarse. La formaci\\u00f3n para el trabajo y la educaci\\u00f3n t\\u00e9cnico profesional (escuelas t\\u00e9cnicas, agrot\\u00e9cnicas \\u2013EAS- y centros de formaci\\u00f3n profesional) significan aprendizaje t\\u00e9cnico y pr\\u00e1ctico fundamentado en valores, para que cada joven d\\u00e9 forma a un futuro estable.", "educacion_imagen": 18, "acciones_texto": "Acompa\\u00f1amiento cotidiano a familias de parajes aislados y de escasos recursos, construyendo con ellas inclusi\\u00f3n educativa, acercando bienes materiales y conectando a unas comunidades con otras para romper la exclusi\\u00f3n y el aislamiento.", "seo_title": "", "locked": false, "path": "000100010003", "depth": 3, "expire_at": null, "pk": 11, "imagen_principal": 16, "content_type": 34, "slug": "que-hacemos", "live_revision": 12, "last_published_at": "2019-04-10T06:51:51.982Z", "banner_imagen": 17, "has_unpublished_changes": true, "acciones_imagen": 21, "trabajo_imagen": 19, "comunitaria_texto": "Cuando las necesidades son grandes, m\\u00e1s grandes a\\u00fan son las respuestas para paliarlas. Las propuestas de Don Bosco Argentina orientadas a los chicos y chicas m\\u00e1s vulnerables econ\\u00f3mica y afectivamente, como hogares, centros de d\\u00eda y colonias, permiten vivir en condiciones dignas y crecer en un ambiente sano.", "banner_url": "https://porlosjovenes.org/quierodonar", "comunitaria_imagen": 20, "expired": false, "url_path": "/home/que-hacemos/", "numchild": 0, "search_description": "", "owner": 3, "go_live_at": null, "first_published_at": "2019-04-10T06:51:51.982Z"}	\N	11	3
73	f	2019-04-11 01:11:31.126-03	{"owner": 3, "title": "Quienes Somos", "show_in_menus": false, "imagen_principal": 22, "content_type": 35, "draft_title": "Quienes Somos", "seo_title": "", "depth": 4, "numchild": 0, "has_unpublished_changes": true, "expired": false, "live": false, "expire_at": null, "live_revision": null, "pk": 14, "first_published_at": null, "go_live_at": null, "locked": false, "url_path": "/home/nosotros/quienes-somos/", "path": "0001000100020002", "search_description": "", "slug": "quienes-somos", "latest_revision_created_at": "2019-04-10T06:58:40.203Z", "last_published_at": null}	\N	14	3
74	f	2019-04-11 01:43:41.402-03	{"go_live_at": null, "pk": 15, "slug": "transparencia", "path": "0001000100020003", "seo_title": "", "title": "Transparencia", "memoria_balance": [{"memoria_url": "https://www.yumpu.com/es/embed/view/oaR13L2TzhOMYdlj", "pk": null, "sort_order": 0, "page": 15, "memoria_descripcion": "Memoria 2017"}, {"memoria_url": "https://www.yumpu.com/es/embed/view/YrjnRyWIK2SXH6iO", "pk": null, "sort_order": 1, "page": 15, "memoria_descripcion": "Memoria 2018"}], "show_in_menus": false, "expire_at": null, "locked": false, "live": true, "expired": false, "latest_revision_created_at": "2019-04-10T07:00:50.077Z", "imagen_principal": 23, "search_description": "", "numchild": 0, "first_published_at": "2019-04-10T07:00:50.470Z", "content_type": 33, "depth": 4, "last_published_at": "2019-04-10T07:00:50.470Z", "draft_title": "Transparencia", "owner": 3, "url_path": "/home/nosotros/transparencia/", "has_unpublished_changes": false, "live_revision": 17}	\N	15	3
75	f	2019-04-11 02:47:47.363-03	{"go_live_at": null, "first_published_at": null, "depth": 3, "seo_title": "", "search_description": "", "expire_at": null, "title": "Nosotros", "path": "000100010002", "owner": 3, "expired": false, "show_in_menus": false, "content_type": 32, "last_published_at": null, "url_path": "/home/nosotros/", "numchild": 3, "latest_revision_created_at": "2019-04-10T06:50:39.474Z", "live": false, "live_revision": null, "locked": false, "pk": 10, "has_unpublished_changes": true, "draft_title": "Nosotros", "slug": "nosotros"}	\N	10	3
76	f	2019-04-11 03:18:28.084-03	{"show_in_menus": false, "gallery_images": [{"pk": 2, "page": 31, "sort_order": 0, "caption": "Imagen de prueba 1", "image": 23}, {"pk": 3, "page": 31, "sort_order": 1, "caption": "Imagen de prueba 2", "image": 22}, {"pk": 4, "page": 31, "sort_order": 2, "caption": "Imagen de prueba 3", "image": 16}], "depth": 4, "pk": 31, "go_live_at": null, "content_type": 31, "live": true, "slug": "noti-1", "body": "<p><b>Lorem Ipsum</b> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#x27;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>", "has_unpublished_changes": false, "seo_title": "", "locked": false, "expired": false, "numchild": 0, "first_published_at": null, "title": "Noti 1", "intro": "noticia bajada", "live_revision": null, "last_published_at": null, "date": "2019-04-11", "latest_revision_created_at": null, "expire_at": null, "draft_title": "Noti 1", "url_path": "/home/noticias/noti-1/", "path": "0001000100010001", "search_description": "", "owner": 3}	\N	31	3
77	f	2019-04-11 03:20:16.274-03	{"show_in_menus": false, "gallery_images": [{"pk": 5, "page": 32, "sort_order": 0, "caption": "Imagen de texto 2", "image": 15}, {"pk": 6, "page": 32, "sort_order": 1, "caption": "Imagen de texto 2 donar", "image": 13}], "depth": 4, "pk": 32, "go_live_at": null, "content_type": 31, "live": true, "slug": "prueba-2", "body": "<p><b>Lorem Ipsum</b> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#x27;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p><p><b>Lorem Ipsum</b> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#x27;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>", "has_unpublished_changes": false, "seo_title": "", "locked": false, "expired": false, "numchild": 0, "first_published_at": null, "title": "Prueba 2", "intro": "Bajada 2 un poco mas larga que la enterior", "live_revision": null, "last_published_at": null, "date": "2019-04-04", "latest_revision_created_at": null, "expire_at": null, "draft_title": "Prueba 2", "url_path": "/home/noticias/prueba-2/", "path": "0001000100010002", "search_description": "", "owner": 3}	\N	32	3
78	f	2019-04-11 03:46:57.744-03	{"depth": 4, "go_live_at": null, "pk": 32, "content_type": 31, "url_path": "/home/noticias/prueba-2/", "show_in_menus": false, "last_published_at": "2019-04-11T06:20:16.787Z", "has_unpublished_changes": false, "date": "2019-04-04", "gallery_images": [{"sort_order": 0, "pk": 5, "image": 15, "caption": "Imagen de texto 2", "page": 32}, {"sort_order": 1, "pk": 6, "image": 13, "caption": "Imagen de texto 2 donar", "page": 32}], "seo_title": "", "search_description": "", "numchild": 0, "draft_title": "Prueba 2", "expired": false, "path": "0001000100010002", "title": "Prueba 2", "intro": "Bajada 2 un poco mas larga que la enterior", "body": "<p><b>Lorem Ipsum</b> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#x27;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p><p><b>Lorem Ipsum</b> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#x27;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>", "live": true, "categoria": "CAT3", "locked": false, "live_revision": 77, "latest_revision_created_at": "2019-04-11T06:20:16.274Z", "first_published_at": "2019-04-11T06:20:16.787Z", "slug": "prueba-2", "expire_at": null, "owner": 3}	\N	32	3
79	f	2019-04-11 10:53:22.687-03	{"path": "000100010001", "expired": false, "go_live_at": null, "last_published_at": null, "owner": 3, "pk": 12, "expire_at": null, "url_path": "/home/noticias/", "depth": 3, "numchild": 2, "locked": false, "first_published_at": null, "search_description": "", "draft_title": "Noticias", "live": false, "live_revision": null, "show_in_menus": false, "latest_revision_created_at": "2019-04-10T06:52:27.051Z", "title": "Noticias", "slug": "noticias", "seo_title": "", "has_unpublished_changes": true, "content_type": 28}	\N	12	3
80	f	2019-04-11 11:34:40.93-03	{"categoria": "CAT1", "path": "0001000100010003", "intro": "bajada de la noticia breve resumen", "pk": 33, "title": "Prueba de noticia 3", "slug": "prueba-de-noticia-3", "url_path": "/home/noticias/prueba-de-noticia-3/", "expire_at": null, "go_live_at": null, "owner": 3, "seo_title": "", "first_published_at": null, "content_type": 31, "depth": 4, "locked": false, "expired": false, "date": "2019-05-02", "show_in_menus": false, "search_description": "", "body": "<p></p><embed alt=\\"595a26a84b952_647_365-1.jpg\\" embedtype=\\"image\\" format=\\"left\\" id=\\"23\\"/><p></p>", "numchild": 0, "has_unpublished_changes": false, "live": true, "live_revision": null, "last_published_at": null, "latest_revision_created_at": null, "draft_title": "Prueba de noticia 3", "gallery_images": [{"caption": "gente", "sort_order": 0, "image": 21, "pk": 7, "page": 33}, {"caption": "mano", "sort_order": 1, "image": 20, "pk": 8, "page": 33}]}	\N	33	3
81	f	2019-04-11 14:24:44.935-03	{"content_type": 31, "categoria": "Educacion", "slug": "prueba-de-noticia-3", "numchild": 0, "title": "Prueba de noticia 3", "intro": "bajada de la noticia breve resumen", "path": "0001000100010003", "imagen_portada": 22, "gallery_images": [{"pk": 7, "page": 33, "image": 21, "caption": "gente", "sort_order": 0}, {"pk": 8, "page": 33, "image": 20, "caption": "mano", "sort_order": 1}], "live_revision": 80, "go_live_at": null, "expire_at": null, "has_unpublished_changes": false, "live": true, "date": "2019-05-02", "first_published_at": "2019-04-11T14:34:41.435Z", "body": "<p></p><embed alt=\\"595a26a84b952_647_365-1.jpg\\" embedtype=\\"image\\" format=\\"left\\" id=\\"23\\"/><p></p>", "locked": false, "url_path": "/home/noticias/prueba-de-noticia-3/", "owner": 3, "draft_title": "Prueba de noticia 3", "expired": false, "pk": 33, "seo_title": "", "search_description": "", "latest_revision_created_at": "2019-04-11T14:34:40.930Z", "depth": 4, "last_published_at": "2019-04-11T14:34:41.435Z", "show_in_menus": false}	\N	33	3
82	f	2019-04-11 14:36:20.966-03	{"content_type": 31, "categoria": "Educacion", "slug": "prueba-2", "numchild": 0, "title": "Prueba 2", "intro": "Bajada 2 un poco mas larga que la enterior", "path": "0001000100010002", "imagen_portada": 16, "gallery_images": [{"pk": 5, "page": 32, "image": 15, "caption": "Imagen de texto 2", "sort_order": 0}, {"pk": 6, "page": 32, "image": 13, "caption": "Imagen de texto 2 donar", "sort_order": 1}], "live_revision": 78, "go_live_at": null, "expire_at": null, "has_unpublished_changes": false, "live": true, "date": "2019-04-04", "first_published_at": "2019-04-11T06:20:16.787Z", "body": "<p><b>Lorem Ipsum</b> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#x27;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p><p><b>Lorem Ipsum</b> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#x27;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>", "locked": false, "url_path": "/home/noticias/prueba-2/", "owner": 3, "draft_title": "Prueba 2", "expired": false, "pk": 32, "seo_title": "", "search_description": "", "latest_revision_created_at": "2019-04-11T06:46:57.744Z", "depth": 4, "last_published_at": "2019-04-11T06:46:58.522Z", "show_in_menus": false}	\N	32	3
83	f	2019-04-11 14:37:24.408-03	{"content_type": 31, "categoria": "Educacion", "slug": "noti-1", "numchild": 0, "title": "Noti 1", "intro": "noticia bajada", "path": "0001000100010001", "imagen_portada": 12, "gallery_images": [{"pk": 2, "page": 31, "image": 23, "caption": "Imagen de prueba 1", "sort_order": 0}, {"pk": 3, "page": 31, "image": 22, "caption": "Imagen de prueba 2", "sort_order": 1}, {"pk": 4, "page": 31, "image": 16, "caption": "Imagen de prueba 3", "sort_order": 2}], "live_revision": 76, "go_live_at": null, "expire_at": null, "has_unpublished_changes": false, "live": true, "date": "2019-04-11", "first_published_at": "2019-04-11T06:18:28.614Z", "body": "<p><b>Lorem Ipsum</b> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#x27;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>", "locked": false, "url_path": "/home/noticias/noti-1/", "owner": 3, "draft_title": "Noti 1", "expired": false, "pk": 31, "seo_title": "", "search_description": "", "latest_revision_created_at": "2019-04-11T06:18:28.084Z", "depth": 4, "last_published_at": "2019-04-11T06:18:28.614Z", "show_in_menus": false}	\N	31	3
84	f	2019-04-22 02:07:45.214546-03	{"url_path": "/home/", "seo_title": "", "expire_at": null, "depth": 2, "content_type": 2, "go_live_at": null, "draft_title": "Home", "slug": "home", "pk": 3, "locked": false, "first_published_at": null, "expired": false, "path": "00010001", "search_description": "", "title": "Por Los jovenes", "last_published_at": null, "live_revision": null, "latest_revision_created_at": null, "show_in_menus": false, "owner": null, "numchild": 6, "has_unpublished_changes": false, "live": true}	\N	3	3
87	f	2019-04-22 06:26:04.416425-03	{"path": "00010001", "title": "Por Los jovenes", "slider_home": [{"image": 25, "page": 3, "boton": false, "pk": 1, "caption": "", "text_boton": "", "message": "<h2></h2><h2></h2><p></p><h2></h2><h2>La educaci\\u00f3n de hoy</h2><h2>son las oportunidades</h2><h2>de ma\\u00f1ana</h2>", "sort_order": 0, "url_boton": ""}, {"image": 26, "page": 3, "boton": false, "pk": 2, "caption": "", "text_boton": "", "message": "<h2></h2><h2></h2><h2></h2><h2></h2><h2>El futuro esta en sus manos</h2><h2>Hagamoslo posible</h2>", "sort_order": 1, "url_boton": ""}, {"image": 27, "page": 3, "boton": true, "pk": 3, "caption": "", "text_boton": "Quiero Donar", "message": "<p></p>", "sort_order": 2, "url_boton": "https://porlosjovenes.org/quierodonar"}], "content_type": 2, "live": true, "go_live_at": null, "url_path": "/home/", "last_published_at": "2019-04-22T08:10:01.706Z", "expire_at": null, "numchild": 6, "search_description": "", "has_unpublished_changes": false, "live_revision": 86, "show_in_menus": false, "seo_title": "", "expired": false, "latest_revision_created_at": "2019-04-22T08:10:01.212Z", "slug": "home", "pk": 3, "draft_title": "Por Los jovenes", "locked": false, "owner": null, "depth": 2, "first_published_at": "2019-04-22T05:07:45.550Z"}	\N	3	3
88	f	2019-04-22 06:30:48.097691-03	{"path": "00010001", "title": "Por Los jovenes", "slider_home": [{"image": 25, "page": 3, "boton": false, "pk": 1, "caption": "", "text_boton": "", "message": "<p><br/><br/><br/><br/><br/><br/></p><h2>La educaci\\u00f3n de hoy</h2><h2>son las oportunidades</h2><h2>de ma\\u00f1ana</h2>", "sort_order": 0, "url_boton": ""}, {"image": 26, "page": 3, "boton": false, "pk": 2, "caption": "", "text_boton": "", "message": "<h2><br/><br/><br/><br/><br/>El futuro esta en sus manos</h2><h2>Hagamoslo posible</h2>", "sort_order": 1, "url_boton": ""}, {"image": 27, "page": 3, "boton": true, "pk": 3, "caption": "", "text_boton": "Quiero Donar", "message": "<p></p>", "sort_order": 2, "url_boton": "https://porlosjovenes.org/quierodonar"}], "content_type": 2, "live": true, "go_live_at": null, "url_path": "/home/", "last_published_at": "2019-04-22T09:26:04.896Z", "expire_at": null, "numchild": 6, "search_description": "", "has_unpublished_changes": false, "live_revision": 87, "show_in_menus": false, "seo_title": "", "expired": false, "latest_revision_created_at": "2019-04-22T09:26:04.416Z", "slug": "home", "pk": 3, "draft_title": "Por Los jovenes", "locked": false, "owner": null, "depth": 2, "first_published_at": "2019-04-22T05:07:45.550Z"}	\N	3	3
89	f	2019-04-22 06:31:30.866605-03	{"path": "00010001", "title": "Por Los jovenes", "slider_home": [{"image": 25, "page": 3, "boton": false, "pk": 1, "caption": "", "text_boton": "", "message": "<p><br/><br/><br/><br/><br/><br/><br/><br/><br/></p><h2>La educaci\\u00f3n de hoy</h2><h2>son las oportunidades</h2><h2>de ma\\u00f1ana</h2>", "sort_order": 0, "url_boton": ""}, {"image": 26, "page": 3, "boton": false, "pk": 2, "caption": "", "text_boton": "", "message": "<h2><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>El futuro esta en sus manos</h2><h2>Hagamoslo posible</h2>", "sort_order": 1, "url_boton": ""}, {"image": 27, "page": 3, "boton": true, "pk": 3, "caption": "", "text_boton": "Quiero Donar", "message": "<p></p>", "sort_order": 2, "url_boton": "https://porlosjovenes.org/quierodonar"}], "content_type": 2, "live": true, "go_live_at": null, "url_path": "/home/", "last_published_at": "2019-04-22T09:30:48.561Z", "expire_at": null, "numchild": 6, "search_description": "", "has_unpublished_changes": false, "live_revision": 88, "show_in_menus": false, "seo_title": "", "expired": false, "latest_revision_created_at": "2019-04-22T09:30:48.097Z", "slug": "home", "pk": 3, "draft_title": "Por Los jovenes", "locked": false, "owner": null, "depth": 2, "first_published_at": "2019-04-22T05:07:45.550Z"}	\N	3	3
85	f	2019-04-22 03:42:17.466546-03	{"has_unpublished_changes": false, "show_in_menus": false, "content_type": 2, "pk": 3, "depth": 2, "live_revision": 84, "slider_home": [{"boton": false, "caption": "", "sort_order": 0, "page": 3, "image": 25, "url_boton": "", "pk": null, "text_boton": "", "message": "<p>La educaci\\u00f3n de hoy</p><p>son las oportunidades </p><p>de ma\\u00f1ana</p>"}, {"boton": false, "caption": "", "sort_order": 1, "page": 3, "image": 26, "url_boton": "", "pk": null, "text_boton": "", "message": "<p>El futuro esta en sus manos</p><p>Hagamoslo posible</p>"}, {"boton": true, "caption": "", "sort_order": 2, "page": 3, "image": 27, "url_boton": "https://porlosjovenes.org/quierodonar", "pk": null, "text_boton": "Quiero Donar", "message": "<p></p>"}], "latest_revision_created_at": "2019-04-22T05:07:45.214Z", "path": "00010001", "locked": false, "last_published_at": "2019-04-22T05:07:45.550Z", "first_published_at": "2019-04-22T05:07:45.550Z", "seo_title": "", "draft_title": "Por Los jovenes", "title": "Por Los jovenes", "live": true, "expired": false, "owner": null, "numchild": 6, "search_description": "", "go_live_at": null, "slug": "home", "expire_at": null, "url_path": "/home/"}	\N	3	3
86	f	2019-04-22 05:10:01.212528-03	{"seo_title": "", "locked": false, "go_live_at": null, "slug": "home", "expired": false, "depth": 2, "slider_home": [{"boton": false, "text_boton": "", "image": 25, "sort_order": 0, "url_boton": "", "caption": "", "pk": 1, "page": 3, "message": "<p>La educaci\\u00f3n de hoy</p><p>son las oportunidades</p><p>de ma\\u00f1ana</p>"}, {"boton": false, "text_boton": "", "image": 26, "sort_order": 1, "url_boton": "", "caption": "", "pk": 2, "page": 3, "message": "<p>El futuro esta en sus manos</p><p>Hagamoslo posible</p>"}, {"boton": true, "text_boton": "Quiero Donar", "image": 27, "sort_order": 2, "url_boton": "https://porlosjovenes.org/quierodonar", "caption": "", "pk": 3, "page": 3, "message": "<p></p>"}], "numchild": 6, "owner": null, "live_revision": 85, "path": "00010001", "url_path": "/home/", "first_published_at": "2019-04-22T05:07:45.550Z", "search_description": "", "has_unpublished_changes": false, "title": "Por Los jovenes", "expire_at": null, "show_in_menus": false, "last_published_at": "2019-04-22T06:42:17.960Z", "live": true, "latest_revision_created_at": "2019-04-22T06:42:17.466Z", "pk": 3, "draft_title": "Por Los jovenes", "content_type": 2}	\N	3	3
\.


--
-- Data for Name: wagtailcore_pageviewrestriction; Type: TABLE DATA; Schema: public; Owner: jovenes
--

COPY public.wagtailcore_pageviewrestriction (id, password, page_id, restriction_type) FROM stdin;
\.


--
-- Data for Name: wagtailcore_pageviewrestriction_groups; Type: TABLE DATA; Schema: public; Owner: jovenes
--

COPY public.wagtailcore_pageviewrestriction_groups (id, pageviewrestriction_id, group_id) FROM stdin;
\.


--
-- Data for Name: wagtailcore_site; Type: TABLE DATA; Schema: public; Owner: jovenes
--

COPY public.wagtailcore_site (id, hostname, port, is_default_site, root_page_id, site_name) FROM stdin;
2	localhost	80	t	3	porlosjovenes
\.


--
-- Data for Name: wagtaildocs_document; Type: TABLE DATA; Schema: public; Owner: jovenes
--

COPY public.wagtaildocs_document (id, title, file, created_at, uploaded_by_user_id, collection_id, file_size, file_hash) FROM stdin;
1	Reglamento General	documents/reglamento2.pdf	2019-04-10 19:49:45.288-03	3	1	283922	c6b9251a03d614ffcb6fe0d5e0b0b71e0e062ad1
2	Autorizacion Menores	documents/autorizacion2.pdf	2019-04-10 19:50:12.66-03	3	1	115872	d2b74b432c71cacb6ae6efb1df268402fd4e84f0
\.


--
-- Data for Name: wagtailembeds_embed; Type: TABLE DATA; Schema: public; Owner: jovenes
--

COPY public.wagtailembeds_embed (id, url, max_width, type, html, title, author_name, provider_name, thumbnail_url, width, height, last_updated) FROM stdin;
\.


--
-- Data for Name: wagtailforms_formsubmission; Type: TABLE DATA; Schema: public; Owner: jovenes
--

COPY public.wagtailforms_formsubmission (id, form_data, submit_time, page_id) FROM stdin;
\.


--
-- Data for Name: wagtailimages_image; Type: TABLE DATA; Schema: public; Owner: jovenes
--

COPY public.wagtailimages_image (id, title, file, width, height, created_at, focal_point_x, focal_point_y, focal_point_width, focal_point_height, uploaded_by_user_id, file_size, collection_id, file_hash) FROM stdin;
1	55845484_10217976041933890_3274402394099679232_n.jpg	original_images/55845484_10217976041933890_3274402394099679232_n.jpg	960	503	2019-04-08 17:43:53.486-03	\N	\N	\N	\N	3	88344	1	e909c86938bfd95ffc82a8bde8a5bceab4d891fd
2	logo8a.jpg	original_images/logo8a.jpg	150	150	2019-04-10 06:57:02.84-03	\N	\N	\N	\N	3	4392	1	dc8c0dc1d228dad79a497aa145a9ed5727f96297
3	racing-ok.jpg	original_images/racing-ok.jpg	512	512	2019-04-10 07:01:47.928-03	\N	\N	\N	\N	3	31718	1	04021c94fe66bbf543b94e68393b931065a81d8b
4	Isologo_Mostaza_2018_(002)1.png	original_images/Isologo_Mostaza_2018_0021.png	1629	1165	2019-04-10 07:07:26.38-03	\N	\N	\N	\N	3	47057	1	4eae9eeaee847657d9cc63a3c922805e70d745e6
5	Nivea.jpg	original_images/Nivea.jpg	2135	2134	2019-04-10 12:42:01.313-03	\N	\N	\N	\N	3	69318	1	5923c0f38791820a11ca2bf76d6a00a6d6166969
6	PIEZA_PARA_WEB4.jpg	original_images/PIEZA_PARA_WEB4.jpg	2000	923	2019-04-10 16:44:26.949-03	\N	\N	\N	\N	3	324620	1	4fd3eb3e987ad36b845917da4093879823aaf741
7	PIEZA_PARA_WEB_desk4.jpg	original_images/PIEZA_PARA_WEB_desk4.jpg	2000	835	2019-04-10 16:44:46.29-03	\N	\N	\N	\N	3	1263569	1	14a1b74cdd9e98d02cdecf490a98d4f1661739d2
8	PIEZA_PARA_WEB_desk4.jpg	original_images/PIEZA_PARA_WEB_desk4_EKmwIk6.jpg	2000	835	2019-04-10 17:06:25.311-03	\N	\N	\N	\N	3	1263569	1	14a1b74cdd9e98d02cdecf490a98d4f1661739d2
9	PIEZA_PARA_WEB_MOBILE_2.jpg	original_images/PIEZA_PARA_WEB_MOBILE_2.jpg	600	600	2019-04-10 17:08:48.58-03	\N	\N	\N	\N	3	365907	1	7d97d862e8ad30d0ea0c0d1ed39ee751f571cefb
10	Mapa	original_images/mapa2.jpg	1172	543	2019-04-10 20:08:37.089-03	\N	\N	\N	\N	3	87744	1	4678cace43ae34c880ff290ed2afd9403001f9a7
11	remera1.jpg	original_images/remera1.jpg	963	463	2019-04-10 20:15:23.184-03	\N	\N	\N	\N	3	49247	1	09b999209129335a63c84a609a97ecee7ab4d0c2
12	iphone-4-415708_1920.jpg	original_images/iphone-4-415708_1920.jpg	1920	1280	2019-04-10 21:53:45.385-03	\N	\N	\N	\N	3	396069	1	cc0d0fca0a4401ff644453e0563d06c887a1970c
13	donar.jpg	original_images/donar.jpg	446	469	2019-04-10 22:12:06.767-03	\N	\N	\N	\N	3	32452	1	2d60368fcc9e5cadf83a91e86a17c892c82adbe0
14	Foto_legados_y_herencias_21.JPG	original_images/Foto_legados_y_herencias_21.JPG	2000	592	2019-04-10 22:46:14.17-03	\N	\N	\N	\N	3	447765	1	8898d151ddcad808a5d61310f51996647a27bda0
15	Foto_comunicación_3.jpg	original_images/Foto_comunicacion_3.jpg	2657	1772	2019-04-10 23:15:49.684-03	\N	\N	\N	\N	3	3329475	1	8963a7c844f85a67b73e1927bc6a6fcaf1d018fc
16	quehacemos.jpg	original_images/quehacemos.jpg	1900	704	2019-04-11 00:47:50.845-03	\N	\N	\N	\N	3	178921	1	3e57fd5e4ba725dc390ba3bcb784cc83b41d1d33
17	banner_2_gif4.gif	original_images/banner_2_gif4.gif	298	731	2019-04-11 00:48:38.733-03	\N	\N	\N	\N	3	120414	1	f4e859fdca724c4d7f1a4dccc2fde10d4369f4c9
18	ico_educacion.png	original_images/ico_educacion.png	112	80	2019-04-11 00:52:48.957-03	\N	\N	\N	\N	3	48787	1	2f9a2dcac70a00f86ea6342b092bafac6af547d4
19	ico_trabajo.png	original_images/ico_trabajo.png	81	77	2019-04-11 00:53:19.067-03	\N	\N	\N	\N	3	62043	1	fbe96dfa624d6723b95aa0f1b424e055dbb0888f
20	ico_comunitarias.png	original_images/ico_comunitarias.png	74	86	2019-04-11 00:53:46.79-03	\N	\N	\N	\N	3	51855	1	28bdb6bdfceccfd3ebada8c4bf5a6029560e1ede
21	ico_misioneras.png	original_images/ico_misioneras.png	79	70	2019-04-11 00:54:54.923-03	\N	\N	\N	\N	3	56537	1	814358ab6242ab17fec6695d05a22e91d92a7331
22	quienes.jpg	original_images/quienes.jpg	1444	965	2019-04-11 01:10:43.315-03	\N	\N	\N	\N	3	206583	1	7f08c751722407944387f7da4bf1601028f9d6a1
23	595a26a84b952_647_365-1.jpg	original_images/595a26a84b952_647_365-1.jpg	1024	400	2019-04-11 01:40:13.784-03	\N	\N	\N	\N	3	59001	1	7659e4f07ca4040115eff87bfcede1f22f9e67ff
24	55845484_10217976041933890_3274402394099679232_n.jpg	original_images/55845484_10217976041933890_3274402394099679232_n_2UH0Ohk.jpg	960	503	2019-04-12 16:36:47.671-03	\N	\N	\N	\N	3	88344	1	e909c86938bfd95ffc82a8bde8a5bceab4d891fd
25	Niñas 1er plano	original_images/foto_sin_texto.jpg	1866	960	2019-04-22 03:06:17.63985-03	\N	\N	\N	\N	3	526573	1	fcc6fee5564e33992e8a5e7f8727e5fc5f8ebec6
26	jovenes 1er plano	original_images/WhatsApp_Image_2018-10-02_at_16_34_081.jpeg	1280	851	2019-04-22 03:37:07.420287-03	\N	\N	\N	\N	3	179191	1	70b7a01d3877caf57bb754a8a99ac5a30edbe297
27	WEB.JPG	original_images/WEB.JPG	2954	1093	2019-04-22 03:39:59.557635-03	\N	\N	\N	\N	3	1343871	1	0d21c65e7e67e0f552d271ba992c1939e38b59a8
\.


--
-- Data for Name: wagtailimages_rendition; Type: TABLE DATA; Schema: public; Owner: jovenes
--

COPY public.wagtailimages_rendition (id, file, width, height, focal_point_key, filter_spec, image_id) FROM stdin;
1	images/55845484_10217976041933890_32744023940996792.max-165x165.jpg	165	86		max-165x165	1
2	images/logo8a.max-165x165.jpg	150	150		max-165x165	2
3	images/racing-ok.max-165x165.jpg	165	165		max-165x165	3
4	images/Isologo_Mostaza_2018_0021.max-165x165.png	165	118		max-165x165	4
5	images/racing-ok.width-400.jpg	400	400		width-400	3
6	images/Isologo_Mostaza_2018_0021.width-400.png	400	286		width-400	4
7	images/racing-ok.2e16d0ba.fill-80x80.jpg	80	80	2e16d0ba	fill-80x80	3
8	images/Isologo_Mostaza_2018_0021.2e16d0ba.fill-80x80.png	80	80	2e16d0ba	fill-80x80	4
9	images/Nivea.max-165x165.jpg	165	164		max-165x165	5
10	images/Nivea.2e16d0ba.fill-80x80.jpg	80	80	2e16d0ba	fill-80x80	5
11	images/PIEZA_PARA_WEB4.max-165x165.jpg	165	76		max-165x165	6
12	images/PIEZA_PARA_WEB_desk4.max-165x165.jpg	165	68		max-165x165	7
13	images/PIEZA_PARA_WEB4.2e16d0ba.fill-80x80.jpg	80	80	2e16d0ba	fill-80x80	6
14	images/PIEZA_PARA_WEB4.2e16d0ba.fill-900x400.jpg	900	400	2e16d0ba	fill-900x400	6
15	images/PIEZA_PARA_WEB_desk4_EKmwIk6.max-165x165.jpg	165	68		max-165x165	8
16	images/PIEZA_PARA_WEB_MOBILE_2.max-165x165.jpg	165	165		max-165x165	9
17	images/PIEZA_PARA_WEB_desk4.2e16d0ba.fill-900x400.jpg	900	400	2e16d0ba	fill-900x400	7
18	images/PIEZA_PARA_WEB4.original.jpg	2000	923		original	6
19	images/PIEZA_PARA_WEB_desk4.original.jpg	2000	835		original	7
20	images/PIEZA_PARA_WEB_desk4_EKmwIk6.original.jpg	2000	835		original	8
21	images/PIEZA_PARA_WEB_MOBILE_2.original.jpg	600	600		original	9
22	images/mapa2.max-165x165.jpg	165	76		max-165x165	10
23	images/remera1.max-165x165.jpg	165	79		max-165x165	11
24	images/mapa2.original.jpg	1172	543		original	10
25	images/remera1.original.jpg	963	463		original	11
26	images/iphone-4-415708_1920.max-165x165.jpg	165	110		max-165x165	12
27	images/iphone-4-415708_1920.original.jpg	1920	1280		original	12
28	images/donar.max-165x165.jpg	156	165		max-165x165	13
29	images/donar.original.jpg	446	469		original	13
30	images/Foto_legados_y_herencias_21.max-165x165.jpg	165	48		max-165x165	14
31	images/Foto_legados_y_herencias_21.original.jpg	2000	592		original	14
32	images/Foto_comunicacion_3.max-165x165.jpg	165	110		max-165x165	15
33	images/Foto_comunicacion_3.original.jpg	2657	1772		original	15
34	images/quehacemos.max-165x165.jpg	165	61		max-165x165	16
35	images/banner_2_gif4.max-165x165.png	67	165		max-165x165	17
36	images/ico_educacion.max-165x165.png	112	80		max-165x165	18
37	images/ico_trabajo.max-165x165.png	81	77		max-165x165	19
38	images/ico_comunitarias.max-165x165.png	74	86		max-165x165	20
39	images/ico_misioneras.max-165x165.png	79	70		max-165x165	21
40	images/quehacemos.original.jpg	1900	704		original	16
41	images/ico_educacion.original.png	112	80		original	18
42	images/ico_trabajo.original.png	81	77		original	19
43	images/ico_comunitarias.original.png	74	86		original	20
44	images/ico_misioneras.original.png	79	70		original	21
45	images/quienes.max-165x165.jpg	165	110		max-165x165	22
46	images/quienes.original.jpg	1444	965		original	22
47	images/quienes.max-800x600.jpg	800	534		max-800x600	22
48	images/595a26a84b952_647_365-1.max-165x165.jpg	165	64		max-165x165	23
49	images/595a26a84b952_647_365-1.original.jpg	1024	400		original	23
50	images/595a26a84b952_647_365-1.max-800x600.jpg	800	312		max-800x600	23
51	images/595a26a84b952_647_365-1.width-500.jpg	500	195		width-500	23
52	images/quienes.2e16d0ba.fill-850x450-c50.jpg	850	450	2e16d0ba	fill-850x450-c50	22
53	images/iphone-4-415708_1920.2e16d0ba.fill-850x450-c50.jpg	850	450	2e16d0ba	fill-850x450-c50	12
54	images/quehacemos.2e16d0ba.fill-850x450-c50.jpg	850	450	2e16d0ba	fill-850x450-c50	16
55	images/55845484_10217976041933890_32744023940996792.max-165x165_pZyf9hQ.jpg	165	86		max-165x165	24
56	images/55845484_10217976041933890_3274402394099679232_.original.jpg	960	503		original	24
57	images/55845484_10217976041933890_32744023940996792.max-800x600.jpg	800	419		max-800x600	24
58	images/foto_sin_texto.max-165x165.jpg	165	84		max-165x165	25
59	images/WhatsApp_Image_2018-10-02_at_16_34_081.max-165x165.jpg	165	109		max-165x165	26
60	images/WEB.max-165x165.jpg	165	61		max-165x165	27
61	images/foto_sin_texto.original.jpg	1866	960		original	25
62	images/WhatsApp_Image_2018-10-02_at_16_34_081.original.jpg	1280	851		original	26
63	images/WEB.original.jpg	2954	1093		original	27
64	images/foto_sin_texto.2e16d0ba.fill-1200x640-c100.jpg	1200	640	2e16d0ba	fill-1200x640-c100	25
65	images/WhatsApp_Image_2018-10-02_at.2e16d0ba.fill-1200x640-c100.jpg	1200	640	2e16d0ba	fill-1200x640-c100	26
66	images/WEB.2e16d0ba.fill-1200x640-c100.jpg	1200	640	2e16d0ba	fill-1200x640-c100	27
67	images/foto_sin_texto.2e16d0ba.fill-1920x1280-c100.jpg	1440	960	2e16d0ba	fill-1920x1280-c100	25
68	images/WhatsApp_Image_2018-10-02_a.2e16d0ba.fill-1920x1280-c100.jpg	1278	851	2e16d0ba	fill-1920x1280-c100	26
69	images/WEB.2e16d0ba.fill-1920x1280-c100.jpg	1640	1093	2e16d0ba	fill-1920x1280-c100	27
70	images/foto_sin_texto.2e16d0ba.fill-1920x1280.jpg	1440	960	2e16d0ba	fill-1920x1280	25
71	images/WhatsApp_Image_2018-10-02_at_16_.2e16d0ba.fill-1920x1280.jpg	1278	851	2e16d0ba	fill-1920x1280	26
72	images/WEB.2e16d0ba.fill-1920x1280.jpg	1640	1093	2e16d0ba	fill-1920x1280	27
\.


--
-- Data for Name: wagtailredirects_redirect; Type: TABLE DATA; Schema: public; Owner: jovenes
--

COPY public.wagtailredirects_redirect (id, old_path, is_permanent, redirect_link, redirect_page_id, site_id) FROM stdin;
\.


--
-- Data for Name: wagtailsearch_editorspick; Type: TABLE DATA; Schema: public; Owner: jovenes
--

COPY public.wagtailsearch_editorspick (id, sort_order, description, page_id, query_id) FROM stdin;
\.


--
-- Data for Name: wagtailsearch_query; Type: TABLE DATA; Schema: public; Owner: jovenes
--

COPY public.wagtailsearch_query (id, query_string) FROM stdin;
\.


--
-- Data for Name: wagtailsearch_querydailyhits; Type: TABLE DATA; Schema: public; Owner: jovenes
--

COPY public.wagtailsearch_querydailyhits (id, date, hits, query_id) FROM stdin;
\.


--
-- Data for Name: wagtailusers_userprofile; Type: TABLE DATA; Schema: public; Owner: jovenes
--

COPY public.wagtailusers_userprofile (id, submitted_notifications, approved_notifications, rejected_notifications, user_id, preferred_language, current_time_zone, avatar) FROM stdin;
1	t	t	t	3	es	America/Argentina/Buenos_Aires	
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jovenes
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 2, true);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jovenes
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 28, true);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jovenes
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 209, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jovenes
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jovenes
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 3, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jovenes
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jovenes
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jovenes
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 53, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jovenes
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 170, true);


--
-- Name: home_alianza_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jovenes
--

SELECT pg_catalog.setval('public.home_alianza_id_seq', 6, true);


--
-- Name: home_homegalleryimage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jovenes
--

SELECT pg_catalog.setval('public.home_homegalleryimage_id_seq', 3, true);


--
-- Name: home_memoria_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jovenes
--

SELECT pg_catalog.setval('public.home_memoria_id_seq', 2, true);


--
-- Name: home_noticiagalleryimage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jovenes
--

SELECT pg_catalog.setval('public.home_noticiagalleryimage_id_seq', 8, true);


--
-- Name: home_sponsorclass_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jovenes
--

SELECT pg_catalog.setval('public.home_sponsorclass_id_seq', 5, true);


--
-- Name: home_video_old_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jovenes
--

SELECT pg_catalog.setval('public.home_video_old_id_seq', 3, true);


--
-- Name: postgres_search_indexentry_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jovenes
--

SELECT pg_catalog.setval('public.postgres_search_indexentry_id_seq', 65, true);


--
-- Name: taggit_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jovenes
--

SELECT pg_catalog.setval('public.taggit_tag_id_seq', 22, true);


--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jovenes
--

SELECT pg_catalog.setval('public.taggit_taggeditem_id_seq', 23, true);


--
-- Name: wagtailcore_collection_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jovenes
--

SELECT pg_catalog.setval('public.wagtailcore_collection_id_seq', 1, true);


--
-- Name: wagtailcore_collectionviewrestriction_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jovenes
--

SELECT pg_catalog.setval('public.wagtailcore_collectionviewrestriction_groups_id_seq', 1, false);


--
-- Name: wagtailcore_collectionviewrestriction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jovenes
--

SELECT pg_catalog.setval('public.wagtailcore_collectionviewrestriction_id_seq', 1, false);


--
-- Name: wagtailcore_groupcollectionpermission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jovenes
--

SELECT pg_catalog.setval('public.wagtailcore_groupcollectionpermission_id_seq', 8, true);


--
-- Name: wagtailcore_grouppagepermission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jovenes
--

SELECT pg_catalog.setval('public.wagtailcore_grouppagepermission_id_seq', 6, true);


--
-- Name: wagtailcore_page_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jovenes
--

SELECT pg_catalog.setval('public.wagtailcore_page_id_seq', 33, true);


--
-- Name: wagtailcore_pagerevision_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jovenes
--

SELECT pg_catalog.setval('public.wagtailcore_pagerevision_id_seq', 89, true);


--
-- Name: wagtailcore_pageviewrestriction_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jovenes
--

SELECT pg_catalog.setval('public.wagtailcore_pageviewrestriction_groups_id_seq', 1, false);


--
-- Name: wagtailcore_pageviewrestriction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jovenes
--

SELECT pg_catalog.setval('public.wagtailcore_pageviewrestriction_id_seq', 1, false);


--
-- Name: wagtailcore_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jovenes
--

SELECT pg_catalog.setval('public.wagtailcore_site_id_seq', 2, true);


--
-- Name: wagtaildocs_document_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jovenes
--

SELECT pg_catalog.setval('public.wagtaildocs_document_id_seq', 2, true);


--
-- Name: wagtailembeds_embed_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jovenes
--

SELECT pg_catalog.setval('public.wagtailembeds_embed_id_seq', 1, false);


--
-- Name: wagtailforms_formsubmission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jovenes
--

SELECT pg_catalog.setval('public.wagtailforms_formsubmission_id_seq', 1, false);


--
-- Name: wagtailimages_image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jovenes
--

SELECT pg_catalog.setval('public.wagtailimages_image_id_seq', 27, true);


--
-- Name: wagtailimages_rendition_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jovenes
--

SELECT pg_catalog.setval('public.wagtailimages_rendition_id_seq', 72, true);


--
-- Name: wagtailredirects_redirect_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jovenes
--

SELECT pg_catalog.setval('public.wagtailredirects_redirect_id_seq', 1, false);


--
-- Name: wagtailsearch_editorspick_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jovenes
--

SELECT pg_catalog.setval('public.wagtailsearch_editorspick_id_seq', 1, false);


--
-- Name: wagtailsearch_query_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jovenes
--

SELECT pg_catalog.setval('public.wagtailsearch_query_id_seq', 1, false);


--
-- Name: wagtailsearch_querydailyhits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jovenes
--

SELECT pg_catalog.setval('public.wagtailsearch_querydailyhits_id_seq', 1, false);


--
-- Name: wagtailusers_userprofile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jovenes
--

SELECT pg_catalog.setval('public.wagtailusers_userprofile_id_seq', 1, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: home_alianza home_alianza_pkey; Type: CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.home_alianza
    ADD CONSTRAINT home_alianza_pkey PRIMARY KEY (id);


--
-- Name: home_alianzas home_alianzas_pkey; Type: CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.home_alianzas
    ADD CONSTRAINT home_alianzas_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: home_app home_app_pkey; Type: CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.home_app
    ADD CONSTRAINT home_app_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: home_ayudadifundiendo home_ayudadifundiendo_pkey; Type: CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.home_ayudadifundiendo
    ADD CONSTRAINT home_ayudadifundiendo_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: home_carrera home_carrera_pkey; Type: CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.home_carrera
    ADD CONSTRAINT home_carrera_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: home_carreras home_carreras_pkey; Type: CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.home_carreras
    ADD CONSTRAINT home_carreras_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: home_comocolaborar home_comocolaborar_pkey; Type: CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.home_comocolaborar
    ADD CONSTRAINT home_comocolaborar_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: home_dondeestamos home_dondeestamos_pkey; Type: CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.home_dondeestamos
    ADD CONSTRAINT home_dondeestamos_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: home_homegalleryimage home_homegalleryimage_pkey; Type: CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.home_homegalleryimage
    ADD CONSTRAINT home_homegalleryimage_pkey PRIMARY KEY (id);


--
-- Name: home_homepage home_homepage_pkey; Type: CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.home_homepage
    ADD CONSTRAINT home_homepage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: home_legado home_legado_pkey; Type: CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.home_legado
    ADD CONSTRAINT home_legado_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: home_memoria home_memoria_pkey; Type: CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.home_memoria
    ADD CONSTRAINT home_memoria_pkey PRIMARY KEY (id);


--
-- Name: home_nosotros home_nosotros_pkey; Type: CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.home_nosotros
    ADD CONSTRAINT home_nosotros_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: home_noticia home_noticia_pkey; Type: CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.home_noticia
    ADD CONSTRAINT home_noticia_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: home_noticiagalleryimage home_noticiagalleryimage_pkey; Type: CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.home_noticiagalleryimage
    ADD CONSTRAINT home_noticiagalleryimage_pkey PRIMARY KEY (id);


--
-- Name: home_noticias home_noticias_pkey; Type: CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.home_noticias
    ADD CONSTRAINT home_noticias_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: home_quehacemos home_quehacemos_pkey; Type: CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.home_quehacemos
    ADD CONSTRAINT home_quehacemos_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: home_quienessomos home_quienessomos_pkey; Type: CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.home_quienessomos
    ADD CONSTRAINT home_quienessomos_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: home_quierodonar home_quierodonar_pkey; Type: CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.home_quierodonar
    ADD CONSTRAINT home_quierodonar_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: home_sponsorapp home_sponsorapp_pkey; Type: CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.home_sponsorapp
    ADD CONSTRAINT home_sponsorapp_pkey PRIMARY KEY (sponsorclass_ptr_id);


--
-- Name: home_sponsorcarrera home_sponsorcarrera_pkey; Type: CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.home_sponsorcarrera
    ADD CONSTRAINT home_sponsorcarrera_pkey PRIMARY KEY (sponsorclass_ptr_id);


--
-- Name: home_sponsorclass home_sponsorclass_pkey; Type: CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.home_sponsorclass
    ADD CONSTRAINT home_sponsorclass_pkey PRIMARY KEY (id);


--
-- Name: home_transparencia home_transparencia_pkey; Type: CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.home_transparencia
    ADD CONSTRAINT home_transparencia_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: home_video_old home_video_old_pkey; Type: CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.home_video_old
    ADD CONSTRAINT home_video_old_pkey PRIMARY KEY (id);


--
-- Name: postgres_search_indexentry postgres_search_indexent_content_type_id_object_i_bae8f946_uniq; Type: CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.postgres_search_indexentry
    ADD CONSTRAINT postgres_search_indexent_content_type_id_object_i_bae8f946_uniq UNIQUE (content_type_id, object_id);


--
-- Name: postgres_search_indexentry postgres_search_indexentry_pkey; Type: CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.postgres_search_indexentry
    ADD CONSTRAINT postgres_search_indexentry_pkey PRIMARY KEY (id);


--
-- Name: taggit_tag taggit_tag_name_key; Type: CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.taggit_tag
    ADD CONSTRAINT taggit_tag_name_key UNIQUE (name);


--
-- Name: taggit_tag taggit_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.taggit_tag
    ADD CONSTRAINT taggit_tag_pkey PRIMARY KEY (id);


--
-- Name: taggit_tag taggit_tag_slug_key; Type: CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.taggit_tag
    ADD CONSTRAINT taggit_tag_slug_key UNIQUE (slug);


--
-- Name: taggit_taggeditem taggit_taggeditem_pkey; Type: CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_collection wagtailcore_collection_path_key; Type: CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.wagtailcore_collection
    ADD CONSTRAINT wagtailcore_collection_path_key UNIQUE (path);


--
-- Name: wagtailcore_collection wagtailcore_collection_pkey; Type: CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.wagtailcore_collection
    ADD CONSTRAINT wagtailcore_collection_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_collectionviewrestriction_groups wagtailcore_collectionvi_collectionviewrestrictio_988995ae_uniq; Type: CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.wagtailcore_collectionviewrestriction_groups
    ADD CONSTRAINT wagtailcore_collectionvi_collectionviewrestrictio_988995ae_uniq UNIQUE (collectionviewrestriction_id, group_id);


--
-- Name: wagtailcore_collectionviewrestriction_groups wagtailcore_collectionviewrestriction_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.wagtailcore_collectionviewrestriction_groups
    ADD CONSTRAINT wagtailcore_collectionviewrestriction_groups_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_collectionviewrestriction wagtailcore_collectionviewrestriction_pkey; Type: CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.wagtailcore_collectionviewrestriction
    ADD CONSTRAINT wagtailcore_collectionviewrestriction_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_groupcollectionpermission wagtailcore_groupcollect_group_id_collection_id_p_a21cefe9_uniq; Type: CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.wagtailcore_groupcollectionpermission
    ADD CONSTRAINT wagtailcore_groupcollect_group_id_collection_id_p_a21cefe9_uniq UNIQUE (group_id, collection_id, permission_id);


--
-- Name: wagtailcore_groupcollectionpermission wagtailcore_groupcollectionpermission_pkey; Type: CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.wagtailcore_groupcollectionpermission
    ADD CONSTRAINT wagtailcore_groupcollectionpermission_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_grouppagepermission wagtailcore_grouppageper_group_id_page_id_permiss_0898bdf8_uniq; Type: CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.wagtailcore_grouppagepermission
    ADD CONSTRAINT wagtailcore_grouppageper_group_id_page_id_permiss_0898bdf8_uniq UNIQUE (group_id, page_id, permission_type);


--
-- Name: wagtailcore_grouppagepermission wagtailcore_grouppagepermission_pkey; Type: CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.wagtailcore_grouppagepermission
    ADD CONSTRAINT wagtailcore_grouppagepermission_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_page wagtailcore_page_path_key; Type: CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.wagtailcore_page
    ADD CONSTRAINT wagtailcore_page_path_key UNIQUE (path);


--
-- Name: wagtailcore_page wagtailcore_page_pkey; Type: CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.wagtailcore_page
    ADD CONSTRAINT wagtailcore_page_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_pagerevision wagtailcore_pagerevision_pkey; Type: CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.wagtailcore_pagerevision
    ADD CONSTRAINT wagtailcore_pagerevision_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_pageviewrestriction_groups wagtailcore_pageviewrest_pageviewrestriction_id_g_d23f80bb_uniq; Type: CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.wagtailcore_pageviewrestriction_groups
    ADD CONSTRAINT wagtailcore_pageviewrest_pageviewrestriction_id_g_d23f80bb_uniq UNIQUE (pageviewrestriction_id, group_id);


--
-- Name: wagtailcore_pageviewrestriction_groups wagtailcore_pageviewrestriction_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.wagtailcore_pageviewrestriction_groups
    ADD CONSTRAINT wagtailcore_pageviewrestriction_groups_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_pageviewrestriction wagtailcore_pageviewrestriction_pkey; Type: CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.wagtailcore_pageviewrestriction
    ADD CONSTRAINT wagtailcore_pageviewrestriction_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_site wagtailcore_site_hostname_port_2c626d70_uniq; Type: CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.wagtailcore_site
    ADD CONSTRAINT wagtailcore_site_hostname_port_2c626d70_uniq UNIQUE (hostname, port);


--
-- Name: wagtailcore_site wagtailcore_site_pkey; Type: CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.wagtailcore_site
    ADD CONSTRAINT wagtailcore_site_pkey PRIMARY KEY (id);


--
-- Name: wagtaildocs_document wagtaildocs_document_pkey; Type: CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.wagtaildocs_document
    ADD CONSTRAINT wagtaildocs_document_pkey PRIMARY KEY (id);


--
-- Name: wagtailembeds_embed wagtailembeds_embed_pkey; Type: CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.wagtailembeds_embed
    ADD CONSTRAINT wagtailembeds_embed_pkey PRIMARY KEY (id);


--
-- Name: wagtailembeds_embed wagtailembeds_embed_url_max_width_8a2922d8_uniq; Type: CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.wagtailembeds_embed
    ADD CONSTRAINT wagtailembeds_embed_url_max_width_8a2922d8_uniq UNIQUE (url, max_width);


--
-- Name: wagtailforms_formsubmission wagtailforms_formsubmission_pkey; Type: CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.wagtailforms_formsubmission
    ADD CONSTRAINT wagtailforms_formsubmission_pkey PRIMARY KEY (id);


--
-- Name: wagtailimages_image wagtailimages_image_pkey; Type: CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.wagtailimages_image
    ADD CONSTRAINT wagtailimages_image_pkey PRIMARY KEY (id);


--
-- Name: wagtailimages_rendition wagtailimages_rendition_image_id_filter_spec_foc_323c8fe0_uniq; Type: CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.wagtailimages_rendition
    ADD CONSTRAINT wagtailimages_rendition_image_id_filter_spec_foc_323c8fe0_uniq UNIQUE (image_id, filter_spec, focal_point_key);


--
-- Name: wagtailimages_rendition wagtailimages_rendition_pkey; Type: CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.wagtailimages_rendition
    ADD CONSTRAINT wagtailimages_rendition_pkey PRIMARY KEY (id);


--
-- Name: wagtailredirects_redirect wagtailredirects_redirect_old_path_site_id_783622d7_uniq; Type: CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.wagtailredirects_redirect
    ADD CONSTRAINT wagtailredirects_redirect_old_path_site_id_783622d7_uniq UNIQUE (old_path, site_id);


--
-- Name: wagtailredirects_redirect wagtailredirects_redirect_pkey; Type: CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.wagtailredirects_redirect
    ADD CONSTRAINT wagtailredirects_redirect_pkey PRIMARY KEY (id);


--
-- Name: wagtailsearch_editorspick wagtailsearch_editorspick_pkey; Type: CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.wagtailsearch_editorspick
    ADD CONSTRAINT wagtailsearch_editorspick_pkey PRIMARY KEY (id);


--
-- Name: wagtailsearch_query wagtailsearch_query_pkey; Type: CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.wagtailsearch_query
    ADD CONSTRAINT wagtailsearch_query_pkey PRIMARY KEY (id);


--
-- Name: wagtailsearch_query wagtailsearch_query_query_string_key; Type: CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.wagtailsearch_query
    ADD CONSTRAINT wagtailsearch_query_query_string_key UNIQUE (query_string);


--
-- Name: wagtailsearch_querydailyhits wagtailsearch_querydailyhits_pkey; Type: CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.wagtailsearch_querydailyhits
    ADD CONSTRAINT wagtailsearch_querydailyhits_pkey PRIMARY KEY (id);


--
-- Name: wagtailsearch_querydailyhits wagtailsearch_querydailyhits_query_id_date_1dd232e6_uniq; Type: CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.wagtailsearch_querydailyhits
    ADD CONSTRAINT wagtailsearch_querydailyhits_query_id_date_1dd232e6_uniq UNIQUE (query_id, date);


--
-- Name: wagtailusers_userprofile wagtailusers_userprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.wagtailusers_userprofile
    ADD CONSTRAINT wagtailusers_userprofile_pkey PRIMARY KEY (id);


--
-- Name: wagtailusers_userprofile wagtailusers_userprofile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.wagtailusers_userprofile
    ADD CONSTRAINT wagtailusers_userprofile_user_id_key UNIQUE (user_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: jovenes
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: jovenes
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: jovenes
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: jovenes
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: jovenes
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: jovenes
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: jovenes
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: jovenes
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: jovenes
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: jovenes
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: jovenes
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: jovenes
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: jovenes
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: home_alianza_page_id_bbb7e91f; Type: INDEX; Schema: public; Owner: jovenes
--

CREATE INDEX home_alianza_page_id_bbb7e91f ON public.home_alianza USING btree (page_id);


--
-- Name: home_alianzas_imagen_principal_id_1c6553e7; Type: INDEX; Schema: public; Owner: jovenes
--

CREATE INDEX home_alianzas_imagen_principal_id_1c6553e7 ON public.home_alianzas USING btree (imagen_principal_id);


--
-- Name: home_ayudadifundiendo_imagen_principal_id_a155101a; Type: INDEX; Schema: public; Owner: jovenes
--

CREATE INDEX home_ayudadifundiendo_imagen_principal_id_a155101a ON public.home_ayudadifundiendo USING btree (imagen_principal_id);


--
-- Name: home_carrera_imagen_inferior_horizontal_id_de9eb059; Type: INDEX; Schema: public; Owner: jovenes
--

CREATE INDEX home_carrera_imagen_inferior_horizontal_id_de9eb059 ON public.home_carrera USING btree (imagen_inferior_kit_id);


--
-- Name: home_carrera_imagen_inferior_vertical_id_b9bde875; Type: INDEX; Schema: public; Owner: jovenes
--

CREATE INDEX home_carrera_imagen_inferior_vertical_id_b9bde875 ON public.home_carrera USING btree (imagen_inferior_mapa_id);


--
-- Name: home_carrera_imagen_superior_horizontal_id_cfc10554; Type: INDEX; Schema: public; Owner: jovenes
--

CREATE INDEX home_carrera_imagen_superior_horizontal_id_cfc10554 ON public.home_carrera USING btree (imagen_superior_horizontal_id);


--
-- Name: home_carrera_imagen_superior_vertical_id_3aeab0b3; Type: INDEX; Schema: public; Owner: jovenes
--

CREATE INDEX home_carrera_imagen_superior_vertical_id_3aeab0b3 ON public.home_carrera USING btree (imagen_superior_vertical_id);


--
-- Name: home_carrera_politica_menores_id_bd07a7b3; Type: INDEX; Schema: public; Owner: jovenes
--

CREATE INDEX home_carrera_politica_menores_id_bd07a7b3 ON public.home_carrera USING btree (politica_menores_id);


--
-- Name: home_carrera_reglamento_id_830ab862; Type: INDEX; Schema: public; Owner: jovenes
--

CREATE INDEX home_carrera_reglamento_id_830ab862 ON public.home_carrera USING btree (reglamento_id);


--
-- Name: home_dondeestamos_imagen_principal_id_32c031fa; Type: INDEX; Schema: public; Owner: jovenes
--

CREATE INDEX home_dondeestamos_imagen_principal_id_32c031fa ON public.home_dondeestamos USING btree (imagen_principal_id);


--
-- Name: home_homegalleryimage_image_id_07a42b99; Type: INDEX; Schema: public; Owner: jovenes
--

CREATE INDEX home_homegalleryimage_image_id_07a42b99 ON public.home_homegalleryimage USING btree (image_id);


--
-- Name: home_homegalleryimage_page_id_103957bf; Type: INDEX; Schema: public; Owner: jovenes
--

CREATE INDEX home_homegalleryimage_page_id_103957bf ON public.home_homegalleryimage USING btree (page_id);


--
-- Name: home_legado_imagen_principal_id_2c2bf57b; Type: INDEX; Schema: public; Owner: jovenes
--

CREATE INDEX home_legado_imagen_principal_id_2c2bf57b ON public.home_legado USING btree (imagen_principal_id);


--
-- Name: home_memoria_page_id_9fb53ac6; Type: INDEX; Schema: public; Owner: jovenes
--

CREATE INDEX home_memoria_page_id_9fb53ac6 ON public.home_memoria USING btree (page_id);


--
-- Name: home_noticia_imagen_portada_id_b3217274; Type: INDEX; Schema: public; Owner: jovenes
--

CREATE INDEX home_noticia_imagen_portada_id_b3217274 ON public.home_noticia USING btree (imagen_portada_id);


--
-- Name: home_noticiagalleryimage_image_id_18edd62c; Type: INDEX; Schema: public; Owner: jovenes
--

CREATE INDEX home_noticiagalleryimage_image_id_18edd62c ON public.home_noticiagalleryimage USING btree (image_id);


--
-- Name: home_noticiagalleryimage_page_id_33fbc71c; Type: INDEX; Schema: public; Owner: jovenes
--

CREATE INDEX home_noticiagalleryimage_page_id_33fbc71c ON public.home_noticiagalleryimage USING btree (page_id);


--
-- Name: home_quehacemos_acciones_imagen_id_b1533772; Type: INDEX; Schema: public; Owner: jovenes
--

CREATE INDEX home_quehacemos_acciones_imagen_id_b1533772 ON public.home_quehacemos USING btree (acciones_imagen_id);


--
-- Name: home_quehacemos_banner_imagen_id_def36e82; Type: INDEX; Schema: public; Owner: jovenes
--

CREATE INDEX home_quehacemos_banner_imagen_id_def36e82 ON public.home_quehacemos USING btree (banner_imagen_id);


--
-- Name: home_quehacemos_comunitaria_imagen_id_22361d4f; Type: INDEX; Schema: public; Owner: jovenes
--

CREATE INDEX home_quehacemos_comunitaria_imagen_id_22361d4f ON public.home_quehacemos USING btree (comunitaria_imagen_id);


--
-- Name: home_quehacemos_educacion_imagen_id_18c76e85; Type: INDEX; Schema: public; Owner: jovenes
--

CREATE INDEX home_quehacemos_educacion_imagen_id_18c76e85 ON public.home_quehacemos USING btree (educacion_imagen_id);


--
-- Name: home_quehacemos_imagen_principal_id_8fa06213; Type: INDEX; Schema: public; Owner: jovenes
--

CREATE INDEX home_quehacemos_imagen_principal_id_8fa06213 ON public.home_quehacemos USING btree (imagen_principal_id);


--
-- Name: home_quehacemos_trabajo_imagen_id_875ea9b1; Type: INDEX; Schema: public; Owner: jovenes
--

CREATE INDEX home_quehacemos_trabajo_imagen_id_875ea9b1 ON public.home_quehacemos USING btree (trabajo_imagen_id);


--
-- Name: home_quienessomos_imagen_principal_id_ed26fd4c; Type: INDEX; Schema: public; Owner: jovenes
--

CREATE INDEX home_quienessomos_imagen_principal_id_ed26fd4c ON public.home_quienessomos USING btree (imagen_principal_id);


--
-- Name: home_quierodonar_imagen_principal_id_7ae2054f; Type: INDEX; Schema: public; Owner: jovenes
--

CREATE INDEX home_quierodonar_imagen_principal_id_7ae2054f ON public.home_quierodonar USING btree (imagen_principal_id);


--
-- Name: home_sponsorapp_page_id_b7b1bf5b; Type: INDEX; Schema: public; Owner: jovenes
--

CREATE INDEX home_sponsorapp_page_id_b7b1bf5b ON public.home_sponsorapp USING btree (page_id);


--
-- Name: home_sponsorcarrera_page_id_8c974cc5; Type: INDEX; Schema: public; Owner: jovenes
--

CREATE INDEX home_sponsorcarrera_page_id_8c974cc5 ON public.home_sponsorcarrera USING btree (page_id);


--
-- Name: home_sponsorclass_imagen_sponsor_id_aff8e154; Type: INDEX; Schema: public; Owner: jovenes
--

CREATE INDEX home_sponsorclass_imagen_sponsor_id_aff8e154 ON public.home_sponsorclass USING btree (imagen_sponsor_id);


--
-- Name: home_transparencia_imagen_principal_id_319aa76d; Type: INDEX; Schema: public; Owner: jovenes
--

CREATE INDEX home_transparencia_imagen_principal_id_319aa76d ON public.home_transparencia USING btree (imagen_principal_id);


--
-- Name: home_video_old_page_id_ed01062b; Type: INDEX; Schema: public; Owner: jovenes
--

CREATE INDEX home_video_old_page_id_ed01062b ON public.home_video_old USING btree (page_id);


--
-- Name: postgres_se_autocom_ee48c8_gin; Type: INDEX; Schema: public; Owner: jovenes
--

CREATE INDEX postgres_se_autocom_ee48c8_gin ON public.postgres_search_indexentry USING gin (autocomplete);


--
-- Name: postgres_se_body_aaaa99_gin; Type: INDEX; Schema: public; Owner: jovenes
--

CREATE INDEX postgres_se_body_aaaa99_gin ON public.postgres_search_indexentry USING gin (body);


--
-- Name: postgres_search_indexentry_content_type_id_d805086f; Type: INDEX; Schema: public; Owner: jovenes
--

CREATE INDEX postgres_search_indexentry_content_type_id_d805086f ON public.postgres_search_indexentry USING btree (content_type_id);


--
-- Name: taggit_tag_name_58eb2ed9_like; Type: INDEX; Schema: public; Owner: jovenes
--

CREATE INDEX taggit_tag_name_58eb2ed9_like ON public.taggit_tag USING btree (name varchar_pattern_ops);


--
-- Name: taggit_tag_slug_6be58b2c_like; Type: INDEX; Schema: public; Owner: jovenes
--

CREATE INDEX taggit_tag_slug_6be58b2c_like ON public.taggit_tag USING btree (slug varchar_pattern_ops);


--
-- Name: taggit_taggeditem_content_type_id_9957a03c; Type: INDEX; Schema: public; Owner: jovenes
--

CREATE INDEX taggit_taggeditem_content_type_id_9957a03c ON public.taggit_taggeditem USING btree (content_type_id);


--
-- Name: taggit_taggeditem_content_type_id_object_id_196cc965_idx; Type: INDEX; Schema: public; Owner: jovenes
--

CREATE INDEX taggit_taggeditem_content_type_id_object_id_196cc965_idx ON public.taggit_taggeditem USING btree (content_type_id, object_id);


--
-- Name: taggit_taggeditem_object_id_e2d7d1df; Type: INDEX; Schema: public; Owner: jovenes
--

CREATE INDEX taggit_taggeditem_object_id_e2d7d1df ON public.taggit_taggeditem USING btree (object_id);


--
-- Name: taggit_taggeditem_tag_id_f4f5b767; Type: INDEX; Schema: public; Owner: jovenes
--

CREATE INDEX taggit_taggeditem_tag_id_f4f5b767 ON public.taggit_taggeditem USING btree (tag_id);


--
-- Name: wagtailcore_collection_path_d848dc19_like; Type: INDEX; Schema: public; Owner: jovenes
--

CREATE INDEX wagtailcore_collection_path_d848dc19_like ON public.wagtailcore_collection USING btree (path varchar_pattern_ops);


--
-- Name: wagtailcore_collectionview_collectionviewrestriction__47320efd; Type: INDEX; Schema: public; Owner: jovenes
--

CREATE INDEX wagtailcore_collectionview_collectionviewrestriction__47320efd ON public.wagtailcore_collectionviewrestriction_groups USING btree (collectionviewrestriction_id);


--
-- Name: wagtailcore_collectionviewrestriction_collection_id_761908ec; Type: INDEX; Schema: public; Owner: jovenes
--

CREATE INDEX wagtailcore_collectionviewrestriction_collection_id_761908ec ON public.wagtailcore_collectionviewrestriction USING btree (collection_id);


--
-- Name: wagtailcore_collectionviewrestriction_groups_group_id_1823f2a3; Type: INDEX; Schema: public; Owner: jovenes
--

CREATE INDEX wagtailcore_collectionviewrestriction_groups_group_id_1823f2a3 ON public.wagtailcore_collectionviewrestriction_groups USING btree (group_id);


--
-- Name: wagtailcore_groupcollectionpermission_collection_id_5423575a; Type: INDEX; Schema: public; Owner: jovenes
--

CREATE INDEX wagtailcore_groupcollectionpermission_collection_id_5423575a ON public.wagtailcore_groupcollectionpermission USING btree (collection_id);


--
-- Name: wagtailcore_groupcollectionpermission_group_id_05d61460; Type: INDEX; Schema: public; Owner: jovenes
--

CREATE INDEX wagtailcore_groupcollectionpermission_group_id_05d61460 ON public.wagtailcore_groupcollectionpermission USING btree (group_id);


--
-- Name: wagtailcore_groupcollectionpermission_permission_id_1b626275; Type: INDEX; Schema: public; Owner: jovenes
--

CREATE INDEX wagtailcore_groupcollectionpermission_permission_id_1b626275 ON public.wagtailcore_groupcollectionpermission USING btree (permission_id);


--
-- Name: wagtailcore_grouppagepermission_group_id_fc07e671; Type: INDEX; Schema: public; Owner: jovenes
--

CREATE INDEX wagtailcore_grouppagepermission_group_id_fc07e671 ON public.wagtailcore_grouppagepermission USING btree (group_id);


--
-- Name: wagtailcore_grouppagepermission_page_id_710b114a; Type: INDEX; Schema: public; Owner: jovenes
--

CREATE INDEX wagtailcore_grouppagepermission_page_id_710b114a ON public.wagtailcore_grouppagepermission USING btree (page_id);


--
-- Name: wagtailcore_page_content_type_id_c28424df; Type: INDEX; Schema: public; Owner: jovenes
--

CREATE INDEX wagtailcore_page_content_type_id_c28424df ON public.wagtailcore_page USING btree (content_type_id);


--
-- Name: wagtailcore_page_first_published_at_2b5dd637; Type: INDEX; Schema: public; Owner: jovenes
--

CREATE INDEX wagtailcore_page_first_published_at_2b5dd637 ON public.wagtailcore_page USING btree (first_published_at);


--
-- Name: wagtailcore_page_live_revision_id_930bd822; Type: INDEX; Schema: public; Owner: jovenes
--

CREATE INDEX wagtailcore_page_live_revision_id_930bd822 ON public.wagtailcore_page USING btree (live_revision_id);


--
-- Name: wagtailcore_page_owner_id_fbf7c332; Type: INDEX; Schema: public; Owner: jovenes
--

CREATE INDEX wagtailcore_page_owner_id_fbf7c332 ON public.wagtailcore_page USING btree (owner_id);


--
-- Name: wagtailcore_page_path_98eba2c8_like; Type: INDEX; Schema: public; Owner: jovenes
--

CREATE INDEX wagtailcore_page_path_98eba2c8_like ON public.wagtailcore_page USING btree (path varchar_pattern_ops);


--
-- Name: wagtailcore_page_slug_e7c11b8f; Type: INDEX; Schema: public; Owner: jovenes
--

CREATE INDEX wagtailcore_page_slug_e7c11b8f ON public.wagtailcore_page USING btree (slug);


--
-- Name: wagtailcore_page_slug_e7c11b8f_like; Type: INDEX; Schema: public; Owner: jovenes
--

CREATE INDEX wagtailcore_page_slug_e7c11b8f_like ON public.wagtailcore_page USING btree (slug varchar_pattern_ops);


--
-- Name: wagtailcore_pagerevision_created_at_66954e3b; Type: INDEX; Schema: public; Owner: jovenes
--

CREATE INDEX wagtailcore_pagerevision_created_at_66954e3b ON public.wagtailcore_pagerevision USING btree (created_at);


--
-- Name: wagtailcore_pagerevision_page_id_d421cc1d; Type: INDEX; Schema: public; Owner: jovenes
--

CREATE INDEX wagtailcore_pagerevision_page_id_d421cc1d ON public.wagtailcore_pagerevision USING btree (page_id);


--
-- Name: wagtailcore_pagerevision_submitted_for_moderation_c682e44c; Type: INDEX; Schema: public; Owner: jovenes
--

CREATE INDEX wagtailcore_pagerevision_submitted_for_moderation_c682e44c ON public.wagtailcore_pagerevision USING btree (submitted_for_moderation);


--
-- Name: wagtailcore_pagerevision_user_id_2409d2f4; Type: INDEX; Schema: public; Owner: jovenes
--

CREATE INDEX wagtailcore_pagerevision_user_id_2409d2f4 ON public.wagtailcore_pagerevision USING btree (user_id);


--
-- Name: wagtailcore_pageviewrestri_pageviewrestriction_id_f147a99a; Type: INDEX; Schema: public; Owner: jovenes
--

CREATE INDEX wagtailcore_pageviewrestri_pageviewrestriction_id_f147a99a ON public.wagtailcore_pageviewrestriction_groups USING btree (pageviewrestriction_id);


--
-- Name: wagtailcore_pageviewrestriction_groups_group_id_6460f223; Type: INDEX; Schema: public; Owner: jovenes
--

CREATE INDEX wagtailcore_pageviewrestriction_groups_group_id_6460f223 ON public.wagtailcore_pageviewrestriction_groups USING btree (group_id);


--
-- Name: wagtailcore_pageviewrestriction_page_id_15a8bea6; Type: INDEX; Schema: public; Owner: jovenes
--

CREATE INDEX wagtailcore_pageviewrestriction_page_id_15a8bea6 ON public.wagtailcore_pageviewrestriction USING btree (page_id);


--
-- Name: wagtailcore_site_hostname_96b20b46; Type: INDEX; Schema: public; Owner: jovenes
--

CREATE INDEX wagtailcore_site_hostname_96b20b46 ON public.wagtailcore_site USING btree (hostname);


--
-- Name: wagtailcore_site_hostname_96b20b46_like; Type: INDEX; Schema: public; Owner: jovenes
--

CREATE INDEX wagtailcore_site_hostname_96b20b46_like ON public.wagtailcore_site USING btree (hostname varchar_pattern_ops);


--
-- Name: wagtailcore_site_root_page_id_e02fb95c; Type: INDEX; Schema: public; Owner: jovenes
--

CREATE INDEX wagtailcore_site_root_page_id_e02fb95c ON public.wagtailcore_site USING btree (root_page_id);


--
-- Name: wagtaildocs_document_collection_id_23881625; Type: INDEX; Schema: public; Owner: jovenes
--

CREATE INDEX wagtaildocs_document_collection_id_23881625 ON public.wagtaildocs_document USING btree (collection_id);


--
-- Name: wagtaildocs_document_uploaded_by_user_id_17258b41; Type: INDEX; Schema: public; Owner: jovenes
--

CREATE INDEX wagtaildocs_document_uploaded_by_user_id_17258b41 ON public.wagtaildocs_document USING btree (uploaded_by_user_id);


--
-- Name: wagtailforms_formsubmission_page_id_e48e93e7; Type: INDEX; Schema: public; Owner: jovenes
--

CREATE INDEX wagtailforms_formsubmission_page_id_e48e93e7 ON public.wagtailforms_formsubmission USING btree (page_id);


--
-- Name: wagtailimages_image_collection_id_c2f8af7e; Type: INDEX; Schema: public; Owner: jovenes
--

CREATE INDEX wagtailimages_image_collection_id_c2f8af7e ON public.wagtailimages_image USING btree (collection_id);


--
-- Name: wagtailimages_image_created_at_86fa6cd4; Type: INDEX; Schema: public; Owner: jovenes
--

CREATE INDEX wagtailimages_image_created_at_86fa6cd4 ON public.wagtailimages_image USING btree (created_at);


--
-- Name: wagtailimages_image_uploaded_by_user_id_5d73dc75; Type: INDEX; Schema: public; Owner: jovenes
--

CREATE INDEX wagtailimages_image_uploaded_by_user_id_5d73dc75 ON public.wagtailimages_image USING btree (uploaded_by_user_id);


--
-- Name: wagtailimages_rendition_filter_spec_1cba3201; Type: INDEX; Schema: public; Owner: jovenes
--

CREATE INDEX wagtailimages_rendition_filter_spec_1cba3201 ON public.wagtailimages_rendition USING btree (filter_spec);


--
-- Name: wagtailimages_rendition_filter_spec_1cba3201_like; Type: INDEX; Schema: public; Owner: jovenes
--

CREATE INDEX wagtailimages_rendition_filter_spec_1cba3201_like ON public.wagtailimages_rendition USING btree (filter_spec varchar_pattern_ops);


--
-- Name: wagtailimages_rendition_image_id_3e1fd774; Type: INDEX; Schema: public; Owner: jovenes
--

CREATE INDEX wagtailimages_rendition_image_id_3e1fd774 ON public.wagtailimages_rendition USING btree (image_id);


--
-- Name: wagtailredirects_redirect_old_path_bb35247b; Type: INDEX; Schema: public; Owner: jovenes
--

CREATE INDEX wagtailredirects_redirect_old_path_bb35247b ON public.wagtailredirects_redirect USING btree (old_path);


--
-- Name: wagtailredirects_redirect_old_path_bb35247b_like; Type: INDEX; Schema: public; Owner: jovenes
--

CREATE INDEX wagtailredirects_redirect_old_path_bb35247b_like ON public.wagtailredirects_redirect USING btree (old_path varchar_pattern_ops);


--
-- Name: wagtailredirects_redirect_redirect_page_id_b5728a8f; Type: INDEX; Schema: public; Owner: jovenes
--

CREATE INDEX wagtailredirects_redirect_redirect_page_id_b5728a8f ON public.wagtailredirects_redirect USING btree (redirect_page_id);


--
-- Name: wagtailredirects_redirect_site_id_780a0e1e; Type: INDEX; Schema: public; Owner: jovenes
--

CREATE INDEX wagtailredirects_redirect_site_id_780a0e1e ON public.wagtailredirects_redirect USING btree (site_id);


--
-- Name: wagtailsearch_editorspick_page_id_28cbc274; Type: INDEX; Schema: public; Owner: jovenes
--

CREATE INDEX wagtailsearch_editorspick_page_id_28cbc274 ON public.wagtailsearch_editorspick USING btree (page_id);


--
-- Name: wagtailsearch_editorspick_query_id_c6eee4a0; Type: INDEX; Schema: public; Owner: jovenes
--

CREATE INDEX wagtailsearch_editorspick_query_id_c6eee4a0 ON public.wagtailsearch_editorspick USING btree (query_id);


--
-- Name: wagtailsearch_query_query_string_e785ea07_like; Type: INDEX; Schema: public; Owner: jovenes
--

CREATE INDEX wagtailsearch_query_query_string_e785ea07_like ON public.wagtailsearch_query USING btree (query_string varchar_pattern_ops);


--
-- Name: wagtailsearch_querydailyhits_query_id_2185994b; Type: INDEX; Schema: public; Owner: jovenes
--

CREATE INDEX wagtailsearch_querydailyhits_query_id_2185994b ON public.wagtailsearch_querydailyhits USING btree (query_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_alianza home_alianza_page_id_bbb7e91f_fk_home_alianzas_page_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.home_alianza
    ADD CONSTRAINT home_alianza_page_id_bbb7e91f_fk_home_alianzas_page_ptr_id FOREIGN KEY (page_id) REFERENCES public.home_alianzas(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_alianzas home_alianzas_imagen_principal_id_1c6553e7_fk_wagtailim; Type: FK CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.home_alianzas
    ADD CONSTRAINT home_alianzas_imagen_principal_id_1c6553e7_fk_wagtailim FOREIGN KEY (imagen_principal_id) REFERENCES public.wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_alianzas home_alianzas_page_ptr_id_e81670ba_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.home_alianzas
    ADD CONSTRAINT home_alianzas_page_ptr_id_e81670ba_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_app home_app_page_ptr_id_e317a47a_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.home_app
    ADD CONSTRAINT home_app_page_ptr_id_e317a47a_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_ayudadifundiendo home_ayudadifundiend_imagen_principal_id_a155101a_fk_wagtailim; Type: FK CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.home_ayudadifundiendo
    ADD CONSTRAINT home_ayudadifundiend_imagen_principal_id_a155101a_fk_wagtailim FOREIGN KEY (imagen_principal_id) REFERENCES public.wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_ayudadifundiendo home_ayudadifundiend_page_ptr_id_0ada1d1f_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.home_ayudadifundiendo
    ADD CONSTRAINT home_ayudadifundiend_page_ptr_id_0ada1d1f_fk_wagtailco FOREIGN KEY (page_ptr_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_carrera home_carrera_imagen_inferior_kit__7ca47252_fk_wagtailim; Type: FK CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.home_carrera
    ADD CONSTRAINT home_carrera_imagen_inferior_kit__7ca47252_fk_wagtailim FOREIGN KEY (imagen_inferior_kit_id) REFERENCES public.wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_carrera home_carrera_imagen_inferior_mapa_1d3598cc_fk_wagtailim; Type: FK CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.home_carrera
    ADD CONSTRAINT home_carrera_imagen_inferior_mapa_1d3598cc_fk_wagtailim FOREIGN KEY (imagen_inferior_mapa_id) REFERENCES public.wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_carrera home_carrera_imagen_superior_hori_cfc10554_fk_wagtailim; Type: FK CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.home_carrera
    ADD CONSTRAINT home_carrera_imagen_superior_hori_cfc10554_fk_wagtailim FOREIGN KEY (imagen_superior_horizontal_id) REFERENCES public.wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_carrera home_carrera_imagen_superior_vert_3aeab0b3_fk_wagtailim; Type: FK CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.home_carrera
    ADD CONSTRAINT home_carrera_imagen_superior_vert_3aeab0b3_fk_wagtailim FOREIGN KEY (imagen_superior_vertical_id) REFERENCES public.wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_carrera home_carrera_page_ptr_id_3b8fec61_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.home_carrera
    ADD CONSTRAINT home_carrera_page_ptr_id_3b8fec61_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_carrera home_carrera_politica_menores_id_bd07a7b3_fk_wagtaildo; Type: FK CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.home_carrera
    ADD CONSTRAINT home_carrera_politica_menores_id_bd07a7b3_fk_wagtaildo FOREIGN KEY (politica_menores_id) REFERENCES public.wagtaildocs_document(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_carrera home_carrera_reglamento_id_830ab862_fk_wagtaildocs_document_id; Type: FK CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.home_carrera
    ADD CONSTRAINT home_carrera_reglamento_id_830ab862_fk_wagtaildocs_document_id FOREIGN KEY (reglamento_id) REFERENCES public.wagtaildocs_document(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_carreras home_carreras_page_ptr_id_fe46b984_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.home_carreras
    ADD CONSTRAINT home_carreras_page_ptr_id_fe46b984_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_comocolaborar home_comocolaborar_page_ptr_id_5734d821_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.home_comocolaborar
    ADD CONSTRAINT home_comocolaborar_page_ptr_id_5734d821_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_dondeestamos home_dondeestamos_imagen_principal_id_32c031fa_fk_wagtailim; Type: FK CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.home_dondeestamos
    ADD CONSTRAINT home_dondeestamos_imagen_principal_id_32c031fa_fk_wagtailim FOREIGN KEY (imagen_principal_id) REFERENCES public.wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_dondeestamos home_dondeestamos_page_ptr_id_7b771791_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.home_dondeestamos
    ADD CONSTRAINT home_dondeestamos_page_ptr_id_7b771791_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_homegalleryimage home_homegalleryimag_image_id_07a42b99_fk_wagtailim; Type: FK CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.home_homegalleryimage
    ADD CONSTRAINT home_homegalleryimag_image_id_07a42b99_fk_wagtailim FOREIGN KEY (image_id) REFERENCES public.wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_homegalleryimage home_homegalleryimag_page_id_103957bf_fk_home_home; Type: FK CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.home_homegalleryimage
    ADD CONSTRAINT home_homegalleryimag_page_id_103957bf_fk_home_home FOREIGN KEY (page_id) REFERENCES public.home_homepage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_homepage home_homepage_page_ptr_id_e5b77cf7_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.home_homepage
    ADD CONSTRAINT home_homepage_page_ptr_id_e5b77cf7_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_legado home_legado_imagen_principal_id_2c2bf57b_fk_wagtailim; Type: FK CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.home_legado
    ADD CONSTRAINT home_legado_imagen_principal_id_2c2bf57b_fk_wagtailim FOREIGN KEY (imagen_principal_id) REFERENCES public.wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_legado home_legado_page_ptr_id_94308f37_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.home_legado
    ADD CONSTRAINT home_legado_page_ptr_id_94308f37_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_memoria home_memoria_page_id_9fb53ac6_fk_home_transparencia_page_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.home_memoria
    ADD CONSTRAINT home_memoria_page_id_9fb53ac6_fk_home_transparencia_page_ptr_id FOREIGN KEY (page_id) REFERENCES public.home_transparencia(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_nosotros home_nosotros_page_ptr_id_9b411183_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.home_nosotros
    ADD CONSTRAINT home_nosotros_page_ptr_id_9b411183_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_noticia home_noticia_imagen_portada_id_b3217274_fk_wagtailim; Type: FK CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.home_noticia
    ADD CONSTRAINT home_noticia_imagen_portada_id_b3217274_fk_wagtailim FOREIGN KEY (imagen_portada_id) REFERENCES public.wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_noticia home_noticia_page_ptr_id_605c4157_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.home_noticia
    ADD CONSTRAINT home_noticia_page_ptr_id_605c4157_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_noticiagalleryimage home_noticiagalleryi_image_id_18edd62c_fk_wagtailim; Type: FK CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.home_noticiagalleryimage
    ADD CONSTRAINT home_noticiagalleryi_image_id_18edd62c_fk_wagtailim FOREIGN KEY (image_id) REFERENCES public.wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_noticiagalleryimage home_noticiagalleryi_page_id_33fbc71c_fk_home_noti; Type: FK CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.home_noticiagalleryimage
    ADD CONSTRAINT home_noticiagalleryi_page_id_33fbc71c_fk_home_noti FOREIGN KEY (page_id) REFERENCES public.home_noticia(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_noticias home_noticias_page_ptr_id_52e9632d_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.home_noticias
    ADD CONSTRAINT home_noticias_page_ptr_id_52e9632d_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_quehacemos home_quehacemos_acciones_imagen_id_b1533772_fk_wagtailim; Type: FK CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.home_quehacemos
    ADD CONSTRAINT home_quehacemos_acciones_imagen_id_b1533772_fk_wagtailim FOREIGN KEY (acciones_imagen_id) REFERENCES public.wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_quehacemos home_quehacemos_banner_imagen_id_def36e82_fk_wagtailim; Type: FK CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.home_quehacemos
    ADD CONSTRAINT home_quehacemos_banner_imagen_id_def36e82_fk_wagtailim FOREIGN KEY (banner_imagen_id) REFERENCES public.wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_quehacemos home_quehacemos_comunitaria_imagen_i_22361d4f_fk_wagtailim; Type: FK CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.home_quehacemos
    ADD CONSTRAINT home_quehacemos_comunitaria_imagen_i_22361d4f_fk_wagtailim FOREIGN KEY (comunitaria_imagen_id) REFERENCES public.wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_quehacemos home_quehacemos_educacion_imagen_id_18c76e85_fk_wagtailim; Type: FK CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.home_quehacemos
    ADD CONSTRAINT home_quehacemos_educacion_imagen_id_18c76e85_fk_wagtailim FOREIGN KEY (educacion_imagen_id) REFERENCES public.wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_quehacemos home_quehacemos_imagen_principal_id_8fa06213_fk_wagtailim; Type: FK CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.home_quehacemos
    ADD CONSTRAINT home_quehacemos_imagen_principal_id_8fa06213_fk_wagtailim FOREIGN KEY (imagen_principal_id) REFERENCES public.wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_quehacemos home_quehacemos_page_ptr_id_08821ffc_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.home_quehacemos
    ADD CONSTRAINT home_quehacemos_page_ptr_id_08821ffc_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_quehacemos home_quehacemos_trabajo_imagen_id_875ea9b1_fk_wagtailim; Type: FK CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.home_quehacemos
    ADD CONSTRAINT home_quehacemos_trabajo_imagen_id_875ea9b1_fk_wagtailim FOREIGN KEY (trabajo_imagen_id) REFERENCES public.wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_quienessomos home_quienessomos_imagen_principal_id_ed26fd4c_fk_wagtailim; Type: FK CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.home_quienessomos
    ADD CONSTRAINT home_quienessomos_imagen_principal_id_ed26fd4c_fk_wagtailim FOREIGN KEY (imagen_principal_id) REFERENCES public.wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_quienessomos home_quienessomos_page_ptr_id_88cb8d36_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.home_quienessomos
    ADD CONSTRAINT home_quienessomos_page_ptr_id_88cb8d36_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_quierodonar home_quierodonar_imagen_principal_id_7ae2054f_fk_wagtailim; Type: FK CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.home_quierodonar
    ADD CONSTRAINT home_quierodonar_imagen_principal_id_7ae2054f_fk_wagtailim FOREIGN KEY (imagen_principal_id) REFERENCES public.wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_quierodonar home_quierodonar_page_ptr_id_8ab42d92_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.home_quierodonar
    ADD CONSTRAINT home_quierodonar_page_ptr_id_8ab42d92_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_sponsorapp home_sponsorapp_page_id_b7b1bf5b_fk_home_app_page_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.home_sponsorapp
    ADD CONSTRAINT home_sponsorapp_page_id_b7b1bf5b_fk_home_app_page_ptr_id FOREIGN KEY (page_id) REFERENCES public.home_app(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_sponsorapp home_sponsorapp_sponsorclass_ptr_id_a38bb3b3_fk_home_spon; Type: FK CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.home_sponsorapp
    ADD CONSTRAINT home_sponsorapp_sponsorclass_ptr_id_a38bb3b3_fk_home_spon FOREIGN KEY (sponsorclass_ptr_id) REFERENCES public.home_sponsorclass(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_sponsorcarrera home_sponsorcarrera_page_id_8c974cc5_fk_home_carr; Type: FK CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.home_sponsorcarrera
    ADD CONSTRAINT home_sponsorcarrera_page_id_8c974cc5_fk_home_carr FOREIGN KEY (page_id) REFERENCES public.home_carrera(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_sponsorcarrera home_sponsorcarrera_sponsorclass_ptr_id_4b57f6d1_fk_home_spon; Type: FK CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.home_sponsorcarrera
    ADD CONSTRAINT home_sponsorcarrera_sponsorclass_ptr_id_4b57f6d1_fk_home_spon FOREIGN KEY (sponsorclass_ptr_id) REFERENCES public.home_sponsorclass(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_sponsorclass home_sponsorclass_imagen_sponsor_id_aff8e154_fk_wagtailim; Type: FK CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.home_sponsorclass
    ADD CONSTRAINT home_sponsorclass_imagen_sponsor_id_aff8e154_fk_wagtailim FOREIGN KEY (imagen_sponsor_id) REFERENCES public.wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_transparencia home_transparencia_imagen_principal_id_319aa76d_fk_wagtailim; Type: FK CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.home_transparencia
    ADD CONSTRAINT home_transparencia_imagen_principal_id_319aa76d_fk_wagtailim FOREIGN KEY (imagen_principal_id) REFERENCES public.wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_transparencia home_transparencia_page_ptr_id_8b7fc04c_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.home_transparencia
    ADD CONSTRAINT home_transparencia_page_ptr_id_8b7fc04c_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_video_old home_video_old_page_id_ed01062b_fk_home_carrera_page_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.home_video_old
    ADD CONSTRAINT home_video_old_page_id_ed01062b_fk_home_carrera_page_ptr_id FOREIGN KEY (page_id) REFERENCES public.home_carrera(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: postgres_search_indexentry postgres_search_inde_content_type_id_d805086f_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.postgres_search_indexentry
    ADD CONSTRAINT postgres_search_inde_content_type_id_d805086f_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: taggit_taggeditem taggit_taggeditem_content_type_id_9957a03c_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_content_type_id_9957a03c_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: taggit_taggeditem taggit_taggeditem_tag_id_f4f5b767_fk_taggit_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_tag_id_f4f5b767_fk_taggit_tag_id FOREIGN KEY (tag_id) REFERENCES public.taggit_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_collectionviewrestriction wagtailcore_collecti_collection_id_761908ec_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.wagtailcore_collectionviewrestriction
    ADD CONSTRAINT wagtailcore_collecti_collection_id_761908ec_fk_wagtailco FOREIGN KEY (collection_id) REFERENCES public.wagtailcore_collection(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_collectionviewrestriction_groups wagtailcore_collecti_collectionviewrestri_47320efd_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.wagtailcore_collectionviewrestriction_groups
    ADD CONSTRAINT wagtailcore_collecti_collectionviewrestri_47320efd_fk_wagtailco FOREIGN KEY (collectionviewrestriction_id) REFERENCES public.wagtailcore_collectionviewrestriction(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_collectionviewrestriction_groups wagtailcore_collecti_group_id_1823f2a3_fk_auth_grou; Type: FK CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.wagtailcore_collectionviewrestriction_groups
    ADD CONSTRAINT wagtailcore_collecti_group_id_1823f2a3_fk_auth_grou FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_groupcollectionpermission wagtailcore_groupcol_collection_id_5423575a_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.wagtailcore_groupcollectionpermission
    ADD CONSTRAINT wagtailcore_groupcol_collection_id_5423575a_fk_wagtailco FOREIGN KEY (collection_id) REFERENCES public.wagtailcore_collection(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_groupcollectionpermission wagtailcore_groupcol_group_id_05d61460_fk_auth_grou; Type: FK CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.wagtailcore_groupcollectionpermission
    ADD CONSTRAINT wagtailcore_groupcol_group_id_05d61460_fk_auth_grou FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_groupcollectionpermission wagtailcore_groupcol_permission_id_1b626275_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.wagtailcore_groupcollectionpermission
    ADD CONSTRAINT wagtailcore_groupcol_permission_id_1b626275_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_grouppagepermission wagtailcore_grouppag_group_id_fc07e671_fk_auth_grou; Type: FK CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.wagtailcore_grouppagepermission
    ADD CONSTRAINT wagtailcore_grouppag_group_id_fc07e671_fk_auth_grou FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_grouppagepermission wagtailcore_grouppag_page_id_710b114a_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.wagtailcore_grouppagepermission
    ADD CONSTRAINT wagtailcore_grouppag_page_id_710b114a_fk_wagtailco FOREIGN KEY (page_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_page wagtailcore_page_content_type_id_c28424df_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.wagtailcore_page
    ADD CONSTRAINT wagtailcore_page_content_type_id_c28424df_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_page wagtailcore_page_live_revision_id_930bd822_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.wagtailcore_page
    ADD CONSTRAINT wagtailcore_page_live_revision_id_930bd822_fk_wagtailco FOREIGN KEY (live_revision_id) REFERENCES public.wagtailcore_pagerevision(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_page wagtailcore_page_owner_id_fbf7c332_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.wagtailcore_page
    ADD CONSTRAINT wagtailcore_page_owner_id_fbf7c332_fk_auth_user_id FOREIGN KEY (owner_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_pagerevision wagtailcore_pagerevi_page_id_d421cc1d_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.wagtailcore_pagerevision
    ADD CONSTRAINT wagtailcore_pagerevi_page_id_d421cc1d_fk_wagtailco FOREIGN KEY (page_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_pagerevision wagtailcore_pagerevision_user_id_2409d2f4_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.wagtailcore_pagerevision
    ADD CONSTRAINT wagtailcore_pagerevision_user_id_2409d2f4_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_pageviewrestriction_groups wagtailcore_pageview_group_id_6460f223_fk_auth_grou; Type: FK CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.wagtailcore_pageviewrestriction_groups
    ADD CONSTRAINT wagtailcore_pageview_group_id_6460f223_fk_auth_grou FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_pageviewrestriction wagtailcore_pageview_page_id_15a8bea6_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.wagtailcore_pageviewrestriction
    ADD CONSTRAINT wagtailcore_pageview_page_id_15a8bea6_fk_wagtailco FOREIGN KEY (page_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_pageviewrestriction_groups wagtailcore_pageview_pageviewrestriction__f147a99a_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.wagtailcore_pageviewrestriction_groups
    ADD CONSTRAINT wagtailcore_pageview_pageviewrestriction__f147a99a_fk_wagtailco FOREIGN KEY (pageviewrestriction_id) REFERENCES public.wagtailcore_pageviewrestriction(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_site wagtailcore_site_root_page_id_e02fb95c_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.wagtailcore_site
    ADD CONSTRAINT wagtailcore_site_root_page_id_e02fb95c_fk_wagtailcore_page_id FOREIGN KEY (root_page_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtaildocs_document wagtaildocs_document_collection_id_23881625_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.wagtaildocs_document
    ADD CONSTRAINT wagtaildocs_document_collection_id_23881625_fk_wagtailco FOREIGN KEY (collection_id) REFERENCES public.wagtailcore_collection(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtaildocs_document wagtaildocs_document_uploaded_by_user_id_17258b41_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.wagtaildocs_document
    ADD CONSTRAINT wagtaildocs_document_uploaded_by_user_id_17258b41_fk_auth_user FOREIGN KEY (uploaded_by_user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailforms_formsubmission wagtailforms_formsub_page_id_e48e93e7_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.wagtailforms_formsubmission
    ADD CONSTRAINT wagtailforms_formsub_page_id_e48e93e7_fk_wagtailco FOREIGN KEY (page_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailimages_image wagtailimages_image_collection_id_c2f8af7e_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.wagtailimages_image
    ADD CONSTRAINT wagtailimages_image_collection_id_c2f8af7e_fk_wagtailco FOREIGN KEY (collection_id) REFERENCES public.wagtailcore_collection(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailimages_image wagtailimages_image_uploaded_by_user_id_5d73dc75_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.wagtailimages_image
    ADD CONSTRAINT wagtailimages_image_uploaded_by_user_id_5d73dc75_fk_auth_user FOREIGN KEY (uploaded_by_user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailimages_rendition wagtailimages_rendit_image_id_3e1fd774_fk_wagtailim; Type: FK CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.wagtailimages_rendition
    ADD CONSTRAINT wagtailimages_rendit_image_id_3e1fd774_fk_wagtailim FOREIGN KEY (image_id) REFERENCES public.wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailredirects_redirect wagtailredirects_red_redirect_page_id_b5728a8f_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.wagtailredirects_redirect
    ADD CONSTRAINT wagtailredirects_red_redirect_page_id_b5728a8f_fk_wagtailco FOREIGN KEY (redirect_page_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailredirects_redirect wagtailredirects_red_site_id_780a0e1e_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.wagtailredirects_redirect
    ADD CONSTRAINT wagtailredirects_red_site_id_780a0e1e_fk_wagtailco FOREIGN KEY (site_id) REFERENCES public.wagtailcore_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailsearch_editorspick wagtailsearch_editor_page_id_28cbc274_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.wagtailsearch_editorspick
    ADD CONSTRAINT wagtailsearch_editor_page_id_28cbc274_fk_wagtailco FOREIGN KEY (page_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailsearch_editorspick wagtailsearch_editor_query_id_c6eee4a0_fk_wagtailse; Type: FK CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.wagtailsearch_editorspick
    ADD CONSTRAINT wagtailsearch_editor_query_id_c6eee4a0_fk_wagtailse FOREIGN KEY (query_id) REFERENCES public.wagtailsearch_query(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailsearch_querydailyhits wagtailsearch_queryd_query_id_2185994b_fk_wagtailse; Type: FK CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.wagtailsearch_querydailyhits
    ADD CONSTRAINT wagtailsearch_queryd_query_id_2185994b_fk_wagtailse FOREIGN KEY (query_id) REFERENCES public.wagtailsearch_query(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailusers_userprofile wagtailusers_userprofile_user_id_59c92331_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: jovenes
--

ALTER TABLE ONLY public.wagtailusers_userprofile
    ADD CONSTRAINT wagtailusers_userprofile_user_id_59c92331_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--


PGDMP                         y            flask-activity    13.3    13.3     ?           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ?           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ?           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ?           1262    24753    flask-activity    DATABASE     r   CREATE DATABASE "flask-activity" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Arabic_Saudi Arabia.1256';
     DROP DATABASE "flask-activity";
                postgres    false            ?            1259    24774    Book    TABLE     ?   CREATE TABLE public."Book" (
    id integer NOT NULL,
    title character varying,
    author character varying(120),
    type character varying(120),
    read boolean
);
    DROP TABLE public."Book";
       public         heap    postgres    false            ?            1259    24772    Book_id_seq    SEQUENCE     ?   CREATE SEQUENCE public."Book_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public."Book_id_seq";
       public          postgres    false    202            ?           0    0    Book_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public."Book_id_seq" OWNED BY public."Book".id;
          public          postgres    false    201            ?            1259    24767    alembic_version    TABLE     X   CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);
 #   DROP TABLE public.alembic_version;
       public         heap    postgres    false            '           2604    24777    Book id    DEFAULT     f   ALTER TABLE ONLY public."Book" ALTER COLUMN id SET DEFAULT nextval('public."Book_id_seq"'::regclass);
 8   ALTER TABLE public."Book" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    202    201    202            ?          0    24774    Book 
   TABLE DATA           ?   COPY public."Book" (id, title, author, type, read) FROM stdin;
    public          postgres    false    202   ?       ?          0    24767    alembic_version 
   TABLE DATA           6   COPY public.alembic_version (version_num) FROM stdin;
    public          postgres    false    200   ?       ?           0    0    Book_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public."Book_id_seq"', 40, true);
          public          postgres    false    201            +           2606    24782    Book Book_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public."Book"
    ADD CONSTRAINT "Book_pkey" PRIMARY KEY (id);
 <   ALTER TABLE ONLY public."Book" DROP CONSTRAINT "Book_pkey";
       public            postgres    false    202            )           2606    24771 #   alembic_version alembic_version_pkc 
   CONSTRAINT     j   ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);
 M   ALTER TABLE ONLY public.alembic_version DROP CONSTRAINT alembic_version_pkc;
       public            postgres    false    200            ?      x?????? ? ?      ?      x??H61LJ5??HI5?????? -w     
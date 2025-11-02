--
-- PostgreSQL database dump
--

-- Dumped from database version 15.14 (Debian 15.14-1.pgdg13+1)
-- Dumped by pg_dump version 17.4

-- Started on 2025-11-02 14:10:14

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 215 (class 1259 OID 16392)
-- Name: roles; Type: TABLE; Schema: public; Owner: my_user
--

CREATE TABLE public.roles (
    role_id bigint NOT NULL,
    role_name character varying(60)
);


ALTER TABLE public.roles OWNER TO my_user;

--
-- TOC entry 216 (class 1259 OID 16416)
-- Name: sections; Type: TABLE; Schema: public; Owner: my_user
--

CREATE TABLE public.sections (
    section_id bigint NOT NULL,
    section_name character varying(60)
);


ALTER TABLE public.sections OWNER TO my_user;

--
-- TOC entry 218 (class 1259 OID 16436)
-- Name: students; Type: TABLE; Schema: public; Owner: my_user
--

CREATE TABLE public.students (
    student_id bigint NOT NULL,
    user_id bigint,
    section_id bigint,
    student_start_date timestamp without time zone NOT NULL,
    student_end_date timestamp without time zone
);


ALTER TABLE public.students OWNER TO my_user;

--
-- TOC entry 217 (class 1259 OID 16421)
-- Name: teachers; Type: TABLE; Schema: public; Owner: my_user
--

CREATE TABLE public.teachers (
    teacher_id bigint NOT NULL,
    user_id bigint,
    section_id bigint
);


ALTER TABLE public.teachers OWNER TO my_user;

--
-- TOC entry 214 (class 1259 OID 16389)
-- Name: users; Type: TABLE; Schema: public; Owner: my_user
--

CREATE TABLE public.users (
    user_id bigint NOT NULL,
    username character varying(50) NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(40) NOT NULL,
    first_name character varying(40),
    last_name character varying(40),
    patronymic character varying(40),
    phone_number character varying(20) NOT NULL,
    role_id bigint
);


ALTER TABLE public.users OWNER TO my_user;

--
-- TOC entry 3446 (class 0 OID 16392)
-- Dependencies: 215
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: my_user
--

COPY public.roles (role_id, role_name) FROM stdin;
1	Admin
2	Teacher
3	Student
\.


--
-- TOC entry 3447 (class 0 OID 16416)
-- Dependencies: 216
-- Data for Name: sections; Type: TABLE DATA; Schema: public; Owner: my_user
--

COPY public.sections (section_id, section_name) FROM stdin;
1	Программирование и алгоритмы
2	Робототехника и автоматизация
3	Дизайн и цифровое искусство
4	Научно-исследовательская деятельность
5	Математика и логика
\.


--
-- TOC entry 3449 (class 0 OID 16436)
-- Dependencies: 218
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: my_user
--

COPY public.students (student_id, user_id, section_id, student_start_date, student_end_date) FROM stdin;
1	7	3	2023-09-13 22:44:38.878376	\N
2	8	4	2023-04-04 10:54:57.863745	2023-06-07 05:17:28.11796
3	9	4	2025-07-18 20:44:23.715327	\N
4	10	4	2024-08-17 08:38:36.088615	\N
5	11	3	2024-01-24 23:21:12.093953	2024-12-01 12:01:31.535332
6	12	4	2023-06-25 09:36:03.772602	2024-01-02 21:28:48.121836
7	13	5	2024-04-21 13:52:55.541436	2024-11-18 13:49:18.895285
8	14	2	2024-05-27 18:35:18.634678	2024-10-19 11:58:51.584763
9	15	5	2024-09-15 08:06:20.38279	2024-11-16 20:36:46.616735
10	16	2	2023-02-19 02:23:25.094643	2023-09-14 14:33:47.809648
11	17	2	2025-10-08 14:27:06.821972	\N
12	18	4	2025-03-30 01:45:43.286376	2025-07-28 20:57:59.500864
13	19	1	2024-08-30 19:06:25.210267	2025-07-03 17:00:57.310373
14	20	3	2023-01-27 17:38:07.542807	\N
15	21	4	2025-04-14 15:39:22.565403	2025-08-12 06:49:43.994081
16	22	4	2025-03-13 21:01:01.724941	2025-07-04 15:11:43.193304
17	23	3	2025-02-05 14:24:33.04776	\N
18	24	4	2024-02-01 17:19:05.832364	2024-03-19 17:24:16.416111
19	25	2	2025-07-25 23:07:54.448892	2025-11-24 08:20:13.597876
20	26	5	2024-08-26 07:36:59.136922	2024-10-04 20:36:22.206313
21	27	1	2023-11-09 09:49:30.736977	2024-05-14 22:18:02.482415
22	28	2	2023-03-18 19:26:13.726729	2024-01-12 18:07:22.190997
23	29	1	2025-03-12 18:44:29.495678	\N
24	30	1	2023-06-04 17:27:57.44565	\N
25	31	4	2025-02-07 17:32:36.293447	2025-08-14 05:20:29.656599
26	32	1	2025-10-25 08:20:25.959239	\N
27	33	1	2025-08-29 09:19:12.594116	2026-03-09 13:27:58.739398
28	34	4	2024-02-07 05:12:10.264614	2024-12-27 14:48:29.399475
29	35	2	2025-05-22 21:34:21.99314	2026-02-25 02:50:28.31252
30	36	3	2025-04-05 10:04:37.803523	2025-08-25 15:22:17.650297
31	37	4	2023-12-31 19:41:27.258086	2024-07-26 07:42:41.502008
32	38	4	2025-04-22 21:53:39.703334	\N
33	39	3	2025-10-24 21:18:57.562674	\N
34	40	2	2025-05-25 19:39:36.348282	2026-02-11 07:36:40.804424
35	41	5	2025-10-02 13:32:49.377134	2025-12-13 10:57:44.842472
36	42	2	2023-02-08 00:12:53.251608	2023-12-09 20:47:48.977117
37	43	3	2024-10-22 11:22:26.837191	2025-09-09 18:22:39.768858
38	44	5	2024-06-10 17:37:44.343071	\N
39	45	2	2025-07-31 15:32:48.983641	2025-10-08 08:12:59.991966
40	46	2	2024-09-17 06:44:14.655207	\N
41	47	3	2023-08-08 02:11:18.251022	2024-05-21 11:10:26.312897
42	48	2	2023-01-07 09:56:32.300428	\N
43	49	2	2024-04-01 01:04:26.899076	\N
44	50	3	2025-08-19 06:40:32.551077	\N
45	51	1	2024-11-08 22:02:48.23192	2025-04-17 19:29:08.394233
46	52	5	2023-09-29 15:15:11.60046	\N
47	53	3	2025-09-19 21:20:55.062764	2026-05-01 05:52:28.269623
48	54	1	2023-08-02 03:00:46.955703	2024-04-08 13:26:42.337264
49	55	1	2025-06-19 08:17:22.952478	2025-07-25 23:02:44.012083
50	56	2	2023-04-04 10:27:27.024787	2023-10-31 06:35:33.606127
51	57	3	2023-02-27 04:25:45.13222	\N
52	58	2	2024-12-26 18:48:01.171931	2025-02-13 04:04:58.109192
53	59	5	2024-05-31 23:49:14.896086	2024-07-25 04:39:05.585391
54	60	4	2024-06-07 04:46:45.649283	2024-12-25 08:43:33.091487
55	61	4	2024-04-03 17:06:19.119898	\N
56	62	1	2025-08-31 02:37:43.221115	2026-03-20 16:53:24.129639
57	63	5	2024-03-05 06:25:12.014183	\N
58	64	4	2023-10-25 02:55:17.81887	2024-01-18 07:14:14.295828
59	65	4	2024-06-13 06:28:21.183144	2025-01-15 08:06:08.615259
60	66	2	2024-08-23 00:44:27.311437	2025-01-19 14:59:02.039294
61	67	1	2023-11-30 14:45:07.868825	2024-01-18 10:49:03.403506
62	68	4	2025-09-05 10:35:46.474857	2025-11-01 05:41:44.879325
63	69	1	2023-02-17 21:05:27.590234	\N
64	70	1	2023-03-03 16:54:31.40008	\N
65	71	1	2023-04-23 17:04:22.567712	2024-01-08 16:52:01.583166
66	72	4	2024-09-18 08:32:31.747526	2025-01-10 02:14:34.619395
67	73	4	2025-01-27 17:33:26.703738	\N
68	74	1	2024-04-03 15:44:35.381566	2024-11-13 01:38:05.077678
69	75	1	2023-11-29 10:27:15.566361	2024-01-21 07:28:25.956006
70	76	3	2024-06-24 11:41:41.197157	2024-12-13 02:46:34.02895
71	77	4	2024-10-29 14:33:51.085478	2025-07-28 04:57:58.94622
72	78	2	2024-08-23 19:49:44.631977	2025-01-14 15:15:21.48789
73	79	3	2023-04-24 06:48:25.048667	\N
74	80	4	2025-01-05 00:11:49.951554	2025-10-22 12:28:35.811758
75	81	3	2024-07-11 14:34:54.754322	2024-11-03 20:39:18.138546
76	82	5	2023-04-28 23:00:58.638264	2023-10-13 16:46:41.533936
77	83	3	2023-07-02 04:40:00.790726	\N
78	84	3	2023-10-01 00:01:33.040937	2023-12-05 01:37:21.518851
79	85	2	2023-04-04 10:42:34.377526	\N
80	86	2	2023-03-18 04:21:21.179351	2023-12-13 10:54:27.186034
81	87	4	2024-10-09 08:25:05.13197	\N
82	88	1	2024-09-25 15:52:10.44819	2024-12-17 18:29:45.934726
83	89	4	2024-06-17 10:24:49.149455	2025-03-11 00:09:50.847922
84	90	4	2025-10-13 07:05:25.933484	\N
85	91	4	2023-03-05 22:55:29.545631	2023-10-20 03:10:05.703482
86	92	2	2023-07-20 09:17:03.675624	2023-11-27 14:08:06.336918
87	93	4	2025-10-20 08:43:09.032807	2026-04-16 08:31:10.552359
88	94	3	2024-10-07 02:59:37.75554	\N
89	95	2	2025-07-14 04:42:50.604429	2025-09-18 14:05:06.961257
90	96	3	2023-09-22 07:02:09.0971	\N
91	97	1	2024-09-17 06:23:29.537955	\N
92	98	3	2023-11-18 02:27:35.041657	\N
93	99	5	2025-07-15 21:48:55.840397	2026-04-07 23:45:09.598107
94	100	4	2025-09-24 02:06:53.68337	\N
\.


--
-- TOC entry 3448 (class 0 OID 16421)
-- Dependencies: 217
-- Data for Name: teachers; Type: TABLE DATA; Schema: public; Owner: my_user
--

COPY public.teachers (teacher_id, user_id, section_id) FROM stdin;
1	2	1
2	3	2
3	4	3
4	5	4
5	6	5
\.


--
-- TOC entry 3445 (class 0 OID 16389)
-- Dependencies: 214
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: my_user
--

COPY public.users (user_id, username, email, password, first_name, last_name, patronymic, phone_number, role_id) FROM stdin;
1	admin	admin@school.ru	admin123	Алексей	Иванов	Петрович	+79161234567	1
2	teacher1	teacher1@school.ru	teacher123	Мария	Петрова	Сергеевна	+79161234568	2
3	teacher2	teacher2@school.ru	teacher223	Сергей	Сидоров	Александрович	+79161234569	2
4	teacher3	teacher3@school.ru	teacher323	Ольга	Кузнецова	Владимировна	+79161234570	2
5	teacher4	teacher4@school.ru	teacher423	Дмитрий	Смирнов	Игоревич	+79161234571	2
6	teacher5	teacher5@school.ru	teacher523	Елена	Васильева	Дмитриевна	+79161234572	2
7	student1	student1@school.ru	student123	Иван	Иванов	Иванович	+79161234573	3
8	student2	student2@school.ru	student223	Петр	Петров	Петрович	+79161234574	3
9	student3	student3@school.ru	student323	Анна	Сидорова	Алексеевна	+79161234575	3
10	student4	student4@school.ru	student423	Екатерина	Козлова	Сергеевна	+79161234576	3
11	student5	student5@school.ru	student523	Александр	Новиков	Дмитриевич	+79161234577	3
12	student6	student6@school.ru	student623	Татьяна	Морозова	Андреевна	+79161234578	3
13	student7	student7@school.ru	student723	Михаил	Волков	Олегович	+79161234579	3
14	student8	student8@school.ru	student823	Наталья	Алексеева	Викторовна	+79161234580	3
15	student9	student9@school.ru	student923	Андрей	Лебедев	Ильич	+79161234581	3
16	student10	student10@school.ru	student1023	Юлия	Семенова	Павловна	+79161234582	3
17	student11	student11@school.ru	student1123	Артем	Егоров	Романович	+79161234583	3
18	student12	student12@school.ru	student1223	Виктория	Павлова	Артемовна	+79161234584	3
19	student13	student13@school.ru	student1323	Роман	Ковалев	Сергеевич	+79161234585	3
20	student14	student14@school.ru	student1423	Оксана	Орлова	Денисовна	+79161234586	3
21	student15	student15@school.ru	student1523	Денис	Андреев	Владимирович	+79161234587	3
22	student16	student16@school.ru	student1623	Ирина	Макарова	Александровна	+79161234588	3
23	student17	student17@school.ru	student1723	Владимир	Никитин	Петрович	+79161234589	3
24	student18	student18@school.ru	student1823	Светлана	Захарова	Игоревна	+79161234590	3
25	student19	student19@school.ru	student1923	Павел	Зайцев	Анатольевич	+79161234591	3
26	student20	student20@school.ru	student2023	Марина	Соловьева	Витальевна	+79161234592	3
27	student21	student21@school.ru	student2123	Григорий	Васнецов	Олегович	+79161234593	3
28	student22	student22@school.ru	student2223	Людмила	Громова	Сергеевна	+79161234594	3
29	student23	student23@school.ru	student2323	Станислав	Тихонов	Дмитриевич	+79161234595	3
30	student24	student24@school.ru	student2423	Алина	Воронова	Андреевна	+79161234596	3
31	student25	student25@school.ru	student2523	Евгений	Федоров	Викторович	+79161234597	3
32	student26	student26@school.ru	student2623	Ксения	Медведева	Олеговна	+79161234598	3
33	student27	student27@school.ru	student2723	Вадим	Белов	Игоревич	+79161234599	3
34	student28	student28@school.ru	student2823	Ангелина	Крылова	Денисовна	+79161234600	3
35	student29	student29@school.ru	student2923	Георгий	Максимов	Алексеевич	+79161234601	3
36	student30	student30@school.ru	student3023	Вероника	Полякова	Романовна	+79161234602	3
37	student31	student31@school.ru	student3123	Константин	Карпов	Сергеевич	+79161234603	3
38	student32	student32@school.ru	student3223	Диана	Шарова	Андреевна	+79161234604	3
39	student33	student33@school.ru	student3323	Никита	Борисов	Дмитриевич	+79161234605	3
40	student34	student34@school.ru	student3423	Элина	Киселева	Владимировна	+79161234606	3
41	student35	student35@school.ru	student3523	Игорь	Герасимов	Олегович	+79161234607	3
42	student36	student36@school.ru	student3623	Яна	Тарасова	Сергеевна	+79161234608	3
43	student37	student37@school.ru	student3723	Валерий	Соболев	Анатольевич	+79161234609	3
44	student38	student38@school.ru	student3823	Лилия	Власова	Дмитриевна	+79161234610	3
45	student39	student39@school.ru	student3923	Семен	Коновалов	Иванович	+79161234611	3
46	student40	student40@school.ru	student4023	Алла	Прохорова	Викторовна	+79161234612	3
47	student41	student41@school.ru	student4123	Федор	Назаров	Петрович	+79161234613	3
48	student42	student42@school.ru	student4223	Регина	Ефимова	Алексеевна	+79161234614	3
49	student43	student43@school.ru	student4323	Леонид	Данилов	Сергеевич	+79161234615	3
50	student44	student44@school.ru	student4423	Кристина	Сазонова	Андреевна	+79161234616	3
51	student45	student45@school.ru	student4523	Вячеслав	Тимофеев	Дмитриевич	+79161234617	3
52	student46	student46@school.ru	student4623	Анжела	Фомина	Олеговна	+79161234618	3
53	student47	student47@school.ru	student4723	Геннадий	Дорофеев	Викторович	+79161234619	3
54	student48	student48@school.ru	student4823	Снежана	Маркова	Игоревна	+79161234620	3
55	student49	student49@school.ru	student4923	Аркадий	Воронов	Александрович	+79161234621	3
56	student50	student50@school.ru	student5023	Эльвира	Абрамова	Сергеевна	+79161234622	3
57	student51	student51@school.ru	student5123	Юрий	Лазарев	Дмитриевич	+79161234623	3
58	student52	student52@school.ru	student5223	Жанна	Романова	Андреевна	+79161234624	3
59	student53	student53@school.ru	student5323	Сергей	Мельников	Викторович	+79161234625	3
60	student54	student54@school.ru	student5423	Лариса	Владимирова	Олеговна	+79161234626	3
61	student55	student55@school.ru	student5523	Анатолий	Филиппов	Игоревич	+79161234627	3
62	student56	student56@school.ru	student5623	Валентина	Дмитриева	Петровна	+79161234628	3
63	student57	student57@school.ru	student5723	Борис	Щербаков	Алексеевич	+79161234629	3
64	student58	student58@school.ru	student5823	Галина	Наумова	Дмитриевна	+79161234630	3
65	student59	student59@school.ru	student5923	Валерия	Шилова	Сергеевна	+79161234631	3
66	student60	student60@school.ru	student6023	Максим	Беляев	Андреевич	+79161234632	3
67	student61	student61@school.ru	student6123	Инна	Маслова	Викторовна	+79161234633	3
68	student62	student62@school.ru	student6223	Руслан	Кудрявцев	Олегович	+79161234634	3
69	student63	student63@school.ru	student6323	Алевтина	Блинова	Дмитриевна	+79161234635	3
70	student64	student64@school.ru	student6423	Эдуард	Колесников	Сергеевич	+79161234636	3
71	student65	student65@school.ru	student6523	Зоя	Калашникова	Андреевна	+79161234637	3
72	student66	student66@school.ru	student6623	Платон	Носов	Викторович	+79161234638	3
73	student67	student67@school.ru	student6723	Карина	Степанова	Игоревна	+79161234639	3
74	student68	student68@school.ru	student6823	Арсений	Жуков	Дмитриевич	+79161234640	3
75	student69	student69@school.ru	student6923	Любовь	Ершова	Алексеевна	+79161234641	3
76	student70	student70@school.ru	student7023	Степан	Павлов	Сергеевич	+79161234642	3
77	student71	student71@school.ru	student7123	Раиса	Коваль	Андреевна	+79161234643	3
78	student72	student72@school.ru	student7223	Ярослав	Терентьев	Олегович	+79161234644	3
79	student73	student73@school.ru	student7323	Нина	Одинцова	Дмитриевна	+79161234645	3
80	student74	student74@school.ru	student7423	Всеволод	Гусев	Викторович	+79161234646	3
81	student75	student75@school.ru	student7523	Лидия	Сорокина	Сергеевна	+79161234647	3
82	student76	student76@school.ru	student7623	Матвей	Пономарев	Андреевич	+79161234648	3
83	student77	student77@school.ru	student7723	Агата	Лыткина	Олеговна	+79161234649	3
84	student78	student78@school.ru	student7823	Савва	Виноградов	Дмитриевич	+79161234650	3
85	student79	student79@school.ru	student7923	Клавдия	Быкова	Викторовна	+79161234651	3
86	student80	student80@school.ru	student8023	Прохор	Шестаков	Сергеевич	+79161234652	3
87	student81	student81@school.ru	student8123	Роза	Голубева	Андреевна	+79161234653	3
88	student82	student82@school.ru	student8223	Тимофей	Корнилов	Олегович	+79161234654	3
89	student83	student83@school.ru	student8323	Нонна	Евдокимова	Дмитриевна	+79161234655	3
90	student84	student84@school.ru	student8423	Ефим	Рожков	Викторович	+79161234656	3
91	student85	student85@school.ru	student8523	Зинаида	Игнатьева	Сергеевна	+79161234657	3
92	student86	student86@school.ru	student8623	Савелий	Савин	Андреевич	+79161234658	3
93	student87	student87@school.ru	student8723	Кира	Лапина	Олеговна	+79161234659	3
94	student88	student88@school.ru	student8823	Игнат	Горбунов	Дмитриевич	+79161234660	3
95	student89	student89@school.ru	student8923	Тамара	Котов	Викторовна	+79161234661	3
96	student90	student90@school.ru	student9023	Емельян	Григорьев	Сергеевич	+79161234662	3
97	student91	student91@school.ru	student9123	Нелли	Архипова	Андреевна	+79161234663	3
98	student92	student92@school.ru	student9223	Порфирий	Антонов	Олегович	+79161234664	3
99	student93	student93@school.ru	student9323	Эмма	Елисеева	Дмитриевна	+79161234665	3
100	student94	student94@school.ru	student9423	Варфоломей	Жданов	Викторович	+79161234666	3
\.


--
-- TOC entry 3289 (class 2606 OID 16398)
-- Name: roles role_name_unique; Type: CONSTRAINT; Schema: public; Owner: my_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT role_name_unique UNIQUE (role_name);


--
-- TOC entry 3291 (class 2606 OID 16396)
-- Name: roles roles_pk; Type: CONSTRAINT; Schema: public; Owner: my_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pk PRIMARY KEY (role_id);


--
-- TOC entry 3293 (class 2606 OID 16420)
-- Name: sections sections_pk; Type: CONSTRAINT; Schema: public; Owner: my_user
--

ALTER TABLE ONLY public.sections
    ADD CONSTRAINT sections_pk PRIMARY KEY (section_id);


--
-- TOC entry 3297 (class 2606 OID 16440)
-- Name: students students_pk; Type: CONSTRAINT; Schema: public; Owner: my_user
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pk PRIMARY KEY (student_id);


--
-- TOC entry 3295 (class 2606 OID 16425)
-- Name: teachers teachers_pk; Type: CONSTRAINT; Schema: public; Owner: my_user
--

ALTER TABLE ONLY public.teachers
    ADD CONSTRAINT teachers_pk PRIMARY KEY (teacher_id);


--
-- TOC entry 3279 (class 2606 OID 16411)
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: my_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- TOC entry 3281 (class 2606 OID 16413)
-- Name: users users_pass_unique; Type: CONSTRAINT; Schema: public; Owner: my_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pass_unique UNIQUE (password);


--
-- TOC entry 3283 (class 2606 OID 16415)
-- Name: users users_phone_unique; Type: CONSTRAINT; Schema: public; Owner: my_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_phone_unique UNIQUE (phone_number);


--
-- TOC entry 3285 (class 2606 OID 16400)
-- Name: users users_pk; Type: CONSTRAINT; Schema: public; Owner: my_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pk PRIMARY KEY (user_id);


--
-- TOC entry 3287 (class 2606 OID 16409)
-- Name: users users_unique; Type: CONSTRAINT; Schema: public; Owner: my_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_unique UNIQUE (username);


--
-- TOC entry 3301 (class 2606 OID 16446)
-- Name: students students_sections_fk; Type: FK CONSTRAINT; Schema: public; Owner: my_user
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_sections_fk FOREIGN KEY (section_id) REFERENCES public.sections(section_id);


--
-- TOC entry 3302 (class 2606 OID 16441)
-- Name: students students_users_fk; Type: FK CONSTRAINT; Schema: public; Owner: my_user
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_users_fk FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- TOC entry 3299 (class 2606 OID 16431)
-- Name: teachers teachers_sections_fk; Type: FK CONSTRAINT; Schema: public; Owner: my_user
--

ALTER TABLE ONLY public.teachers
    ADD CONSTRAINT teachers_sections_fk FOREIGN KEY (section_id) REFERENCES public.sections(section_id);


--
-- TOC entry 3300 (class 2606 OID 16426)
-- Name: teachers teachers_users_fk; Type: FK CONSTRAINT; Schema: public; Owner: my_user
--

ALTER TABLE ONLY public.teachers
    ADD CONSTRAINT teachers_users_fk FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- TOC entry 3298 (class 2606 OID 16451)
-- Name: users users_roles_fk; Type: FK CONSTRAINT; Schema: public; Owner: my_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_roles_fk FOREIGN KEY (role_id) REFERENCES public.roles(role_id);


-- Completed on 2025-11-02 14:10:14

--
-- PostgreSQL database dump complete
--


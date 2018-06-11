--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.8
-- Dumped by pg_dump version 9.6.8

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: Hinh; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Hinh" (
    "MaHinh" integer NOT NULL,
    "DuongDan" character varying(50)
);


ALTER TABLE public."Hinh" OWNER TO postgres;

--
-- Name: LoaiSP; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."LoaiSP" (
    "MaLoai" character varying(5) NOT NULL,
    "TenLoai" character varying(100)
);


ALTER TABLE public."LoaiSP" OWNER TO postgres;

--
-- Name: PhienDauGia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."PhienDauGia" (
    "MaPhien" character varying(5) NOT NULL,
    "MaSP" character varying(5),
    "TimeBatDau" character varying(10),
    "TimeDau" character varying(10),
    "GiaThapNhat" integer,
    "GiaHienTai" integer,
    "MaPhieuDauThang" character varying(5),
    "MaTTPhienDG" character varying(5)
);


ALTER TABLE public."PhienDauGia" OWNER TO postgres;

--
-- Name: PhieuDG; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."PhieuDG" (
    "MaPhieu" character varying(5) NOT NULL,
    "MaTK" character varying(5),
    "MaTTPhieu" character varying(5),
    "MaPhienDG" character varying(5),
    "GiaDau" integer
);


ALTER TABLE public."PhieuDG" OWNER TO postgres;

--
-- Name: SanPham; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SanPham" (
    "MaSP" character varying(5) NOT NULL,
    "TenSP" character varying(100),
    "MaLoai" character varying(5),
    "DacTa" character varying(250),
    "HinhAnh" integer
);


ALTER TABLE public."SanPham" OWNER TO postgres;

--
-- Name: TTPhienDauGia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."TTPhienDauGia" (
    "MaTT" character varying(5) NOT NULL,
    "TenTT" character varying(100)
);


ALTER TABLE public."TTPhienDauGia" OWNER TO postgres;

--
-- Name: TTPhieuDG; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."TTPhieuDG" (
    "MaTT" character varying(5) NOT NULL,
    "TenTT" character varying(100)
);


ALTER TABLE public."TTPhieuDG" OWNER TO postgres;

--
-- Name: TaiKhoan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."TaiKhoan" (
    "MaTK" character varying(5) NOT NULL,
    "TenDN" character varying(100),
    "MatKhau" character varying(100),
    "TenHienThi" character varying(100),
    "Email" character varying(100),
    "SDT" character varying(15),
    "DiaChi" character varying(100),
    "Quyen" integer
);


ALTER TABLE public."TaiKhoan" OWNER TO postgres;

--
-- Name: ThamSo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ThamSo" (
    "MaTS" integer NOT NULL,
    "GiaTri" integer
);


ALTER TABLE public."ThamSo" OWNER TO postgres;

--
-- Name: Hinh Hinh_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Hinh"
    ADD CONSTRAINT "Hinh_pkey" PRIMARY KEY ("MaHinh");


--
-- Name: LoaiSP LoaiSP_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."LoaiSP"
    ADD CONSTRAINT "LoaiSP_pkey" PRIMARY KEY ("MaLoai");


--
-- Name: PhienDauGia PhienDauGia_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PhienDauGia"
    ADD CONSTRAINT "PhienDauGia_pkey" PRIMARY KEY ("MaPhien");


--
-- Name: PhieuDG PhieuDG_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PhieuDG"
    ADD CONSTRAINT "PhieuDG_pkey" PRIMARY KEY ("MaPhieu");


--
-- Name: SanPham SanPham_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SanPham"
    ADD CONSTRAINT "SanPham_pkey" PRIMARY KEY ("MaSP");


--
-- Name: TTPhienDauGia TTPhienDauGia_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TTPhienDauGia"
    ADD CONSTRAINT "TTPhienDauGia_pkey" PRIMARY KEY ("MaTT");


--
-- Name: TTPhieuDG TTPhieuDG_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TTPhieuDG"
    ADD CONSTRAINT "TTPhieuDG_pkey" PRIMARY KEY ("MaTT");


--
-- Name: TaiKhoan TaiKhoan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TaiKhoan"
    ADD CONSTRAINT "TaiKhoan_pkey" PRIMARY KEY ("MaTK");


--
-- Name: ThamSo ThamSo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ThamSo"
    ADD CONSTRAINT "ThamSo_pkey" PRIMARY KEY ("MaTS");


--
-- Name: fki_FK_PhienDauGia_PhieuDG; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK_PhienDauGia_PhieuDG" ON public."PhienDauGia" USING btree ("MaPhieuDauThang");


--
-- Name: fki_FK_PhienDauGia_SanPham; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK_PhienDauGia_SanPham" ON public."PhienDauGia" USING btree ("MaSP");


--
-- Name: fki_FK_PhienDauGia_TTPhienDG; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK_PhienDauGia_TTPhienDG" ON public."PhienDauGia" USING btree ("MaTTPhienDG");


--
-- Name: fki_FK_PhieuDG_PhienDauGia; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK_PhieuDG_PhienDauGia" ON public."PhieuDG" USING btree ("MaPhienDG");


--
-- Name: fki_FK_PhieuDG_TTPhieuDG; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK_PhieuDG_TTPhieuDG" ON public."PhieuDG" USING btree ("MaTTPhieu");


--
-- Name: fki_FK_PhieuDG_TaiKhoa; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK_PhieuDG_TaiKhoa" ON public."PhieuDG" USING btree ("MaTK");


--
-- Name: fki_FK_SP_Hinh; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK_SP_Hinh" ON public."SanPham" USING btree ("HinhAnh");


--
-- Name: fki_FK_SP_LoaiSP; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK_SP_LoaiSP" ON public."SanPham" USING btree ("MaLoai");


--
-- Name: PhienDauGia FK_PhienDauGia_PhieuDG; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PhienDauGia"
    ADD CONSTRAINT "FK_PhienDauGia_PhieuDG" FOREIGN KEY ("MaPhieuDauThang") REFERENCES public."PhieuDG"("MaPhieu");


--
-- Name: PhienDauGia FK_PhienDauGia_SanPham; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PhienDauGia"
    ADD CONSTRAINT "FK_PhienDauGia_SanPham" FOREIGN KEY ("MaSP") REFERENCES public."SanPham"("MaSP");


--
-- Name: PhienDauGia FK_PhienDauGia_TTPhienDG; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PhienDauGia"
    ADD CONSTRAINT "FK_PhienDauGia_TTPhienDG" FOREIGN KEY ("MaTTPhienDG") REFERENCES public."TTPhienDauGia"("MaTT");


--
-- Name: PhieuDG FK_PhieuDG_PhienDauGia; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PhieuDG"
    ADD CONSTRAINT "FK_PhieuDG_PhienDauGia" FOREIGN KEY ("MaPhienDG") REFERENCES public."PhienDauGia"("MaPhien");


--
-- Name: PhieuDG FK_PhieuDG_TTPhieuDG; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PhieuDG"
    ADD CONSTRAINT "FK_PhieuDG_TTPhieuDG" FOREIGN KEY ("MaTTPhieu") REFERENCES public."TTPhieuDG"("MaTT");


--
-- Name: PhieuDG FK_PhieuDG_TaiKhoa; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PhieuDG"
    ADD CONSTRAINT "FK_PhieuDG_TaiKhoa" FOREIGN KEY ("MaTK") REFERENCES public."TaiKhoan"("MaTK");


--
-- Name: SanPham FK_SP_Hinh; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SanPham"
    ADD CONSTRAINT "FK_SP_Hinh" FOREIGN KEY ("HinhAnh") REFERENCES public."Hinh"("MaHinh");


--
-- Name: SanPham FK_SP_LoaiSP; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SanPham"
    ADD CONSTRAINT "FK_SP_LoaiSP" FOREIGN KEY ("MaLoai") REFERENCES public."LoaiSP"("MaLoai");


--
-- PostgreSQL database dump complete
--


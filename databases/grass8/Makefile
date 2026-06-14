PORTNAME=	grass
DISTVERSION=	8.4.2
PORTREVISION=	4
CATEGORIES=	databases geography
MASTER_SITES=	https://grass.osgeo.org/%SUBDIR%/ \
		http://grass.cict.fr/%SUBDIR%/ \
		http://grass.fbk.eu/%SUBDIR%/ \
		http://grass.gis-lab.info/%SUBDIR%/ \
		http://grass.meteo.uni.wroc.pl/%SUBDIR%/ \
		http://grass.polytechnic.edu.na/%SUBDIR%/ \
		http://grass.unibuc.ro/%SUBDIR%/ \
		http://mirrors.ibiblio.org/grass/%SUBDIR%/ \
		http://pinus.gntech.ac.kr/grass/%SUBDIR%/ \
		http://wgbis.ces.iisc.ernet.in/grass/%SUBDIR%/ \
		http://wgrass.media.osaka-cu.ac.jp/grassh/%SUBDIR%/
MASTER_SITE_SUBDIR=	grass${VER}/source
PKGNAMESUFFIX=	8

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Open source Geographical Information System (GIS)
WWW=		https://grass.osgeo.org/

LICENSE=	gpl2+
LICENSE_FILE=	${WRKSRC}/GPL.TXT

BUILD_DEPENDS=	${PY_NUMPY} \
		${PYTHON_PKGNAMEPREFIX}six>0:devel/py-six@${PY_FLAVOR}
LIB_DEPENDS=	libfftw3.so:math/fftw3 \
		libfontconfig.so:x11-fonts/fontconfig \
		libfreetype.so:print/freetype2 \
		libgdal.so:graphics/gdal \
		libgeos.so:graphics/geos \
		libgeotiff.so:graphics/libgeotiff \
		libpng.so:graphics/png \
		libproj.so:graphics/proj \
		libtiff.so:graphics/tiff \
		libzstd.so:archivers/zstd
RUN_DEPENDS=	${PY_NUMPY} \
		${PYTHON_PKGNAMEPREFIX}six>0:devel/py-six@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}sqlite3>0:databases/py-sqlite3@${PY_FLAVOR}

USES=		blaslapack compiler:c11 gl gmake gnome iconv jpeg perl5 \
		pkgconfig python readline shebangfix sqlite xorg
SHEBANG_GLOB=	*.py
SHEBANG_LANG=	nviz
nviz_OLD_CMD=	nviz
nviz_CMD=	${PREFIX}/${GRASS_INST_DIR}/bin/nviz
USE_XORG=	ice sm x11 xext xi xmu xrender xt
USE_GL=		gl glu
USE_GNOME=	cairo
USE_WX=		3.2
WX_COMPS=	python:run wx
GNU_CONFIGURE=	yes

CONFIGURE_ARGS=	--enable-largefile \
		--exec-prefix=${LOCALBASE} \
		--prefix=${LOCALBASE} \
		--with-blas \
		--with-cairo \
		--with-freetype \
		--with-freetype-includes=${LOCALBASE}/include/freetype2 \
		--with-gdal=${LOCALBASE}/bin/gdal-config \
		--with-geos=${LOCALBASE}/bin/geos-config \
		--with-includes=${LOCALBASE}/include \
		--with-lapack \
		--with-libs=${LOCALBASE}/lib \
		--with-opengl-includes=${LOCALBASE}/include/ \
		--with-opengl-libs=${LOCALBASE}/lib/ \
		--with-proj-includes=${LOCALBASE}/include \
		--with-proj-libs=${LOCALBASE}/lib \
		--with-proj-share=${LOCALBASE}/share/proj \
		--with-proj=${LOCALBASE}/bin/proj \
		--with-pthread=yes \
		--with-readline \
		--with-wxwidgets=${WX_CONFIG}

CFLAGS+=	-std=c11

SUB_LIST=	PYTHON_CMD=${PYTHON_CMD}
BINARY_ALIAS=	python3=${PYTHON_CMD}
ALL_TARGET=	default
USE_LDCONFIG=	${PREFIX}/${GRASS_INST_DIR}/lib
MAKE_ENV+=	TARGET="${CONFIGURE_TARGET}"
VER=		${PORTVERSION:R:C/\.//}

PLIST_SUB=	GRASS_INST_DIR="${GRASS_INST_DIR}" \
		MAJVER="${PKGNAMESUFFIX}" \
		VER="${VER}" \
		VERS="${PORTVERSION:C/([0-9]+).([0-9]+)(.*)/\1.\2/}" \
		VERSION="${PORTVERSION}"

OPTIONS_DEFINE=		NETCDF NLS PDAL
OPTIONS_MULTI=		DB
OPTIONS_MULTI_DB=	MYSQL ODBC PGSQL
OPTIONS_DEFAULT=	NETCDF NLS PDAL PGSQL
OPTIONS_SUB=		yes

PDAL_DESC=		Enable points cloud data modules
DB_DESC=		Database support
MYSQL_USES=		mysql
MYSQL_CONFIGURE_ON=	--with-mysql \
			--with-mysql-includes=${LOCALBASE}/include/mysql \
			--with-mysql-libs=${LOCALBASE}/lib/mysql
NETCDF_CONFIGURE_ON=	--with-netcdf=${LOCALBASE}/bin/nc-config
NETCDF_LIB_DEPENDS=	libnetcdf.so:science/netcdf
NLS_CONFIGURE_WITH=	nls
NLS_USES=		gettext
ODBC_LIB_DEPENDS=	libodbc.so:databases/unixODBC
ODBC_CONFIGURE_WITH=	odbc
PDAL_CONFIGURE_ON=	--with-pdal=${LOCALBASE}/bin/pdal-config
PDAL_LIB_DEPENDS=	libpdalcpp.so:math/pdal
PGSQL_USES=		pgsql
PGSQL_CONFIGURE_WITH=	postgres

.if exists(/usr/include/omp.h)
CONFIGURE_ARGS+=	--with-openmp
.endif

.include <bsd.port.pre.mk>

.if !defined (GRASS_INST_DIR)
GRASS_INST_DIR=	${PORTNAME}${VER}
.endif

MANDIRS=	${PREFIX}/grass${VER}/docs/man/man1

post-patch:
	${REINPLACE_CMD} \
		's|= python3|= ${PYTHON_CMD:T}|' ${WRKSRC}/include/Make/Platform.make.in
	${REINPLACE_CMD} \
		's|$$(ARCH)|$$(TARGET)|g' ${WRKSRC}/include/Make/Grass.make
# Replace hardcoded python interpreter to PYTHON_CMD
	${REINPLACE_CMD} 's|"GRASS_PYTHON", "python"|"GRASS_PYTHON", "${PYTHON_CMD}"|g' \
		${WRKSRC}/scripts/wxpyimgview/wxpyimgview.py
	${REINPLACE_CMD} \
		's|environ\["GRASS_PYTHON"\] = "python3"|environ["GRASS_PYTHON"] = "${PYTHON_CMD}"|g' \
		${WRKSRC}/python/grass/script/setup.py

post-install:
	${RM} -rf ${FAKE_DESTDIR}${PREFIX}/${GRASS_INST_DIR}/demolocation/PERMANENT/.tmp/

# STRIP PART
	${STRIP_CMD} ${FAKE_DESTDIR}${PREFIX}/${GRASS_INST_DIR}/bin/*
	${STRIP_CMD} ${FAKE_DESTDIR}${PREFIX}/${GRASS_INST_DIR}/driver/db/*
.for i in clean_temp current_time_s_ms echo i.find lock run r.watershed/seg \
	r.watershed/ram lister/vector lister/cell
	${STRIP_CMD} ${FAKE_DESTDIR}${PREFIX}/${GRASS_INST_DIR}/etc/${i}
.endfor
	${STRIP_CMD} ${FAKE_DESTDIR}${PREFIX}/${GRASS_INST_DIR}/lib/*
	${STRIP_CMD} ${FAKE_DESTDIR}${PREFIX}/${GRASS_INST_DIR}/utils/g.echo

# symlink grass8
	${LN} -sf ${PORTNAME} \
		${PREFIX}/bin/${PORTNAME}${PKGNAMESUFFIX}
.include <bsd.port.post.mk>

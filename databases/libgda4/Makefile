# $MidnightBSD$

PORTNAME=	libgda
PORTVERSION?=	4.2.12
PORTREVISION?=	1
CATEGORIES=	databases gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2
PKGNAMESUFFIX=	4

MAINTAINER?=	ports@MidnightBSD.org
COMMENT?=	Provides uniform access to different kinds of data sources

LICENSE=	gpl2

USES=		tar:xz
LIBGDA4_SLAVE?=	no

.if !defined(REFERENCE_PORT)

BUILD_DEPENDS=	g-ir-scanner:${PORTSDIR}/devel/gobject-introspection
LIB_DEPENDS=	libpopt.so:${PORTSDIR}/devel/popt \
		libgcrypt.so:${PORTSDIR}/security/libgcrypt \
    		libsoup-2.so:${PORTSDIR}/devel/libsoup \
		libjson-glib-1.so:${PORTSDIR}/devel/json-glib
RUN_DEPENDS=	${LOCALBASE}/lib/girepository-1.0/GObject-2.0.typelib:${PORTSDIR}/devel/gobject-introspection

USES+=		gettext gmake libtool pathfix pkgconfig
USE_GNOME=	gnomeprefix glib20 libxslt intlhack referencehack
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
MAKE_JOBS_UNSAFE=yes
CONFIGURE_ARGS=	--without-oracle \
		--disable-crypto \
		--enable-introspection=no
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LIBS="-L${LOCALBASE}/lib -lintl"

.if ${LIBGDA4_SLAVE}=="no"
OPTIONS=	UI "Build UI tools" on
.endif

.if defined(WITH_UI)
INSTALLS_ICONS=	yes
.endif

.include <bsd.mport.options.mk>

VERSION=	4.0
PLIST_SUB=	VERSION=${VERSION}

.if ${LIBGDA4_SLAVE}=="no"
.if defined(WITH_UI)
CONFIGURE_ARGS+=--with-ui
BUILD_DEPENDS+=	xml2po:${PORTSDIR}/textproc/gnome-doc-utils
USE_GNOME+=	gtk20
PLIST_SUB+=	UI=""
.else
CONFIGURE_ARGS+=--without-ui
PLIST_SUB+=	UI="@comment "
.endif

MAN1=		gda-sql.1 gda-sql-4.0.1
.else
USE_GNOME+=	libgda4
.endif

.if ${LIBGDA4_SLAVE}=="bdb"
USE_BDB=		yes
CONFIGURE_ARGS+=	--with-bdb=${LOCALBASE}
.else
CONFIGURE_ARGS+=	--without-bdb
.endif

.if ${LIBGDA4_SLAVE}=="mysql"
USE_MYSQL=		yes
CONFIGURE_ARGS+=	--with-mysql=${LOCALBASE}
.else
CONFIGURE_ARGS+=	--without-mysql
.endif

.if ${LIBGDA4_SLAVE}=="postgresql"
USE_PGSQL=		yes
CONFIGURE_ARGS+=	--with-postgres=${LOCALBASE}
.else
CONFIGURE_ARGS+=	--without-postgres
.endif

CONFIGURE_ARGS+=	--without-firebird
CONFIGURE_ARGS+=	--without-mdb

# does not compile with java support
CONFIGURE_ARGS+=	--without-java

post-patch:
	@${REINPLACE_CMD} -e 's|-ldl||g' \
	    	${WRKSRC}/configure
	@${REINPLACE_CMD} -e 's|"db.h|"db${BDB_VER}/db.h|g' \
		-e 's|ldb47|l${BDB_LIB_NAME}|g' \
		-e 's|ldb|l${BDB_LIB_NAME}|g' \
		-e 's|libdb|lib${BDB_LIB_NAME}|g' \
		${WRKSRC}/configure
	@${REINPLACE_CMD} -e 's|<db\.h>|<db${BDB_VER}/db.h>|' \
	    	${WRKSRC}/providers/bdb/gda-bdb-provider.c \
		${WRKSRC}/providers/bdb/gda-bdb-test.c
.if ${LIBGDA4_SLAVE}!="no"
#. for d in msql firebird odbc freetds mdb ldap mysql sqlite postgres
. for d in bdb jdbc mdb mysql postgres reuseable/postgres reuseable/mysql
	@${REINPLACE_CMD} -e 's|$$(top_builddir)/libgda/libgda-4.0.la|${LOCALBASE}/lib/libgda-4.0.la|g' \
		${WRKSRC}/providers/${d}/Makefile.in
. endfor
.endif

pre-build:
.if ${LIBGDA4_SLAVE}=="postgresql"
	cd ${WRKSRC}/providers/reuseable/postgres && ${GMAKE} libgda-postgres.la
.endif

.if ${LIBGDA4_SLAVE}=="mysql"
	cd ${WRKSRC}/providers/reuseable/mysql && ${GMAKE} libgda-mysql.la
.endif

.if ${LIBGDA4_SLAVE}=="no"
post-install:
	${INSTALL_DATA} ${WRKSRC}/data/config \
		${PREFIX}/etc/libgda-${VERSION}/config.sample
.endif

.include <bsd.port.mk>
.endif

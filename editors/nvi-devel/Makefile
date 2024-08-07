PORTNAME=	nvi
PORTVERSION=	1.81.6
PORTREVISION=	5
CATEGORIES=	editors
MASTER_SITES=	http://garage.linux.student.kuleuven.be/~skimo/nvi/devel/ \
		http://www.kotnet.org/~skimo/nvi/devel/ \
		ftp://ftp.stack.nl/pub/users/johans/nvi/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Development snapshot of the world-renown nvi editor

LICENSE=	bsd3

CONFLICTS_INSTALL=	nvi-m17n-[0-9]* xnview-[0-9]*

OPTIONS_DEFINE=	WIDECHAR
OPTIONS_DEFAULT=WIDECHAR
WIDECHAR_DESC=	Enable wide-character support (UTF-8)

WRKSRC=			${WRKDIR}/${DISTNAME}/build.unix
GNU_CONFIGURE=		yes
USE_LDCONFIG=		yes
USES=			iconv libtool pkgconfig tar:bzip2
USE_BDB=		48+
CONFIGURE_ARGS+=	--with-db-prefix=${LOCALBASE} \
			--program-prefix=n
CONFIGURE_SCRIPT=	../dist/configure

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MWIDECHAR}
CONFIGURE_ARGS+=	--enable-widechar
.endif

CPPFLAGS+=		-I${BDB_INCLUDE_DIR} -I${LOCALBASE}/include
LDFLAGS+=		-L${BDB_LIB_DIR} -L${LOCALBASE}/lib

# configure is 555, so you can't do a "make configure" as non-root.
post-patch:
	@${REINPLACE_CMD} -e '/libvi_la_LIBADD =/s,$$, ${ICONV_LIB},' \
		${WRKSRC}/../dist/Makefile.in
	@${REINPLACE_CMD} -e 's,-ldb,-l${BDB_LIB_NAME},g' \
		${WRKSRC}/../dist/configure
	@${CHMOD} 755 ${WRKSRC}/../dist/configure

.include <bsd.port.mk>

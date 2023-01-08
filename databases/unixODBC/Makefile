PORTNAME=	unixODBC
PORTVERSION=	2.3.11
PORTREVISION=	0
CATEGORIES=	databases
MASTER_SITES=	http://www.unixodbc.org/ \
		ftp://ftp.unixodbc.org/pub/unixODBC/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	ODBC library suite for Unix
WWW=		http://www.unixodbc.org/

LICENSE=	gpl2 lgpl2.1
LICENSE_COMB=	multi

OPTIONS_DEFINE=	DOCS

CONFLICTS=	libiodbc-[0-9]* virtuoso-*

USES=		cpe iconv libtool:keepla
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--enable-static --enable-shared \
		--with-libiconv-prefix=${LOCALBASE}
CONFIGURE_ENV=	ac_cv_header_msql_h=no
CONFIGURE_TARGET=	${ARCH}-portbld-freebsd11.4
USE_LDCONFIG=	yes

PORTDOCS=	*

post-patch:
	@${REINPLACE_CMD} -e 's|\.ini$$|.ini.sample|' ${WRKSRC}/Makefile.in
	touch ${WRKSRC}/Interix/config.sub

post-install:
	@${MKDIR} ${STAGEDIR}${DOCSDIR}
	cd ${WRKSRC}/doc && ${COPYTREE_SHARE} . ${STAGEDIR}${DOCSDIR} \
	    "-not -name 'Makefile*'"

.include <bsd.port.mk>

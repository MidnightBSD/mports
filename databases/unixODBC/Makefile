PORTNAME=	unixODBC
PORTVERSION=	2.3.12
PORTREVISION=	1
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

USES=		cpe iconv libtool:keepla readline
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--enable-static --enable-shared \
		--with-included-ltdl \
		--with-libiconv-prefix=${LOCALBASE}
CONFIGURE_ENV=	ac_cv_header_msql_h=no
CONFIGURE_TARGET=	${ARCH}-portbld-freebsd12.4
USE_LDCONFIG=	yes

PORTDOCS=	*

post-patch:
	@${REINPLACE_CMD} -e 's|\.ini$$|.ini.sample|' ${WRKSRC}/Makefile.in
	touch ${WRKSRC}/Interix/config.sub

post-install:
	@${MKDIR} ${DOCSDIR}
	cd ${WRKSRC}/doc && ${COPYTREE_SHARE} . ${DOCSDIR} \
	    "-not -name 'Makefile*'"

.include <bsd.port.mk>

# $MidnightBSD: mports/security/nmap/Makefile,v 1.7 2012/02/05 03:45:27 laffer1 Exp $
# $FreeBSD: ports/security/nmap/Makefile,v 1.122 2010/09/03 21:16:38 ohauer Exp $

PORTNAME=	nmap
PORTVERSION=	5.51
PORTREVISION=	1
CATEGORIES=	security ipv6
MASTER_SITES=	http://nmap.org/dist/ \
		FREEBSD_LOCAL/ohauer

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Port scanning utility for large networks
LICENSE=	gpl2

LIB_DEPENDS=	pcre.1:${PORTSDIR}/devel/pcre

USE_LUA=	5.1
LUA_COMPS=	lua
USE_BZIP2=	yes
USE_GMAKE=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--without-localdirs \
		--without-zenmap \
		--without-ndiff \
		--with-libpcre=${LOCALBASE} \
		--with-liblua=${LOCALBASE}
CONFIGURE_ENV=	LUA_INCDIR="${LUA_INCDIR}" LUA_LIBDIR="${LUA_LIBDIR}"

MANLANG=	"" de es fr hr hu it jp pl pt_BR pt_PT ro ru sk zh
MAN1=		nmap.1
MAN1_EN=	ncat.1 nping.1

.ifndef WITHOUT_SSL
USE_OPENSSL=	yes
CONFIGURE_ARGS+=	--with-openssl=${OPENSSLBASE}
CONFIGURE_ENV+=		CFLAGS="${CFLAGS} -I${OPENSSLINC}"
PLIST_SUB+=		WITHSSL=""
.else
PKGNAMESUFFIX=		-nossl
CONFIGURE_ARGS+=	--without-openssl
PLIST_SUB+=		WITHSSL="@comment "
.endif

PORTDOCS=	CHANGELOG HACKING
EXAMPLES=	docs/sample-script.nse
PORTEXAMPLES=	${EXAMPLES:T}

# XXX limit results if we do a grep in the sources!
post-extract:
	@${RM} -rf ${WRKSRC}/mswin32

post-configure:
	@${REINPLACE_CMD} -e "s|^DESTDIR *=|& ${DESTDIR}|" ${WRKSRC}/Makefile

post-install:
.ifndef NOPORTDOCS
	@${MKDIR} ${DOCSDIR}
.	for i in ${PORTDOCS}
		@${INSTALL_DATA} ${WRKSRC}/${i} ${DOCSDIR}
.	endfor
.endif
.ifndef NOPORTEXAMPLES
	@${MKDIR} ${EXAMPLESDIR}
.	for i in ${EXAMPLES}
		@${INSTALL_DATA} ${WRKSRC}/${i} ${EXAMPLESDIR}
.	endfor
.endif

.include <bsd.port.mk>

# $MidnightBSD$

PORTNAME=	idnkit
PORTVERSION=	1.0
PORTREVISION=	6
CATEGORIES=	dns
MASTER_SITES=	http://www.nic.ad.jp/ja/idn/idnkit/download/sources/
DISTNAME=	${PORTNAME}-${PORTVERSION}-src

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library to handle internationalized domain names

LICENSE=	JPNIC
LICENSE_NAME=	Japan Network Information Center license
LICENSE_FILE=	${WRKSRC}/LICENSE.txt
LICENSE_PERMS=	dist-mirror dist-sell pkg-mirror pkg-sell auto-accept

USES=		iconv libtool
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	${ICONV_CONFIGURE_BASE} \
		--enable-runidn \
		--enable-extra-ace

USE_LDCONFIG=	yes

OPTIONS_DEFINE=	DOCS

post-patch:
	@${FIND} ${WRKSRC} -name Makefile.in | ${XARGS} ${REINPLACE_CMD} -e \
		's|mode=link $$(LD)|mode=link $$(CC)|'

post-install:
	@${MKDIR} ${DOCSDIR}/ja
	(cd ${WRKSRC} && ${INSTALL_DATA} ChangeLog NEWS README \
		${DOCSDIR})
	${INSTALL_DATA} ${WRKSRC}/README.ja ${DOCSDIR}/ja
	(cd ${PREFIX}/lib && ln -sf libidnkit.so.1.0.2 libidnkit.so)
	(cd ${PREFIX}/lib && ln -sf libidnkitlite.so.1.0.2 libidnkitlite.so)
	(cd ${PREFIX}/lib && ln -sf libidnkitres.so.1.0.1 libidnkitres.so) 
	${STRIP_CMD} ${PREFIX}/lib/*.so.*

.include <bsd.port.mk>

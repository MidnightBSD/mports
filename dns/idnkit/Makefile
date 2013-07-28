# $MidnightBSD: mports/dns/idnkit/Makefile,v 1.3 2012/09/08 22:48:13 laffer1 Exp $

PORTNAME=	idnkit
PORTVERSION=	1.0
PORTREVISION=	2
CATEGORIES=	dns
MASTER_SITES=	http://www.nic.ad.jp/ja/idn/idnkit/download/sources/
DISTNAME=	${PORTNAME}-${PORTVERSION}-src

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A library to handle internationalized domain names

LICENSE=	other
#bsd 4 ish

USE_AUTOTOOLS=	libtool
USES=		iconv
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-libiconv=${LOCALBASE} \
		--enable-runidn \
		--enable-extra-ace

USE_LDCONFIG=	yes

MAN1=		idnconv.1 \
		runidn.1
MAN3=		libidnkit.3 \
		libidnkitlite.3
MAN5=		idn.conf.5 \
		idnalias.conf.5 \
		idnrc.5
MANCOMPRESSED=	no

DOCS_EN=	ChangeLog NEWS README
DOCS_JA=	README.ja

post-patch:
	@${FIND} ${WRKSRC} -name Makefile.in | ${XARGS} ${REINPLACE_CMD} -e \
		's|mode=link $$(LD)|mode=link $$(CC)|'

post-install:
	${INSTALL_DATA} ${WRKSRC}/tools/runidn/libidnkitres.la ${PREFIX}/lib
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}/ja
.for f in ${DOCS_EN}
	${INSTALL_DATA} ${WRKSRC}/${f} ${DOCSDIR}/
.endfor
.for f in ${DOCS_JA}
	${INSTALL_DATA} ${WRKSRC}/${f} ${DOCSDIR}/ja/
.endfor
.endif

.include <bsd.port.mk>

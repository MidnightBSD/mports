# $MidnightBSD$

PORTNAME=	libidn
DISTVERSION=	1.34
CATEGORIES=	dns
MASTER_SITES=	GNU

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Internationalized Domain Names command line tool

LICENSE=	gpl2 lgpl3
LICENSE_COMB=	dual

FAKE_OPTS+=	trueprefix

USES=		gmake iconv libtool localbase makeinfo pathfix perl5 pkgconfig
GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip
USE_LDCONFIG=	yes
USE_PERL5=	build

INFO=		libidn

OPTIONS_DEFINE=	DOCS NLS

OPTIONS_SUB=	yes

NLS_CONFIGURE_ENABLE=	nls
NLS_USES=		gettext

post-patch:
	@${REINPLACE_CMD} -e '/^Libs.private:/s/$$/ @LTLIBINTL@/' \
		${WRKSRC}/libidn.pc.in

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
.for i in FAQ NEWS README
	${INSTALL_DATA} ${WRKSRC}/${i} ${FAKE_DESTDIR}${DOCSDIR}
.endfor

.include <bsd.port.mk>

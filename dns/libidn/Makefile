PORTNAME=	libidn
DISTVERSION=	1.42
CATEGORIES=	dns
MASTER_SITES=	GNU

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Internationalized Domain Names command line tool
WWW=		https://www.gnu.org/software/libidn/

LICENSE=	gpl2+ lgpl3+
LICENSE_COMB=	dual

FAKE_OPTS+=	trueprefix

USES=		cpe gmake iconv libtool localbase makeinfo pathfix perl5 pkgconfig
GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip
USE_LDCONFIG=	yes
USE_PERL5=	build
CPE_VENDOR=	gnu

INFO=		libidn

OPTIONS_DEFINE=	DOCS NLS

OPTIONS_SUB=	yes

NLS_CONFIGURE_ENABLE=	nls
NLS_USES=		gettext-runtime

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
.for i in FAQ NEWS README
	${INSTALL_DATA} ${WRKSRC}/${i} ${FAKE_DESTDIR}${DOCSDIR}
.endfor

.include <bsd.port.mk>

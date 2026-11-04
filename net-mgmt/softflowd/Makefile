PORTNAME=	softflowd
PORTVERSION=	1.0.0
DISTVERSIONPREFIX=	softflowd-
CATEGORIES=	net-mgmt

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Flow-based network traffic analyzer and exporter
WWW=		http://www.mindrot.org/softflowd.html

LICENSE=	bsd2

USES=		gmake autoreconf
GNU_CONFIGURE=	yes
GNU_CONFIGURE_MANPREFIX=${PREFIX}/share
USE_GITHUB=	yes
GH_ACCOUNT=	irino
USE_RC_SUBR=	${PORTNAME}

PLIST_FILES=	bin/softflowd bin/softflowctl \
		share/man/man8/softflowd.8.gz \
		share/man/man8/softflowctl.8.gz
PORTDOCS=	README

OPTIONS_DEFINE=	DOCS

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/${PORTDOCS} ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>

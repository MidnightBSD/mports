PORTNAME=	type1inst
PORTVERSION=	0.6.1
PORTREVISION=	4
CATEGORIES=	x11-fonts perl5
MASTER_SITES=	${MASTER_SITE_SUNSITE}
MASTER_SITE_SUBDIR=X11/xutils
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Script that helps install Postscript fonts in X Window System
LICENSE=	gpl2

.if !defined(WITHOUT_X11)
RUN_DEPENDS+=	${LOCALBASE}/bin/mkfontscale:x11-fonts/mkfontscale
.endif

USE_PERL5=	yes
NO_BUILD=	yes

post-patch:
	@${REINPLACE_CMD} -e 's:#!/usr/bin/perl:#!${PERL}:' ${WRKSRC}/type1inst ${WRKSRC}/t1embed

do-install:
	@${INSTALL_SCRIPT} ${WRKSRC}/type1inst ${PREFIX}/bin
	@${INSTALL_SCRIPT} ${WRKSRC}/t1embed ${PREFIX}/bin
	@${INSTALL_MAN} ${WRKSRC}/type1inst.man ${PREFIX}/man/man1/type1inst.1
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/README ${DOCSDIR}/README.type1inst
.endif

.include <bsd.port.mk>

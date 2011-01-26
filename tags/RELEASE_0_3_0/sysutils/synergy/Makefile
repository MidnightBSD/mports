# $MidnightBSD: mports/sysutils/synergy/Makefile,v 1.6 2010/09/04 15:38:24 laffer1 Exp $
# $FreeBSD: ports/sysutils/synergy/Makefile,v 1.14 2007/07/25 01:25:03 kevlo Exp $

PORTNAME=	synergy
PORTVERSION= 	1.3.1
PORTREVISION=	5
CATEGORIES=	sysutils
MASTER_SITES=	SF/${PORTNAME}2/Sources/${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Mouse and keyboard sharing utility
LICENSE=	gpl2

GNU_CONFIGURE=	yes
USE_XORG=	ice xtst x11 sm xproto recordproto:both xextproto inputproto
CONFIGURE_ENV=	PTHREAD_CFLAGS="${PTHREAD_CFLAGS}" \
		PTHREAD_LIBS="${PTHREAD_LIBS}"

DOCS=		AUTHORS COPYING ChangeLog INSTALL NEWS README

CONFLICTS=	synergy-plus-[0-9]*

post-patch:
	@${REINPLACE_CMD} -e 's|-Werror||' ${WRKSRC}/configure

post-install:
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
.for file in ${DOCS}
	@${INSTALL_DATA} ${WRKSRC}/${file} ${DOCSDIR}
.endfor
	@cd ${WRKSRC}/doc && ${TAR} cf - *.html *.css images | \
		${TAR} -C ${DOCSDIR} -xpf -
.endif
	${MKDIR} ${PREFIX}/share/examples/synergy
	${INSTALL_DATA} ${WRKSRC}/examples/synergy.conf ${PREFIX}/share/examples/synergy

.include <bsd.port.mk>

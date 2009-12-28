# $MidnightBSD: mports/shells/ibsh/Makefile,v 1.2 2007/05/17 17:36:06 ctriv Exp $

PORTNAME=	ibsh
PORTVERSION=	0.3e
CATEGORIES=	shells
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}/${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Restricted unix shell
LICENSE=	gpl2

USE_GMAKE=	yes
ALL_TARGET=	ibsh
INSTALL_TARGET=	ibsh_install

SUB_FILES=	pkg-message
PORTDOCS=	AUTHORS BUGS CONTRIBUTORS COPYING COPYRIGHT ChangeLog \
		INSTALL README TODO VERSION

.include <bsd.port.pre.mk>

post-patch:
	@${REINPLACE_CMD} -e 's|PATH_MAX|PATH_MAXb|g' ${WRKSRC}/delbadfiles.c ${WRKSRC}/ibsh.h
	@${REINPLACE_CMD} -e 's|/etc/ibsh|${PREFIX}/etc/ibsh|g' ${WRKSRC}/ibsh.h

post-install:
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S|^|${WRKSRC}/|} ${DOCSDIR}
.endif

.include <bsd.port.post.mk>

PORTNAME=	Horde_Role
PORTVERSION=	1.0.1
CATEGORIES=	devel www pear

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	PEAR installer role for Horde components
WWW=		https://pear.horde.org

PATCH_WRKSRC=	${WRKDIR}

USES=	horde cpe

post-install:
	@${MKDIR} ${STAGEDIR}${PREFIX}/${HORDE_DIR}
	@${TOUCH} ${STAGEDIR}${PREFIX}/${HORDE_DIR}/.keep_me
	@${ECHO_CMD} "${HORDE_DIR}/.keep_me" >> ${TMPPLIST}
	@${ECHO_CMD} "@unexec rmdir %D/${HORDE_DIR} 2>/dev/null || true" >> \
		${TMPPLIST}

.include <bsd.port.mk>

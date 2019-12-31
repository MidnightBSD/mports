PORTNAME=	erlang
PORTVERSION=	21.3
CATEGORIES=	lang parallel
MASTER_SITES=	http://www.erlang.org/download/
PKGNAMESUFFIX=	-man
DISTNAME=	otp_doc_man_${PORTVERSION}
DIST_SUBDIR=	erlang

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Manual pages for Erlang/OTP

LICENSE=	apache2

NO_ARCH=	yes
NO_BUILD=	yes
WRKSRC=		${WRKDIR}

do-install:
	@${ECHO_CMD} "MANPATH ${TRUE_PREFIX}/lib/erlang/man" > ${WRKDIR}/erlang.conf
	${INSTALL_DATA} ${WRKDIR}/erlang.conf ${STAGEDIR}${PREFIX}/etc/man.d/erlang.conf
	for SECTION in 1 3 4 6 7; do \
		cd ${WRKSRC}/man/ && ${COPYTREE_SHARE} man$${SECTION} ${STAGEDIR}${PREFIX}/lib/erlang; \
	done
	-${RM} -r ${STAGEDIR}${PREFIX}/lib/${ERLANG_LIB}/man/cat?

.include <bsd.port.mk>

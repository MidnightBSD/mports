# $MidnightBSD: mports/databases/memcachedb/Makefile,v 1.1 2008/08/02 19:09:52 laffer1 Exp $

PORTNAME=	memcachedb
PORTVERSION=	1.2.0
CATEGORIES=	databases
MASTER_SITES=	${MASTER_SITE_GOOGLE_CODE}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Distributed storage system designed for persistent
LICENSE=	bsd3

LIB_DEPENDS=	event-1.3e:${PORTSDIR}/devel/libevent

CFLAGS=		-I"${BDB_INCLUDE_DIR}"
CONFIUGRE_ARGS=	--enable-threads --with-bdb="${LOCALBASE}" \
		--with-libevent="${LOCALBASE}"
CONFIGURE_ENV=	CFLAGS="${CFLAGS}" LDFLAGS="${LDFLAGS}"
GNU_CONFIGURE=	yes
LDFLAGS=	-l"${BDB_LIB_NAME}" -L"${LOCALBASE}/lib"
MCDBDIR?=	/var/db/memcachedb
USE_BDB=	47+
USE_RC_SUBR=	${PORTNAME}

post-install:
	${MKDIR} ${MCDBDIR} || ${TRUE}
	${CHOWN} nobody:nobody ${MCDBDIR}

.include <bsd.port.mk>

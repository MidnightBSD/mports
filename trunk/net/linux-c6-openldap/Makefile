# $MidnightBSD$

PORTNAME=	openldap
PORTVERSION=	2.4.40
CATEGORIES=	net linux

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Lightweight Directory Access Protocol libraries (Linux CentOS ${LINUX_DIST_VER})

LICENSE=	openldap2.8

DESCR=		${.CURDIR}/../${PORTNAME}24-server/pkg-descr
RPMVERSION=	16.el6
USES=		linux:c6
USE_LDCONFIG=	yes
USE_LINUX=	cyrus-sasl2 nss nspr
USE_LINUX_RPM=	yes

OPTIONS_DEFINE=	DOCS

# do not install any openldap configuration directories/files
post-patch:
	@${RM} -r ${WRKSRC}/etc

# use a native openldap configuration directories/files
post-install:
	${MKDIR} ${STAGEDIR}${PREFIX}/etc
	${LN} -sf ${LOCALBASE}/etc/openldap ${STAGEDIR}${PREFIX}/etc/openldap

.include <bsd.port.mk>

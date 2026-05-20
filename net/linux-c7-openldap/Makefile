PORTNAME=	openldap
PORTVERSION=	2.4.44
DISTVERSIONSUFFIX=	-22.el7
PORTREVISION=	2
CATEGORIES=	net linux

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	LDAP libraries (Linux CentOS ${LINUX_DIST_VER})

LICENSE=	openldap2.8

SKIP_FAKE_ALL=	yes

USES=		linux:c7 cpe
USE_LDCONFIG=	yes
USE_LINUX=	cyrus-sasl2 nspr nss
USE_LINUX_RPM=	yes

CONFLICTS=	linux-c6-${PORTNAME}-[0-9]*
DESCR=		${.CURDIR}/../${PORTNAME}25-server/pkg-descr

OPTIONS_DEFINE=	DOCS

# do not install any openldap configuration directories/files
post-patch:
	@${RM} -r ${WRKSRC}/etc

# use a native openldap configuration directories/files
post-install:
	${MKDIR} ${PREFIX}/etc
	${LN} -sf ${LOCALBASE}/etc/openldap ${PREFIX}/etc/openldap

.include <bsd.port.mk>

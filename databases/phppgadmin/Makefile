PORTNAME=	phppgadmin
PORTVERSION=	7.14.5
DISTVERSIONPREFIX=	v
DISTVERSIONSUFFIX=	-mod
CATEGORIES=	databases www
PKGNAMESUFFIX=	${PHP_PKGNAMESUFFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Web Based Postgres Administration
WWW=		https://github.com/ReimuHakurei/phpPgAdmin

LICENSE=	gpl2

NO_ARCH=	yes
NO_BUILD=	yes
USES=		cpe tar:bzip2 php:web,flavors shebangfix
USE_GITHUB=	yes
GH_ACCOUNT=	ReimuHakurei
WRKSRC=		${WRKDIR}/phpPgAdmin-${DISTVERSION}${DISTVERSIONSUFFIX}

.if !defined(WITHOUT_PHP_DEPENDS)
USE_PHP=	pgsql session mbstring
.endif

CPE_VENDOR=	phppgadmin_project
SHEBANG_FILES=	lang/synch
PGADMDIR?=	www/phpPgAdmin
PLIST_SUB+=	PGADMDIR=${PGADMDIR}

pre-everything::
	@${ECHO_CMD} "# you can customize the installation directory"
	@${ECHO_CMD} "# by setting PGADMDIR in /etc/make.conf"

do-configure:
	${REINPLACE_CMD} -e "s|/usr/bin/pg|${LOCALBASE}/bin/pg|" \
		${WRKSRC}/conf/config.inc.php-dist
	${RM} -f ${WRKSRC}/conf/config.inc.php \
		${WRKSRC}/conf/config.inc.php-dist.bak

.include <bsd.port.pre.mk>

do-install:
	${MKDIR} ${PREFIX}/${PGADMDIR}
	${CP} -Rp ${WRKSRC}/ ${PREFIX}/${PGADMDIR}/

.include <bsd.port.post.mk>

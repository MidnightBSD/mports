PORTNAME=	cpio
PORTVERSION=	2.14
CATEGORIES=	archivers sysutils
MASTER_SITES=	${MASTER_SITE_GNU}
MASTER_SITE_SUBDIR=	${PORTNAME}
PKGNAMEPREFIX=	g

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNU copy-in/out (cpio)
WWW=		https://www.gnu.org/software/cpio/

LICENSE=	gpl3

TEST_DEPENDS=	autom4te:devel/autoconf

INFO=	cpio

USES=		cpe gettext tar:bzip2
GNU_CONFIGURE=	yes
CPE_VENDOR=	gnu

OPTIONS_DEFINE=	NLS
OPTIONS_SUB=	yes

CONFIGURE_ARGS=	--program-prefix="g" \
		--with-rmt=/etc/rmt \
		--infodir=${PREFIX}/${INFO_PATH}

NLS_USES=	gettext
NLS_CONFIGURE_ENABLE=	nls

.include <bsd.port.mk>

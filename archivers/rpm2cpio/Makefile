PORTNAME=	rpm2cpio
PORTVERSION=	1.4
CATEGORIES=	archivers
MASTER_SITES=	# none
DISTFILES=	# none

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Convert .rpm files to cpio format

LICENSE=	bsd2

CONFLICTS_INSTALL=	rpm4-*

NO_BUILD=	yes
NO_ARCH=	yes

PLIST_FILES=	bin/rpm2cpio.pl \
		bin/rpm2cpio

do-install:
	${INSTALL_SCRIPT} ${FILESDIR}/${PORTNAME} ${PREFIX}/bin/
# Also install as rpm2cpio.pl to not break existing scripts
	${LN} -f ${PREFIX}/bin/${PORTNAME} ${PREFIX}/bin/${PORTNAME}.pl

.include <bsd.port.mk>

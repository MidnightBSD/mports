PORTNAME=	flock
PORTVERPREFIX=	2.37
PORTVERSION=	${PORTVERPREFIX}.2
CATEGORIES=	sysutils
MASTER_SITES=	KERNEL_ORG/linux/utils/util-linux/v${PORTVERPREFIX}/
DISTNAME=	util-linux-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Manage locks from shell scripts
WWW=		https://www.kernel.org/pub/linux/utils/util-linux/

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		libtool pkgconfig

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--disable-nls

CFLAGS=		-D_WITH_CPU_SET_T

PLIST_FILES=	bin/flock share/man/man1/flock.1.gz \
		etc/bash_completion.d/flock

do-build:
	# skip building unneeded utils
	${MAKE} -C ${WRKSRC} flock

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/flock ${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/sys-utils/flock.1 \
		${PREFIX}/share/man/man1
	@${MKDIR} ${PREFIX}/etc/bash_completion.d
	${INSTALL_DATA} ${WRKSRC}/bash-completion/flock ${PREFIX}/etc/bash_completion.d

.include <bsd.port.mk>

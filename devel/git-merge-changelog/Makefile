PORTNAME=	git-merge-changelog
PORTVERSION=	1.0
PORTEPOCH=	1
CATEGORIES=	devel
MASTER_SITES=	https://ftp.gnu.org/gnu/vc-changelog/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Git "merge" driver for GNU style ChangeLog files
WWW=		https://www.gnu.org/software/vc-changelog/

LICENSE=	gpl3
LICENSE_FILE=	${WRKSRC}/COPYING

EXTRACT_DEPENDS=	automake>=1.15:devel/automake		\
			autoconf>=2.69:devel/autoconf

GNU_CONFIGURE=	yes

PLIST_FILES=	bin/${PORTNAME}

.include <bsd.port.mk>

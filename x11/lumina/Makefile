PORTNAME=	lumina
PORTVERSION=	1.6.2
PORTREVISION=	2
PORTEPOCH=	3
CATEGORIES=	x11
MASTER_SITES=   # none
DISTFILES=      # none
EXTRACT_ONLY=   # none

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Lumina Desktop Environment (meta-port)

LICENSE=	bsd3

RUN_DEPENDS=	lumina-core>=0:x11/lumina-core \
		lumina-coreutils>=0:x11/lumina-coreutils \
		lumina-archiver>=0:deskutils/lumina-archiver \
		lumina-calculator>=0:deskutils/lumina-calculator \
		lumina-fileinfo>=0:deskutils/lumina-fileinfo \
		lumina-fm>=0:deskutils/lumina-fm \
		lumina-pdf>=0:deskutils/lumina-pdf \
		lumina-photo>=0:deskutils/lumina-photo \
		lumina-screenshot>=0:deskutils/lumina-screenshot \
		lumina-textedit>=0:deskutils/lumina-textedit

# disabled due to build errors lumina-mediaplayer>=0:deskutils/lumina-mediaplayer \

NO_BUILD=	yes
NO_MTREE=	yes

CONFLICTS_INSTALL=	lumina-1.2.*

do-install: #fake

.include <bsd.port.mk>

# $MidnightBSD$

PORTNAME=	autossh
PORTVERSION=	1.4e
CATEGORIES=	security
MASTER_SITES=	http://www.harding.motd.ca/autossh/
EXTRACT_SUFX=	.tgz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Automatically restart SSH sessions and tunnels

LICENSE=	other

GNU_CONFIGURE=	yes

PORTDOCS=	CHANGES README

OPTIONS_DEFINE=	DOCS SSH_PORTABLE

SSH_PORTABLE_DESC=	Default to ports openssh (instead of base)

SSH_PORTABLE_CONFIGURE_ENV=	ac_cv_path_ssh=${LOCALBASE}/bin/ssh
SSH_PORTABLE_RUN_DEPENDS=	${LOCALBASE}/bin/ssh:security/openssh-portable

.include <bsd.port.mk>

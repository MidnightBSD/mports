PORTNAME=	projectcenter
PORTVERSION=	0.6.2
CATEGORIES=	devel gnustep
MASTER_SITES=	GNUSTEP/dev-apps
DISTNAME=	ProjectCenter-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Development environment for GNUstep
WWW=		http://www.gnustep.org/experience/ProjectCenter.html

LICENSE=	gpl2

BROKEN=		fails to link: libProjectCenter.so: undefined reference to __objc_ivar_offset_NSView._tracking_rects

USES=		gnustep
USE_GNUSTEP=	back build
USE_LDCONFIG=	${GNUSTEP_SYSTEM_LIBRARIES}

PLIST_SUB+=	FRAMEVERSION=${PORTVERSION}
MAKE_ENV+=	GNUSTEP_INSTALLATION_DOMAIN=SYSTEM

post-install:
	${STRIP_CMD} \
		${PREFIX}/GNUstep/System/Applications/ProjectCenter.app/ProjectCenter \
		${PREFIX}/GNUstep/System/Applications/ProjectCenter.app/Resources/Aggregate.project/Aggregate \
		${PREFIX}/GNUstep/System/Applications/ProjectCenter.app/Resources/Application.project/Application \
		${PREFIX}/GNUstep/System/Applications/ProjectCenter.app/Resources/Build.preferences/Build \
		${PREFIX}/GNUstep/System/Applications/ProjectCenter.app/Resources/Bundle.project/Bundle \
		${PREFIX}/GNUstep/System/Applications/ProjectCenter.app/Resources/EditorFSC.preferences/EditorFSC \
		${PREFIX}/GNUstep/System/Applications/ProjectCenter.app/Resources/Framework.project/Framework \
		${PREFIX}/GNUstep/System/Applications/ProjectCenter.app/Resources/Library.project/Library \
		${PREFIX}/GNUstep/System/Applications/ProjectCenter.app/Resources/Misc.preferences/Misc \
		${PREFIX}/GNUstep/System/Applications/ProjectCenter.app/Resources/ProjectCenter.debugger/ProjectCenter \
		${PREFIX}/GNUstep/System/Applications/ProjectCenter.app/Resources/ProjectCenter.editor/ProjectCenter \
		${PREFIX}/GNUstep/System/Applications/ProjectCenter.app/Resources/ProjectCenter.parser/ProjectCenter \
		${PREFIX}/GNUstep/System/Applications/ProjectCenter.app/Resources/ResourceSet.project/ResourceSet \
		${PREFIX}/GNUstep/System/Applications/ProjectCenter.app/Resources/Saving.preferences/Saving \
		${PREFIX}/GNUstep/System/Applications/ProjectCenter.app/Resources/Tool.project/Tool \
		${PREFIX}/GNUstep/System/Library/Frameworks/ProjectCenter.framework/Versions/${PORTVERSION}/libProjectCenter.so

.include <bsd.port.mk>

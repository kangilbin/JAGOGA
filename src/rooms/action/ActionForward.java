package rooms.action;

public class ActionForward {
	private boolean isRedirect = false;
	private String path = null;

	public boolean isRedirect() {
		return isRedirect;
	}

	public String getPath() {
		return path;
	}

	public void setRedirect(boolean b) {
		this.isRedirect = b;
	}

	public void setPath(String string) {
		this.path = string;
	}

}
